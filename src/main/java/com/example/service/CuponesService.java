package com.example.service;

import java.util.List;
import com.example.pojo.GenericCatalog;
import com.example.pojo.Usuarios;

public interface CuponesService {
	
	GenericCatalog setUsuario(Usuarios usuario);
	
	List <GenericCatalog> getListaUsuarios();

}
