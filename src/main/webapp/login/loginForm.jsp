<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.javalab.vo.*"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="./css/loginForm.css">
	<script type="text/javascript">
		//아이디/비밀번호 입력 체크 함수
		function fn_validate(){	
			//폼 객체의 주소값을 갖고오는데 최고 상위 객체인  document객체를 통해서 갖고옴
			var frmLogin = document.frmLogin;
			var id = frmLogin.id.value;
			var pwd = frmLogin.pwd.value;
			
			if(id.length == 0 || id == ""){
				alert("아이디를 입력하세요.");
				frmLogin.id.focus();
			}else if((pwd.length == 0 || pwd == "")){
				alert("비밀번호를 입력하세요.");
				frmLogin.pwd.focus();
			}else{
				frmLogin.method = "post";
				frmLogin.action = "${contextPath}" + "/login";	//로그인 서블릿 호출
				frmLogin.submit();
			}
		}
	</script>	

	
	<script type="text/javascript">
		function goUrl(url) {
			alert("회원가입 페이지로 이동합니다.");
			location.href = url;
		}
	</script>
	

</head>
<body>
	<body>
    <div class="login-wrapper">
    
    <a href="${contextPath}/main/boardList.jsp">
 		 <img src="${contextPath}/img/logo.png" alt="로고">
	</a>
        <h2>Login</h2>
        <form name="frmLogin" method="post" action="${contextPath}/login" id="login-form">
            <input type="text" name="id"  id="id" placeholder="ID">
            <input type="password" id="pwd" name="pwd" placeholder="Password">
            <label for="remember-check">
                <input type="checkbox" id="remember-check">아이디 저장하기
            </label>
            <c:if test="${loginErrMsg}">
				<tr>
					<td colspan="2">
						<p id="login_error">아이디또는 비밀번호가 맞지 않습니다.</p>
					</td>
				</tr>
			</c:if>	
            <input type="button" onClick="fn_validate();"  value="로그인">
            <button type="button"  onclick="goUrl('<c:url value="/login/new.jsp" />');">회원가입</button>
            
        </form>
    </div>
</body>
</body>
</html>