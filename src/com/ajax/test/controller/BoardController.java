package com.ajax.test.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajax.test.service.BoardService;
import com.ajax.test.service.impl.BoardServiceImpl;
import com.google.gson.Gson;

@WebServlet(name = "BoardController", urlPatterns = {"/ajax/board/*","/jsp/board/*"}, loadOnStartup = 1)
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService bs = new BoardServiceImpl();
	private Gson g = new Gson();
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("3. get방식이 일어날때마다 날 호출하겠지");
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		String cmd = request.getParameter("cmd");
		
		if("list".equals(cmd)) {
			List<Map<String,String>> boardList = bs.selectBoardList(null);
			pw.print(g.toJson(boardList));
		}else if("view".equals(cmd)) {
			Map<String,String> param = new HashMap<>();
			param.put("biNum", request.getParameter("biNum"));
			Map<String,String> board = bs.selectBoard(param);
			System.out.println(board);
			System.out.println(g.toJson(board));
			pw.print(g.toJson(board));
		}
		
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader br = request.getReader();
		String str = null;
		String json = "";
		while((str=br.readLine())!=null) {
			json +=str;
		}
		Map<String,String> board = g.fromJson(json, Map.class);
		response.setContentType("application/json;charset=utf-8");
		json = g.toJson(bs.insertBoard(board));
		PrintWriter pw = response.getWriter();
		pw.print(json);
	}

}
