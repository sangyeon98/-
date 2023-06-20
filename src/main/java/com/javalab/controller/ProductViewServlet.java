package com.javalab.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.ProductDao;
import com.javalab.vo.ProductVo;

@WebServlet("/productView.do")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 상세보기 화면 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String item_key = request.getParameter("item_key");
		if (item_key == null) {
			// item_key 파라미터가 없는 경우 예외 처리
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "item_key parameter is missing");
			return;
		}

		// Dao 객체 생성
		ProductDao productDao = new ProductDao();

		// 조회수 증가 메소드 호출
		productDao.updateHitCount(item_key);

		ProductVo product = productDao.selectProductByItem_key(item_key);

		System.out.println("ProductViewServlet product : " + product.toString());

		request.setAttribute("product", product);
		RequestDispatcher rd = request.getRequestDispatcher("productView.jsp");
		rd.forward(request, response);
	}
}
