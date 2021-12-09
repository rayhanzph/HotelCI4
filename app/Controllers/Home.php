<?php 
namespace App\Controllers;
use CodeIgniter\Controller;
use App\Models\UserModel;
use App\Models\HotelModel;
use App\Models\BookingModel;
use App\Models\ImageModel;
use App\Models\PaymentModel;

class Home extends Controller
{
    public function index()
    {
        $data['session'] = session();
        $model = new HotelModel;
        $data['hotel'] = $model->getHome();
        echo view('home/index', $data);
    }

    public function hotel($type)
    {
        $data['session'] = session();
        $model = new HotelModel;
        $data['hotel'] = $model->getHome($type);
        echo view('home/hotel', $data);
    }

    public function detail($id)
    {
        $data['session'] = session();
        $model = new HotelModel;
        $model2 = new ImageModel;
        $data['hotel'] = $model->get($id);
        $data['image'] = $model2->get($id);
        echo view('home/detail', $data);
    }

    public function book($id)
    {
        $data['session'] = session();
        $model = new HotelModel;
        $model2 = new PaymentModel;
        $model3 = new UserModel;
        $data['user'] = $model3->get('user', $data['session']->user_id)->getRow();
        $data['hotel'] = $model->get($id);

        $data['start'] = $this->request->getPost('booking_date_start');
        $data['end'] = $this->request->getPost('booking_date_end');

        $dateStart = strtotime($this->request->getPost('booking_date_start'));
        $dateEnd = strtotime($this->request->getPost('booking_date_end'));
        $dateCalculate = $dateEnd - $dateStart;

        $dateTotal = floor($dateCalculate/(60*60*24));
        if($dateTotal == 0){
            $dateTotal = 1;
        }

        $data['total'] = $dateTotal;
        $data['payment'] = $model2->get();
        
        $totalPrice = $dateTotal * $data['hotel'][0]['item_price'];
        $data['totalPrice'] = $totalPrice;
        $data['totalPrice2'] = $totalPrice + 15000;

        $data['item_id'] = $id;

        if ($this->request->getMethod() !== 'post') {
            return redirect()->to('book');
        }

        echo view('home/book', $data);
    }

    public function bookProcess(){
        $data['session'] = session();
        $model = new BookingModel;
        $model2 = new UserModel;

        if ($this->request->getMethod() !== 'post') {
            return redirect()->to('book');
        }
        $upload = $this->request->getFile('booking_proof_of_payment');
        $upload->move(WRITEPATH . '../public/assets/images/proof');
        $data = array(
            'item_id' => $this->request->getPost('item_id'),
            'user_id'         => $this->request->getPost('user_id'),
            'booking_price'  => $this->request->getPost('booking_price'),
            'booking_date_start'         => $this->request->getPost('booking_date_start'),
            'booking_date_end'  => $this->request->getPost('booking_date_end'),
            'booking_payment_method'  => $this->request->getPost('booking_payment_method'),
            'booking_proof_of_payment'  => $upload->getName(),
            'booking_status'  => 'pending',
        );
        if(!isset($_SESSION['logged_in'])){
            echo '<script>
                    alert("Berhasil mendaftar, silahkan login.");
                    window.location="'.base_url('/').'"
                </script>';
        }
        $model->add($data);
        $bookLatestId = $model->insertID();

        return redirect()->to('/book/done/'.$bookLatestId);
    }

    public function bookDone($id)
    {
        $data['session'] = session();
        $model = new BookingModel;

        $data['book'] = $model->latest($id)->getRow();

        $dateStart = strtotime($data['book']->booking_date_start);
        $dateEnd = strtotime($data['book']->booking_date_end);
        $dateCalculate = $dateEnd - $dateStart;

        $dateTotal = floor($dateCalculate/(60*60*24));
        if($dateTotal == 0){
            $dateTotal = 1;
        }
        $data['total'] = $dateTotal;
        $totalPrice = $dateTotal * $data['book']->item_price;
        $data['totalPrice'] = $totalPrice + 15000;

        echo view('home/done', $data);
    }

    public function registerProcess()
    {
        $data['session'] = session();
        $model = new UserModel;
        $data = array(
            'name' => $this->request->getPost('name'),
            'telp'         => $this->request->getPost('telp'),
            'address'  => $this->request->getPost('address'),
            'email'         => $this->request->getPost('email'),
            'password'  => $this->request->getPost('password'),
            'role'  => 'user',
        );
        $model->add($data);
        echo '<script>
                alert("Berhasil mendaftar, silahkan login.");
                window.location="'.base_url('/').'"
            </script>';
    }
    
    public function loginProcess()
    {
        $data['session'] = session();
        $session = session();
        $model = new UserModel();
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
        $data = $model->where('email', $email)->first();
        if($data){
            $verify_pass = $model->where('password', $password)->first();
            if($verify_pass){
                $ses_data = [
                    'user_id'       => $data['user_id'],
                    'name'     => $data['name'],
                    'email'    => $data['email'],
                    'logged_in'     => TRUE
                ];
                $session->set($ses_data);
                echo '<script>
                        alert("Berhasil login.");
                        window.location="'.base_url('/').'"
                    </script>';
            }else{
                print_r($this->request->getPost());
                print_r($session->user_id);
                echo '<script>
                        alert("Gagal login, mohon periksa data anda");
                        window.location="'.base_url('/').'"
                    </script>';
            }
        }else{
            echo '<script>
                    alert("Email tidak ditemukan.");
                    window.location="'.base_url('/').'"
                </script>';
        }
    }
 
    public function logoutProcess()
    {
        $session = session();
        $session->destroy();
        echo '<script>
                alert("Logout berhasil");
                window.location="'.base_url('/').'"
            </script>';
    }
}