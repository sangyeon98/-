<!-- 회원가입 폼 -->c

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:set var="contextPath" value="${pageContext.request.contextPath}" />



    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MARKET KURLY 회원가입</title>

<style>
  label {
    font-size: 1.5em;
  }
  label[for="id"] {
  position: relative;
  left: -110px; /* 적당한 값을 지정하세요 */
 }
  
  
  input {
  	width: 300px;
  }
  input[type="submit"] {
    width: 100px;
    background-color: #1E90FF;
  }
  
  div{
    text-align: center;
  }
  
  button[type="button"] {
    background-color: #8B008B;
    width: 100px;
  }
  
  form {
  text-align: center;
  } 
  


</style>

</head>
<body>
	<form name="signup" method="post" action="${contextPath}/signup">
		<h1 style="text-align: center" >회원가입</h1>
		<h4 style="text-align:  center">빈칸없이 입력해주세요</h4>
		
			
		<!-- <table>
		<tr>
			<td>
  			<input type="text" name="id" placeholder="아이디 입력8자~20자 이내" required="required" style="position: absolute; left: 300px; top: 200px;">
  			</td>
  		</tr>
		</table> -->
		
	<div>
    <label for="id">아이디</label>
    <br><br>
    <input type="text" id="id" name="id" placeholder="8~20자 이내" required>
    <button  type="button" id="check" >중복확인</button>
    <br><br><br>
  </div>
  <div>
    <label for="id">비밀번호</label>
    <br><br>
    <input type="password" id="password" name="password" placeholder="대문자,소문자,특수문자,숫자 하나씩 사용" required>
    <br><br><br>
  </div>
  <div>
    <label for="id">비밀번호확인</label>
    <br><br>
    <input type="password" id="password" name="password" placeholder="비밀번호 재입력 확인" required>
    <br><br><br>
  </div>
  <div>
    <label for="id">이름</label>
    <br><br>
    <input type="text" id="name" name="name" placeholder="이름을 작성하세요." required>
    <br><br><br>
  </div>
  <div>
    <label for="id">전화번호</label>
    <br><br>
    <input type="text" id="phone" name="phone" placeholder= 휴대폰번호&quot;-"없이입력 required>  
    <br><br><br>
  </div>
  <div>
    <label for="id">이메일주소</label>
    <br><br>
    <input type="email" id="email" name="email" placeholder="이메일형식에 맞게 작성하세요." required>
    <br><br><br>
  </div>
  <div>
    <label for="id">주소</label>
    <br><br>
    <input type="text" id="address" name="address" placeholder="도로명주소 + 상세주소" required>
    <br><br><br>
  </div>
  <div>
    <label for="id">생년월일</label>
    <br><br>
    <input type="text" id="birth" name="birth"  placeholder="예)1909.01.01" required>
    <br><br><br>
  </div>
  <br>
  
  <input type="submit" style="margin-right:50px;" value="가입하기">
  <button type="button" onclick="goUrl('<c:url value="/boardList" />');"> 가입취소</button>

		
		
		
		
		
		
		
		
		
		
	
	
	</form>

</body>
</html>