<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Inicio extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	
	public function __construct() {
        parent::__construct();
        $this->load->library('session');
		$session_data = $this->session->userdata('creand6_token');
		 $this->load->library('encrypt');	
	  if(!$session_data["usuario"])
		{
          $this->layout->setParameter('layout_body_class','body-blue');
         redirect('/index.php/login');
		
		}
		else
		{
			//print_r($session_data);
			}
		 	  	  	  	  
    }
	
	public function index()
	{
		
	$this->layout->view('inicio');	
	}
	
	
	///tomavariables para conectar....
	
}
/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */