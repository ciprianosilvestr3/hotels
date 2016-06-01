<?php  
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Layout
{
	/**
	 * 
	 * @var unknown
	 */
    private $obj;
    
    /**
     * 
     * @var unknown
     */
    private $layout;
    
    /**
     * 
     * @var unknown
     */
    private $data = array();
	
    /**
     * 
     */
    public function __construct()
    {
        $this->obj =& get_instance();
        $this->layout = 'principal';
    }

	/**
	 * renderiza la vista dentro del layout determinado
	 * @param unknown $view
	 * @param string $data
	 * @param string $return
	 * @return unknown
	 */
    public function view($view, $data=null, $return=false)
    {
        $loaded = array();
        $loaded['layout_content'] = $this->obj->load->view($view,$data,true);
		if(!empty($this->data)){
			foreach ($this->data as $key => $value)
				$loaded[$key] = $value;
		}
        if($return)
            return $this->obj->load->view($this->layout, $loaded, true);
        else
            $this->obj->load->view($this->layout, $loaded, false);
    }
    
    /**
     * agrega una vista a un parametro para posteriormente ser cargado en el layout
     * @param unknown $view
     * @param unknown $params
     * @param unknown $value
     */
    public function addViewParams($view,$params,$value){
    	try{
    		if(empty($view))
    			throw new Exception('El nombre la vista es requerido.');
    		if(empty($value))
    			throw new Exception('El nombre del campo al cual se asignara el valor de la vista es requerido.');
    		$out = $this->obj->load->view($view,$params,true);
    		$this->data[$value] = $out;
    	}catch(Exception $ex){
    		throw new Exception($ex->getMessage());
    	}
    }
    
    /**
     * actualiza el layout
     * @param unknown $layout
     */
    public function setLayout($layout)
    {
    	$this->layout = $layout;
    }
    
    /**
     * asigna valores extras al layout
     * @param unknown $parameters
     */
    public function setParams($parameters,$force_new = FALSE){
    	if($force_new == FALSE)
    		$this->data = array_merge($this->data,$parameters);
    	else
    		$this->data = $parameters;
    }
    
    /**
     * asinga un valor al listado de parametros del layout
     * @param type $key
     * @param type $value
     */
    public function setParameter($key,$value){
        $this->data[$key] = $value;
    }
    
    
}
?>