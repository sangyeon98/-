package com.javalab.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.MemberDao;
import com.javalab.vo.MemberVo;


@WebServlet("/signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDao memberDao = MemberDao.getInstance();
    
    public Signup() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST 한글 파라미터 깨짐 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset:utf-8");
		
		System.out.println("doPost()메소드");
		
		// 파라미터 받기  name타입으로 정해야함
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String jumin = request.getParameter("jumin");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		MemberVo  vo = new MemberVo(id, pwd, name, jumin, address,gender, phone,email);
		memberDao = MemberDao.getInstance();
		memberDao.addMember(vo);
		
		//String contextPath = request.getContextPath();
		//String url = contextPath +"/login/loginForm.jsp";
		//response.sendRedirect(url);
		
		RequestDispatcher rd = request.getRequestDispatcher("/login/loginForm.jsp");
		rd.forward(request, response);
		
		
	}

}
