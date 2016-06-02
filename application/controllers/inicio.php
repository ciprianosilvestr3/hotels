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
		
	  $this->load->library('session');
	  $session_data = $this->session->userdata('creand6_token');
	  $this->layout->view('inicio',$session_data);
	}
	
	public function menu()
	{

		$response = array();
		$response['menu']='<!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
                        <li class="sidebar-toggler-wrapper hide">
                            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                            <div class="sidebar-toggler"> </div>
                            <!-- END SIDEBAR TOGGLER BUTTON -->
                        </li>';
                        /*<li class="sidebar-search-wrapper">
                            <form class="sidebar-search  " action="page_general_search_3.html" method="POST">
                                <a href="javascript:;" class="remove">
                                    <i class="icon-close"></i>
                                </a>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <a href="javascript:;" class="btn submit">
                                            <i class="icon-magnifier"></i>
                                        </a>
                                    </span>
                                </div>
                            </form>                         
                        </li>*/
                  $response['menu'].='<li class="nav-item start ">
                            <a href="#" class="nav-link nav-toggle">
                                <i class="icon-home"></i>
                                <span class="title">Hoteles</span>
                                <span class="selected"></span>
                                <span class="arrow open"></span>
                            </a>
                            <ul class="sub-menu">
                                <li class="nav-item start">
                                    <a href="<?=base_url();?>index.php/hoteles" class="nav-link ">
                                        <i class="icon-bar-chart"></i>
                                        <span class="title">Hoteles</span>
                                        <span class="selected"></span>
                                    </a>
                                </li>
                            </ul>
                        </li>'
                        ; 


		echo json_encode($response);
	}
	
	///tomavariables para conectar....
	
}
/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */