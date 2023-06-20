package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.ProductVo;

public class ProductDao {
   
   private Connection con;
   private PreparedStatement pstmt;
   private ResultSet rs;
   private String sql;
   
   private DataSource dataSource;   

   public ProductDao() {
      System.out.println("여기는 ProductDao 생성자");
      try {
         Context ctx = new InitialContext();
         Context envContext = (Context) ctx.lookup("java:/comp/env");
         dataSource = (DataSource) envContext.lookup("jdbc/oracle");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   //테이블의 전체 레코드 수 조회
      public int selectCount(ProductVo product) {
         int totalCount = 0;
         sql = "";
         
         String searchText = product.getSearchText();
         
         sql = "Select Count(*) as totalCount";
         sql += " From product";
         if(!searchText.equals("")) {
            sql += " Where name Like ? ";
         }

         try {
            con = dataSource.getConnection();   //커넥션 객체 얻기
            pstmt = con.prepareStatement(sql);
            if(!searchText.equals("")) {
                  pstmt.setString(1, "%" + searchText + "%");
            }
            rs = pstmt.executeQuery();
            if(rs.next()) {
               totalCount = rs.getInt("totalCount");
            }
            close();
         }catch(SQLException e) {
            e.printStackTrace();
         } 
         return totalCount;
      }
      
   //전체 상품 조회(
   public List<ProductVo> getProductList(ProductVo model){
       List<ProductVo> products = new ArrayList<ProductVo>();

       String searchText = "";
       String sql = "";

       if(model.getSearchText() != null) {
           searchText = model.getSearchText();
       }

       int start = 0;
       int end = 0;

       // 시작 게시물 번호
       start = (Integer.parseInt(model.getPageNum()) - 1) * model.getListCount() + 1;
       // 끝 게시물 번호
       end = start + model.getListCount() - 1;

       System.out.println("시작게시물번호 : " + start + " / 끝 게시물번호 : " + end);

       sql = "SELECT item_key, category_key, manager_key, itemname, price, regdate, content, image1, image2, image3, hitcount " +
             "FROM (SELECT rownum AS rnum, item_key, category_key, manager_key, itemname, price, regdate, content, image1, image2,image3, hitcount " +
                   "FROM (SELECT item_key, category_key, manager_key, itemname, price, regdate, content, image1, image2,image3, hitcount " +
                         "FROM product ";
       if(!searchText.equals("")) {
           sql += "WHERE itemname LIKE ? ";
       }
       sql += "ORDER BY regdate desc)) " +
             "WHERE rnum BETWEEN ? AND ?";

       System.out.println("searchText:" + searchText);
       System.out.println("sql : " + sql );

       try {
           con = dataSource.getConnection(); // 커넥션 객체 얻기
           pstmt = con.prepareStatement(sql);

           int parameterIndex = 1;

           if(!searchText.equals("")) {
               pstmt.setString(parameterIndex++, "%" + searchText + "%"); // 상품명
           }
           pstmt.setInt(parameterIndex++, start); // start num
           pstmt.setInt(parameterIndex++, end); // end num

           rs = pstmt.executeQuery();
           while(rs.next()) {
               ProductVo product = new ProductVo();
               product.setItem_key(rs.getString("item_key"));
               product.setCategory_key(rs.getString("category_key"));
               product.setManager_key(rs.getInt("manager_key"));
               product.setItemname(rs.getString("itemname"));
               product.setPrice(rs.getInt("price"));
               product.setRegdate(rs.getString("regdate"));
               product.setContent(rs.getString("content"));
               product.setImage1(rs.getString("image1"));
               product.setImage2(rs.getString("image2"));
               product.setImage3(rs.getString("image3"));
               product.setHitcount(rs.getInt("hitcount"));
               products.add(product);

               System.out.println(product.toString());
           }
           close();
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return products;
   }

      
   
   // 상품 상세보기
   public ProductVo selectProductByItem_key(String item_key) {
      sql = "";
      sql = " Select item_key, category_key, manager_key, itemname, regdate, content, image1, image2, price, hitcount";
      sql += " From product ";
      sql += " Where item_key = ?";
      
      ProductVo product = null;

      try {
         con = dataSource.getConnection();   //커넥션 객체 얻기
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, item_key);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            product = new ProductVo();
            product.setItem_key(rs.getString("item_key"));
            product.setCategory_key(rs.getString("category_key"));
            product.setManager_key(rs.getInt("manager_key"));            
            product.setItemname(rs.getString("itemname"));
            product.setPrice(rs.getInt("price"));
            product.setRegdate(rs.getString("regdate"));
            product.setContent(rs.getString("content"));
            product.setImage1(rs.getString("image1"));
            product.setImage2(rs.getString("image2"));
            product.setHitcount(rs.getInt("hitcount"));
         }
         close();
      } catch (SQLException e) {
         e.printStackTrace();
      } 
      return product;
   }   
   
   // DB 자원해
   public void close() {
      try {
         if(rs != null) rs.close();
         if(pstmt != null) pstmt.close();
         if(con != null) con.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   // 조회수 증가 메소드(게시물이 한 번 읽힐때마다 증가)
   public void updateHitCount(String item_key) {
      try {
         con = dataSource.getConnection();
         
         String query = "update product set hitcount = hitcount + 1";
         query += " where item_key = ?";
         System.out.println("SQL :  " + query);

         pstmt = con.prepareStatement(query);
         pstmt.setString(1, item_key);

         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         close();         
      }
   }
}