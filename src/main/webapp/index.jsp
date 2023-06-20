<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
  body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  .logo{
  	width: 150px; 
    height: auto;
  }
</style>


</head>
<body>
	<!-- WorkerLoginServlet 호출 -->
	<%-- <jsp:forward page="/login.do"></jsp:forward>  --%>
	 <%-- <a href="${contextPath }/boardList.jsp" >메인화면으로</a> --%>
	 <a href="${contextPath }/main/boardList.jsp">
 		 <img src="./img/logo.png"   class="logo"  alt="로고">
	</a>
	

</body>
</html>