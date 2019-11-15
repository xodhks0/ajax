package com.ajax.service.impl;

import java.util.List;
import java.util.Map;

import com.ajax.dao.AddressDAO;
import com.ajax.dao.impl.AddressDAOImpl;
import com.ajax.service.AddressService;

public class AddressServiceImpl implements AddressService {
	private AddressDAO adao = new AddressDAOImpl();
	@Override
	public List<Map<String, String>> selectSidoList(Map<String, String> sido) {
		
		return adao.selectSidoList(sido);
	}

	@Override
	public Map<String, String> selectSido(Map<String, String> sido) {
		// TODO Auto-generated method stub
		return null;
	}
	public static void main(String[] args) {
		AddressService as = new AddressServiceImpl();
		System.out.println(as.selectSidoList(null));
	}
}
