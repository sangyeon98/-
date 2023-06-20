<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>상품 목록 화면 : productList.jsp</title>
	<!-- 외장 CSS를 갖고옴 -->
	<link rel="stylesheet" type="text/css" href="css/productList.css" />

	
	<!-- 외장 javascript를 갖고옴 -->
	<script type="text/javascript" src="script/product.js" ></script>
	
	
</head>
<body>
<!-- "메인화면으로" 가는 버튼 -->
<div class="button-wrapper">
  <a href="${contextPath}/main/boardList.jsp" id="main-button"></a>
</div>
	<div id="wrap" align="center">
		<table class="list">
			<tr>
				<td align="center" colspan="9">
					<form id="regform" action="${contextPath}/productList.do" method="get">
						<input type="hidden" id="pageNum" value="${pageNum }"/>
							<p>
								상품명 : 
								<input type="text" name="searchText" id="searchText" />
								<input type="submit" value="검색" />
								<input type="submit" onclick="javascript:location.href='${contextPath}/productList.do" value="전체보기" />
							</p>
					</form>				
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>상품명</th>
				<th>판매금액</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:set var="num" value="${totalCount - ((pageNum - 1) * listCount) }" ></c:set>
			<c:forEach var="product" items="${productList}">
				<tr class="record">
					<td ><c:out value="${num}" /></td>
					<td><a href="${contextPath}/productView.do?item_key=${product.item_key }">${product.itemname }</a> </td>
					<td><fmt:formatNumber value="${product.price }" pattern="#,###"/> 원</td>
					<td><c:out value="${product.regdate}" /> </td>	
					<td><c:out value="${product.hitcount}" /> </td>	
					
				</tr>
				<c:set var="num" value="${num-1 }"></c:set>
			</c:forEach>
			<tr>
				<td align="center" colspan="9">${page_navigator }</td>
			</tr>
		</table>
	</div>
</body>
</html>