package com.example.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.example.pojo.Cupones;

public class CuponesRowMapper implements RowMapper<Cupones> {
	
	//Override
	public Cupones mapRow(ResultSet rs, int rowNum) throws SQLException {
		Cupones row = new Cupones();
		
		row.setCuponId(rs.getString("cuponId"));
		row.setRestaurante(rs.getString("restaurante"));
		row.setUsuario(rs.getString("usuario"));
		row.setEstatus(rs.getString("estatus"));
		
		return row;
	}

}
