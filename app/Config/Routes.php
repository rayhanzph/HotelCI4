<?php namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes(true);

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php'))
{
	require SYSTEMPATH . 'Config/Routes.php';
}

/**
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

/**
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
// $routes->get('/', 'Admin::index');
// $routes->get('/admin', 'Admin::index');
$routes->group('/', function ($routes) {
	$routes->get('detail/(:num)', 'Home::detail/$1');
	$routes->get('item/(:any)', 'Home::hotel/$1');
	$routes->add('book/(:num)', 'Home::book/$1');
	$routes->add('book/process', 'Home::bookProcess');
	$routes->get('book/done/(:num)', 'Home::bookDone/$1');
	$routes->add('user/register', 'Home::registerProcess');
	$routes->add('user/login', 'Home::loginProcess');
	$routes->add('user/logout', 'Home::logoutProcess');
});
$routes->group('admin', function ($routes) {
	// Login
	$routes->get('login', 'Admin::login');
	$routes->add('loginProcess', 'Admin::loginProcess');
	$routes->add('logout', 'Admin::logoutProcess');

	// Customer
	$routes->get('customer/add', 'User::add/user');
	$routes->add('customer/addProcess', 'User::addProcess/user');
	$routes->get('customer/edit/(:num)', 'User::edit/$1/user');
	$routes->add('customer/editProcess', 'User::editProcess/user');
	$routes->get('customer/delete/(:num)', 'User::deleteData/$1/user');
	
	// Admin
	$routes->get('admin/add', 'User::add/admin');
	$routes->add('admin/addProcess', 'User::addProcess/admin');
	$routes->get('admin/edit/(:num)', 'User::edit/$1/admin');
	$routes->add('admin/editProcess', 'User::editProcess/admin');
	$routes->get('admin/delete/(:num)', 'User::deleteData/$1/admin');
	
	// Hotel
	$routes->get('hotel/add', 'Hotel::add');
	$routes->add('hotel/addProcess', 'Hotel::addProcess');
	$routes->get('hotel/edit/(:num)', 'Hotel::edit/$1');
	$routes->add('hotel/editProcess', 'Hotel::editProcess');
	$routes->get('hotel/delete/(:num)', 'Hotel::deleteData/$1');
	
	// Hotel Image
	$routes->get('image/(:num)', 'Admin::image/$1');
	$routes->get('image/add/(:num)', 'Image::add/$1');
	$routes->add('image/addProcess', 'Image::addProcess');
	$routes->get('image/delete/(:num)', 'Image::deleteData/$1');
	
	// Booking
	$routes->get('booking/add', 'Booking::add');
	$routes->add('booking/addProcess', 'Booking::addProcess');
	$routes->get('booking/edit/(:num)', 'Booking::edit/$1');
	$routes->add('booking/editProcess', 'Booking::editProcess');
	$routes->get('booking/delete/(:num)', 'Booking::deleteData/$1');
	$routes->add('booking/(:num)/(:num)/pending', 'Booking::editStatusP/$1/$2');
	$routes->add('booking/(:num)/(:num)/ongoing', 'Booking::editStatusO/$1/$2');
	$routes->add('booking/(:num)/(:num)/done', 'Booking::editStatusD/$1/$2');
	
});


/**
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need to it be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php'))
{
	require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
