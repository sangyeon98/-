<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.*" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/shoppingmall.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/css/productView.css" />
<!-- css 파일 로드 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/css/shoppingmall.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/css/productView.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/css/mainButton.css" />

<script type="text/javascript" src="${contextPath}/script/product.js" ></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function calculateTotalPrice() {
  let count = parseInt($('#count').val());
  let price = parseInt('${product.price}');
  let totalPrice = count * price;
  $('#total_price').text(totalPrice.toLocaleString());
}

$(document).ready(function() {
  let item_key = $('#item_key').val();
  
  $.ajax({
    url: "${contextPath}/productList.do",
    data: { "item_key": item_key },
    dataType: "json",
    success: function(data) {
      let product = data.product;
      $('#itemname').text(product.itemname);
      $('#price').text(product.price.toLocaleString());
      $('#image1').attr('src', "${contextPath}/images/" + product.image1);
      $('#content').text(product.content);
      
      // 수량이 변경되면 총 가격을 다시 계산합니다.
      $('#count').change(function() {
        calculateTotalPrice();
      });
      
      // 초기값으로 총 가격을 계산합니다.
      calculateTotalPrice();
    },
    error: function(jqXHR, textStatus, errorThrown) {
      console.log(jqXHR.responseText);
    }
  });
});
</script>
</head>
<body>
<!-- "메인화면으로" 가는 버튼 -->
<div class="button-wrapper">
  <a href="${contextPath}/boardList.jsp" id="main-button">메인화면으로</a>
  
</div>
<div id="wrap">
  <div class="container">
    <h1>상품 상세 화면</h1>
    <table summary="상품 상세조회">
      <caption>상품 정보 보기</caption>
      <colgroup>
        <col width="100" />
        <col width="500" />
      </colgroup>
      <tbody>
        <tr>
          <th>상품명</th>
          <td>${product.itemname}</td>
        </tr>
          <tr>
   
          
     			<c:choose>
					<c:when test="${product.image1 eq 'noImage.jpg'}">
						<img src="<c:out value="images/noImage.jpg" />">
					</c:when>
					<c:otherwise>
						<img src="<c:out value="${contextPath}/images/${product.image1}" />">
					</c:otherwise>
				</c:choose>     
        </tr>
        <tr>
          <th>상품 설명</th>
         <td>${product.content}</td>
        </tr>
        <tr>
          <th>판매가격</th>
          <td><fmt:formatNumber value="${product.price }" pattern="#,###"/> 원</td>
        </tr>
        
		 <tr>
		 <th>수량</th>
  		 <td>
    	 <input type="number" id="count" value="1" min="1" max="10" onchange="calculateTotalPrice()" />
  		 </td>
		 </tr>
		 <tr>
  		 <th>총 가격</th>
  		 <td><span id="total_price">${product.price}</span>원</td>
		 </tr>

      </tbody>
    </table>
    <div class="buttons">
     <input type="button" value="상품목록" onclick="location.href='${contextPath}/productList.do'" />
     <input type="button" value="장바구니" onclick="location.href='${contextPath}/cart.jsp'" />
      <input type="button" value="주문" onclick="location.href='${contextPath}/order.jsp'" />
    </div>
  </div>
</div>
<input type="hidden" id="item_key" value="${param.item_key}" />
</body>
</html>