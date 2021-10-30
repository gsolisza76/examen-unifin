package com.example.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CuponesDao;
import com.example.pojo.GenericCatalog;
import com.example.pojo.Usuarios;
import com.example.service.CuponesService;

@Service
public class CuponesServiceImpl implements CuponesService {
	
	@Autowired
	private CuponesDao cuponesDao;

	public GenericCatalog setUsuario(Usuarios usuario) {
		return cuponesDao.setUsuario(usuario);
	}

	public List<GenericCatalog> getListaUsuarios() {
		return cuponesDao.getListaUsuarios();
	}

}
