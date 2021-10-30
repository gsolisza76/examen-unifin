package com.example.dao.impl;

import java.util.List;
import java.util.HashMap;
import javax.sql.DataSource;
import com.example.dao.ExampleDaoSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.SqlOutParameter;

import com.example.dao.CuponesDao;
import com.example.pojo.GenericCatalog;
import com.example.pojo.Usuarios;

import com.example.jdbc.GenericCatalogRowMapper;
import oracle.jdbc.OracleTypes;

public class CuponesDaoImp extends ExampleDaoSupport implements CuponesDao {
	
	private static final String PG_CUPONES = "PG_CUPONES";
	
	@Autowired
	@Qualifier("exampleJndiDataSource")
	protected void setJndiDataSource(DataSource dataSource ) {
		this.setDataSource(dataSource);
	}

	public GenericCatalog setUsuario(Usuarios usuario) {
		HashMap<String,Object> param = new HashMap<String,Object>();
		param.put("p_usuarioId", usuario.getUsuarioId());
		param.put("p_nombre", usuario.getApellidoPateno());
		param.put("p_apellidoPaterno", usuario.getApellidoPateno());
		param.put("p_apellidoMaterno", usuario.getApellidoMaterno());
		param.put("p_correoElectronico", usuario.getCorreoElectronico());
		param.put("p_contrasena", usuario.getPagado());
		param.put("p_usuarioReferencia", usuario.getUsuarioReferencia());
		
		List<GenericCatalog> result = executePackage(PG_CUPONES, "PA_AGREGA_USUARIO", "ps_result", param,
				new SqlOutParameter("ps_result", OracleTypes.CURSOR,
						new GenericCatalogRowMapper()));
	 
		return result.get(0);
	}

	public List<GenericCatalog> getListaUsuarios() {
		List<GenericCatalog> result = executePackage(PG_CUPONES, "PA_GET_USUARIOS", "ps_result", null,
				new SqlOutParameter("ps_result", OracleTypes.CURSOR, new GenericCatalogRowMapper()));
		
		return result;
	}

}
