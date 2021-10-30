package com.example.dao;

import java.util.List;
import java.util.Map;
import javax.sql.DataSource;

import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

public class ExampleDaoSupport extends JdbcDaoSupport {
	
	@Autowired
	protected void setDS(DataSource dataSource){
		this.setDataSource(dataSource);
		
	}	
	
	@SuppressWarnings("unchecked")
	protected <T> List<T> executePackage(String catalogName, String procedureName, String resultParameterName, Map<String,Object> parameterValues, SqlParameter... parameters){
		
		SimpleJdbcCall packageCall = new SimpleJdbcCall(this.getDataSource());
		Map<String, Object> resultMap = null;
		
		packageCall.withCatalogName(catalogName)
			.withProcedureName(procedureName)
			.declareParameters(parameters);
		
		resultMap = packageCall.execute(parameterValues);
		
		return (List<T>) resultMap.get(resultParameterName);
	}
}
