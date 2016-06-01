<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {

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
	   
	   
    }
	
	//index manda a traer vista del login
	public function index() 
	{				
	$this->load->view('login');
	}
	
	public function accesar()
	{	



		if($_POST)
		{	
			//echo "hola";	


			$usuario=trim($_POST["username"]);
		    $contrasena=trim($_POST["password"]);
		   # print_r($_POST);

		    $data = array();
		
		        $this->load->model('modelo_tb_usuario', 'usuarios');	
		        $existe = $this->usuarios->get_existe_usuario($usuario,$contrasena);
		       // error_log($existe);
				if($existe==true)
				{	
					  
					$datosUsuarios=  $this->usuarios->get_datos_usuarios($usuario);
				
					//error_log(print_r($datosUsuarios,1));


					
		                
		                if($datosUsuarios['estatus']==1)
						{						
							$sess_data = array(
										  	'idusuario' =>$datosUsuarios['id'],
											'usuario'=>$datosUsuarios['usuario'],
											//'tipo'=>$tipo,
											'nombre'=>$datosUsuarios['nombre']);
											
											//error_log(print_r($sess_data));
											//$this->load->library('session');
									  $this->session->set_userdata('creand6_token', $sess_data);	
							
							
							
							
						  $data['error']="1";
						  $data['mensaje']='Bienvenido';	

						  //redirect('/index.php/saludo');
						  
						  
						}
						else
						{
						  $data['error']="error";
						  $data['mensaje']="El usuario esta dado de baja";
						}
		                
		            

					
					  
				}
				else
				{
				    $data['error']="error";
					$data['mensaje']="Error en el Usuario y Contraseña";
				}
				echo json_encode($data);	
		}		
	}
	
	
	
	
	public function logout()
	{
		$this->session->unset_userdata('creand6_token');
		redirect('/index.php/login');
		}
	
	
}
/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */