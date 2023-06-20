<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>         
      $(document).ready(function(){
         // 이벤트 핸들러 
         $("#btnCheck").on('click', function(e){  
            // 다음 처리 안하면 서버로 요청이 일어남
            e.preventDefault();
         
            let id = $('#id').val();   // id에 입력된 값
            
            if(id.length == 0 || id == ""){
               alert("아이디를 입력하세요."); 
               $('id').focus();
               return;
            }
            
            // 입력값 디버깅
            console.log('id ', id); 
            
            // ajax 호출
            $.ajax({
               url : '${contextPath}/idCheck',  // 서버 url
               type : 'get',              // 요청방식 (get, post, put 등등)
                data : {id: id},         // 서버로 전송할 데이터(key:value)
                dataType : 'text',          // 전달받을 데이터타입(html,xml,json,text)
                success : function(result) {// 결과 성공 콜백함수
                    console.log(result);   // [디버깅]받은 결과 출력
                    if(result === 'true'){
                        $('#result').addClass('errorMsg')
                                 .text('아이디가 이미 존재합니다.');
                       //alert("아이디가 이미 존재합니다.")
                    }else{
                        $('#result').addClass('okMsg')
                                 .text('사용 가능한 아이디입니다.');                       
                    }
                },
                error : function(request, status, error) { // 결과 에러 콜백함수
                    console.log(error)
                }
            })   // end ajax
            
         }); // end btnCheck
            
         // 메시지 클리어 버튼 클릭 이벤트 핸들러
         $('#clearMsg').on('click', function(e){
            // 다음 처리 안하면 서버로 요청이 일어남
            e.preventDefault();
            // result text값 클리어
            $('#result').text('');
         });
         
         
         $('#cancel').on('click', function() {
			  if (confirm('회원가입을 취소하시겠습니까?')) {
			    location.href = '${contextPath}/main/boardList.jsp'; // 확인을 누르면 board.list로 이동
			    return true;
			  } 
			});
		
         
         
         
    
     });   // end ready
      
    		   
      function checkInfo(event) {
  		event.preventDefault();
  		
  		// 각 입력값을 검증할 정규표현식
  		var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
  		var regExpName = /^[가-힣]*$/;
  		var regExppwd = /[ `!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
  		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
  		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  		
  		var id = document.getElementById('id').value;
  		var name = document.getElementById('name').value;
  		var pwd = document.getElementById('pwd').value;
  		var phone = document.getElementById('phone').value;
  		var email = document.getElementById('email').value;


  		// 아이디의 길이 체크
  		if (id.length < 8) {
  			alert('아이디는 8자 이상이어야 합니다.');
  			document.getElementById('id').focus();
  			return;
  		}
  		// 아이디 정규표현식 체크
  		if(!regExpId.test(id)){
  			alert("아이디는 문자로 시작해주세요");
  			document.getElementById('id').focus();
  			return;
  		}

  		// 비밀번호 공란 검증
  		if (pwd.trim() === '') {
  			alert('비밀번호를 입력하세요.');
  			document.getElementById('pwd').focus();
  			return;
  		}
  		// 비밀번호 길이 검증
  		if (pwd.length < 8) {
  			alert('비밀번호는 8자 이상이어야 합니다.');
  			document.getElementById('pwd').focus();
  			return;
  		}		
  		// 비밀번호 정규표현식 검증
  		if(!regExppwd.test(pwd)){
  			alert("비밀번호는 특수문자가 포함되어야 합니다.");
  			document.getElementById('pwd').focus();
  			return;
  		}
  		
  		// 이름 검증
  		if(!regExpName.test(name)){
  			alert("이름은 한글만 입력해주세요.");
  			document.getElementById('name').focus();
  			return;
  		}
  		// 연락처 검증
  		if(!regExpPhone.test(phone)){
  			alert("하이픈 포함 입력해주세요.");
  			document.getElementById('phone').focus();
  			return;
  		}
   
  		
  		// 모든 검증이 끝나서 막아놓았던 submit을 실행함.
  		document.getElementById('signup').submit();
  	}
      
      
/*       function checkPwd(event){
    	//비밀번호 확인
  		$('#pwd2').on('click',function(){
  		   if($('#pwd').val() != $('#pwd3').val()){
  		    	if($('#pwd3').val()!=''){
  			    alert("비밀번호가 일치하지 않습니다.");
  		    	    $('#pwd3').val('');
  		          $('#pwd3').focus();
  		       }
  		    }else {
  		    	alert("비밀번호가 일치합니다.");
  		    }
  		});
      } */
      
      function checkPwd(event) {
    	  //비밀번호 확인
    	  var pwd1 = $('#pwd').val();
    	  var pwd2 = $('#pwd3').val();
    	  
    	  if (pwd1 === pwd2) {
    	    $('#result1').text('비밀번호가 일치합니다.');
    	    $('#pwd3').val();
    	  } else {
    	    $('#result1').text('비밀번호가 일치하지 않습니다.');
    	    $('#pwd3').val('').focus();
    	  }
    	}

      
           
           
      
   </script>  
  <!--  <script type="text/javascript">
		function goUrl(url) {
			alert("메인 페이지로 이동합니다.");
			location.href = url;
		}
		
	</script>  -->

<style type="text/css">

  #info__id {
  position: center;
  }
  display #info__id {
  margin: auto;
  display: flex;
  flex-direction : column;
  }
  
  #signup > button[type="button"]{
    color: #fff;
    font-size: 16px;
    background-color: #6A24FE;
    margin-top: 20px;
    width: 100px; 
    height: 40px;
}
#signup > input[type="submit"]{
    color: #fff;
    font-size: 16px;
    background-color: #6A24FE;
    margin-top: 20px;
    width: 100px; 
    height: 40px;
}
  

</style>

</head>
<body>
   <form name="signup" id="signup" method="post"  action="${contextPath}/signup" style="text-align: center;">
   
   <h1 style="text-align: center;">회원가입</h1>
   <label style="display: block; text-align: center; font-size: 16px;">회원가입후 더 많은 혜택을 누려보세요.</label> 
   <!-- <h3 style="text-align: center;">회원가입후 더 많은 혜택을 누려보세요.</h3> -->
   
   <div id="info__id" >
      <h4>아이디</h4> 
        <input type="text" id="id"  name="id" size="40" placeholder="아이디 입력(6~20자)" required/>
        <button type="button"  id="btnCheck" name="btnCheck">중복 확인</button>
        
   </div>
   <div id="result" style="color: red;"> </div>
   
   <!-- <div id="info__pwd" >
      <h4>비밀번호</h4>
        <input type="password" id="pwd" name="pwd" size="40" placeholder="비밀번호 입력(문자,숫자,특수문자 포함 8자이상)" required/>
   </div>
   <div id="info__pwdchck" >
       <h4>비밀번호 확인</h4>
        <input type="password" id="pwd3" size="40" placeholder="비밀번호 재입력" required/>
        <input type="button" value="비밀번호 확인" id="pwd3" onclick="checkPwd(event)">
       <button type="button" id="pwd2"  onclick="checkPwd(event)">비밀번호 확인</button>
   </div> -->
   
   <div id="info__pwd" >
  <h4>비밀번호</h4>
  <input type="password" id="pwd" name="pwd" size="40" placeholder="비밀번호 입력(문자,숫자,특수문자 포함 8자이상)" required/>
</div>

<div id="info__pwdchck" >
  <h4>비밀번호 확인</h4>
  <input type="password" id="pwd3" size="40" placeholder="비밀번호 재입력" required/>
  <button type="button" id="pwd2" onclick="checkPwd(event)">비밀번호 확인</button>
</div>

 <div id="result1" style="color: red;"> </div>
   
   
   
   
   
   
   <div id="info__name" >
       <h4>이름</h4>
        <input type="text" size="40"  id="name" name="name"  placeholder="이름 입력" required/>
   </div>
   <div id="info__phone" >
       <h4>전화번호</h4>
        <input type="text" size="40" id="phone" name="phone" required placeholder= "예) 010-1234-1234"  >
   </div>
   
   <div class="box domain">
      <h4>이메일</h4>
      <input type="email" size="40" id="email" name="email" placeholder= "이메일주소" required/> 
   </div>
   <div class="box address">
      <h4>주소</h4>
      <input type="text" size="40"  id="address" name="address"  placeholder= "도로명주소 + 상세주소 작성" required/> 
   </div>
   <div class="box birth">
      <h4>주민번호 앞자리</h4>
      <input type="text" size="40"  id="jumin" name="jumin" placeholder= "생년월일 ex)1901.01.01" required/> 
   </div>
   <div class="box gender">
      <h4>성별</h4>
      <!-- <input type="text" size="40"  id="gender" name="gender" placeholder= "남자,여자" required/> --> 
      
      <label for="radio1">남자</label>
      <input type="radio" name="gender" value="M" id="radio1" checked>
      <label for="radio2">여자</label>
      <input type="radio" name="gender" value="W" id="radio2" >
   </div>
   
   <br><br>
   <input type="submit"  onclick="checkInfo(event)"   value="가입하기">
   <button type="button" id="cancel"  onclick="goUrl('<c:url value="/main/boardList.jsp" />');"> 가입취소 </button>
   
   </form>
</body>
</html>