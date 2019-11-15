package com.ajax.dao;

import java.util.List;
import java.util.Map;

public interface AddressDAO {

	public List<Map<String,String>> selectSidoList(Map<String,String> sido);
	public Map<String,String> selectSido(Map<String,String> sido);
}
