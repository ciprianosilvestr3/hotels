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
<<<<<<< HEAD

		$this->layout->view('hoteles',$session_data);	

		
		$parametros=array(
			'idusuario' =>$session_data['id'],
			'usuario'=>$session_data['usuario'],
			'tipo'=>$session_data['perfil'],
			'nombre'=>$session_data['nombre']	
		);
		$this->layout->view('hoteles',$parametros);	

=======
		$this->layout->view('hoteles',$session_data);	
>>>>>>> 20ded7f48d332d95a317d83cb8e783652cc50b86
	}

}

/* End of file hoteles.php */
/* Location: ./application/controllers/hoteles.php */