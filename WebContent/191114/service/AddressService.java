package com.ajax.service;

import java.util.List;
import java.util.Map;

public interface AddressService {
	public List<Map<String,String>> selectSidoList(Map<String,String> sido);
	public Map<String,String> selectSido(Map<String,String> sido);
}
