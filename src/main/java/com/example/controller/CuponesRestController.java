package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.pojo.GenericCatalog;
import com.example.pojo.Usuarios;
import com.example.service.CuponesService;

@RestController
@RequestMapping({"/cupones.rs"})
public class CuponesRestController {
	
	@Autowired
	private CuponesService cuponesService;
	
	@GetMapping(value={"/setUsuario"}, produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8" )
	public GenericCatalog setUsuario(@RequestBody Usuarios usuario) {
		return cuponesService.setUsuario(usuario);
	}
	
	@GetMapping(value={"/getListaUsuarios"}, produces = MediaType.APPLICATION_JSON_VALUE+";charset=UTF-8" )
	public List <GenericCatalog> getListaUsuarios() {
		return cuponesService.getListaUsuarios();
	}
	

}
