<?php 
namespace App\Controllers;
use CodeIgniter\Controller;
use App\Models\UserModel;
use App\Models\HotelModel;
use App\Models\BookingModel;
use App\Models\ImageModel;

class Admin extends Controller
{
    public function index()
    {
        $data['session'] = session();
        $session = session();
        $model = new UserModel;
        if(isset($_SESSION['logged_in'])){
            $data['user'] = $model->get('user');
            echo view('admin/customer/index', $data);
        } else{
            echo '<script>
                    alert("Harap login dahulu.");
                    window.location="'.base_url('/admin/login').'"
                </script>';
        }
    }

    public function admin()
    {
        $data['session'] = session();
        $session = session();
        $model = new UserModel;
        if(isset($_SESSION['logged_in'])){
            $data['user'] = $model->get('admin');
            echo view('admin/admin/index', $data);
        } else{
            echo '<script>
                    alert("Harap login dahulu.");
                    window.location="'.base_url('/admin/login').'"
                </script>';
        }
    }

    public function hotel()
    {
        $data['session'] = session();
        $session = session();
        $model = new HotelModel;
        $data['item'] = $model->get();
        if(isset($_SESSION['logged_in'])){
            echo view('admin/hotel/index', $data);
        } else{
            echo '<script>
                    alert("Harap login dahulu.");
                    window.location="'.base_url('/admin/login').'"
                </script>';
        }
    }

    public function image($id)
    {
        $data['session'] = session();
        $session = session();
        $model = new ImageModel;
        $data['image'] = $model->get($id);
        $data['id'] = $id;
        
        if(isset($_SESSION['logged_in'])){
            echo view('admin/image/index', $data);
        } else{
            echo '<script>
                    alert("Harap login dahulu.");
                    window.location="'.base_url('/admin/login').'"
                </script>';
        }
    }

    public function booking()
    {
        $data['session'] = session();
        $session = session();
        $model = new BookingModel;
        $data['book'] = $model->get();
        if(isset($_SESSION['logged_in'])){
            echo view('admin/booking/index', $data);
        } else{
            echo '<script>
                    alert("Harap login dahulu.");
                    window.location="'.base_url('/admin/login').'"
                </script>';
        }
    }

    public function login()
    {
        echo view('admin/user/login');
    }

    public function loginProcess()
    {
        $session = session();
        $model = new UserModel();
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
        $data = $model->where('email', $email)->first();
        // print_r($data);
        if($data['role'] == 'admin'){
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
                        window.location="'.base_url('/admin').'"
                    </script>';
            }else{
                print_r($this->request->getPost());
                print_r($session->user_id);
                echo '<script>
                        alert("Gagal login, mohon periksa data anda");
                        window.location="'.base_url('/admin').'"
                    </script>';
            }
        }else{
            echo '<script>
                    alert("Email tidak ditemukan atau anda bukan admin.");
                    window.location="'.base_url('/admin').'"
                </script>';
        }
    }
 
    public function logoutProcess()
    {
        $session = session();
        $session->destroy();
        echo '<script>
                alert("Logout berhasil");
                window.location="'.base_url('/admin').'"
            </script>';
    }

}