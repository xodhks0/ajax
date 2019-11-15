package com.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajax.service.AddressService;
import com.ajax.service.impl.AddressServiceImpl;
import com.google.gson.Gson;

@WebServlet(name="TestController",urlPatterns = {"/test/*"})
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AddressService as = new AddressServiceImpl();
    private Gson g = new Gson();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.print(g.toJson(as.selectSidoList(null)));
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
