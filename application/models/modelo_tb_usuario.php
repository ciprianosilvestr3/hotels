<?php
class Modelo_tb_usuario extends CI_Model
{
	
	
	
	 public function get_usuarios($per_page,$segmento,$misparams)
    {	
			$concatena="";
		 
      $sql='SELECT * FROM usuarios where  estatus=? and usuario like ? order by id LIMIT '.$segmento.', '.$per_page;
  	 $query=$this->db->query($sql, $misparams);
		$data= array();
		if( $query->num_rows()>0)
		{
			foreach( $query->result() as $fila):
			$data[]=$fila;			
			endforeach;
		}
		return $data;
    }
						
	public function total_filas($param)
    {
		$concatena="";
		 
     $sql='SELECT * FROM usuarios where estatus=? and usuario like ? order by id';
  	 $query=$this->db->query($sql, $param);
	
        return $query->num_rows();
    }
	
	
		function insert_usuarios($data)
	{		
		return $this->db->insert('usuarios',$data);
	 
	}
	
	 function update_usuarios($id,$data)
	    {
	#mi updata papa xD		      
  	return $this->db->update('usuarios', $data, array('id' => $id));
    	
   		}																
	
	function get_existe_usuario($usuario,$contraseña)
	{
	
		
		
   	$sql='SELECT * FROM usuarios where usuario=? and password=?';
  	 $query=$this->db->query($sql, array($usuario,$contraseña));
	 if($query->num_rows()>0)
		{
			return true;
		}
		else
		{
			return false;
		}
   	}		
	
	
	function get_datos_usuarios($usuario)
	{
		
		// $sql='SELECT * FROM usuarios where usuario=?';
  // 	 	$query=$this->db->query($sql, array($usuario));
		
		// if( $query->num_rows()>0)
		// {
		// 	return $query->row_array(); 		
		// }
		// return false;
	

		    $this->db->select('u.id as id,u.nombre as nombre,u.email,u.fecha_registro as fecha_registro,u.estatus as estatus,u.foto,s.nombre as nombre_sucursal,u.usuario');
            $this->db->from('usuarios as u');
            $this->db->join('sucursales as s', 'u.sucursales_id = s.id_sucursal');
            $this->db->where('u.usuario',$usuario);	
            $query = $this->db->get();
            //error_log(print_r($query));
	        if($query->num_rows() > 0 )
	        {
	            return $query->row_array();
	        }	
	}
	
	
	
	function get_datos_usuarios_id($id)
	{
		
		$sql='SELECT * FROM usuarios where id=?';
  	 $query=$this->db->query($sql, array($id));
		
		if( $query->num_rows()>0)
		{
			$data=array();
			foreach( $query->result() as $fila):
			$data[]=$fila;			
			endforeach;
		}
		return $data;		
	}		
	
	function get_count_activos()
	{
		$sql="SELECT * FROM usuarios where estatus=1";		
    	$query=$this->db->query($sql);
		return $query->num_rows();
	}
	function get_count_inactivos()
	{
		$sql="SELECT * FROM usuarios where estatus=0";		
    	$query=$this->db->query($sql);
		return $query->num_rows();
	}
	
			  					
}
?>