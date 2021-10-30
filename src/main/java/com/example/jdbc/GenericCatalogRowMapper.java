package com.example.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.example.pojo.GenericCatalog;

public class GenericCatalogRowMapper implements RowMapper<GenericCatalog> {

	//@Override
	public GenericCatalog mapRow(ResultSet rs, int rowNum) throws SQLException {
		GenericCatalog row = new GenericCatalog();
		row.setId( rs.getLong("id") );
		row.setKey( rs.getString("key") );
		row.setDescription(rs.getString("description"));
		
		return row;
	}
}
