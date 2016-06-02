<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Hoteles extends CI_Controller {




	public function __construct()
	{
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
		$session_data = $this->session->userdata('creand6_token');

		$this->layout->view('hoteles',$session_data);	

	}

}

/* End of file hoteles.php */
/* Location: ./application/controllers/hoteles.php */