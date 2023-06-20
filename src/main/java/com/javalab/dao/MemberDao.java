package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.MemberVo;

public class MemberDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource dataSource;
	
	private static MemberDao instance;

	// 기본 생성자에서 환경변수를 통한 데이터베이스 관련 DataSource얻어옴
	// Server / contex.xml에 Resource로 세팅해놓은 정보
	public MemberDao() {
		System.out.println("여기는 MemberDao 생성자");
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberVo loginCheck(MemberVo vo) {
		
		System.out.println("여기도 테스트");
		
		MemberVo log = null;
		
		try {
			Connection con = dataSource.getConnection();
			String sql = "select * from member where id =? and password= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			
			rs = pstmt.executeQuery();
			
			System.out.println("값있나?" + rs);
			
			if (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("password");
				String name = rs.getString("name");
				String jumin = rs.getString("jumin");
				String address = rs.getString("address");
				String gender = rs.getString("gender");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String signup = rs.getString("signup");
				
				log = new MemberVo(id, pwd, name,jumin,address,gender, phone, email,signup);
				
			}
			//System.out.println("여기까진왔나"+ log.getId());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return log;
	}
	
	//아이디 중복 체크
	public boolean isIdExist(String id) {
		boolean result = false;
		try {
			con = dataSource.getConnection();
			String query = "select decode(count(*), 1, 'true', 'false') as result from shoppingmall";
			query += " where id=?";
			System.out.println("prepareStatement : " +query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			rs.next();
			// 반환 타입이 불린형이므로, 문자열 타입 쿼리 결과를
			//불린 형으로 변환
			result = Boolean.parseBoolean(rs.getString("result"));
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	// 싱글톤 팬턴으로 생성
	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}	

	
	
	// 회원 삭제 메소드
	public int deleteMember(String id) {
		int result = 0;
		try {
			Connection con = dataSource.getConnection();
			
			String query = "delete from tbl_member where id=?";
			System.out.println("SQL :  " + query);

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();			
		}
		return result;
	}
	
	// DB 자원해제
	private void close()
	{
		try {
			if ( pstmt != null ){ 
				pstmt.close(); 
			}
			if ( con != null ){ 
				con.close(); 
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	} // end close()	

	public void addMember(MemberVo vo) {
			System.out.println("votostring: "+vo.toString());
			try {
			
			Connection con = dataSource.getConnection();
			
			String id = vo.getId();
			String pwd = vo.getPwd();
			String name = vo.getName();
			String phone = vo.getPhone();
			String email = vo.getEmail();
			String address = vo.getAddress();
			String jumin = vo.getJumin();
			String gender = vo.getGender();
			
			
			String query = "insert into member";			
			query += " (id,password,name,jumin,address,gender,phone,email)";
			query += " values(?,?,?,?,?,?,?,?)";
			
			System.out.println("SQL :  " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, jumin);
			pstmt.setString(5, address);
			pstmt.setString(6, gender);
			pstmt.setString(7, phone);
			pstmt.setString(8, email);
			pstmt.executeUpdate();
			
			System.out.println(pstmt);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();			
		}
		
	}

	
		
}
