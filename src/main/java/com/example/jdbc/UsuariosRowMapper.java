package com.example.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.example.pojo.Usuarios;

public class UsuariosRowMapper implements RowMapper<Usuarios> {
	
	//@Override
	public Usuarios mapRow(ResultSet rs, int rowNum) throws SQLException {
		Usuarios row = new Usuarios();
		
		row.setUsuarioId(rs.getString("usuarioId"));
		row.setNombre(rs.getString("nombre"));
		row.setApellidoPateno(rs.getString("apellidoPateno"));
		row.setApellidoMaterno(rs.getString("apellidoMateno"));
		row.setContrasena(rs.getString("contrasena"));
		row.setPagado(rs.getString("pagado"));
		row.setUsuarioReferencia(rs.getString("usuarioReferencia"));
		
		return row;
	}

}
