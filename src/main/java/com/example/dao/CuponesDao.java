package com.example.dao;

import java.util.List;
import com.example.pojo.*;

public interface CuponesDao {
	
	GenericCatalog setUsuario(Usuarios usuario);
	
	List <GenericCatalog> getListaUsuarios();

}
