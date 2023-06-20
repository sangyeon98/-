<!-- mainList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="pageContext.request.contextPath" />

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>메인 화면</title>
    
    <link rel="stylesheet" href="../css/main.css"> <!-- css파일에서 main.css 을 불러온다. -->
    <link rel="stylesheet" href="../css/loginForm.css">
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="top">
                <div>
                    <p>
                            <c:if test="${not empty sessionScope.member.id}" >
   							 <strong>${sessionScope.member.name}(${sessionScope.member.id})님</strong>
   						 <a href="${pageContext.request.contextPath}/logout"><strong>로그아웃</strong></a>
							</c:if>

						<c:if test="${empty sessionScope.member.id}" >
						    <a href="${pageContext.request.contextPath}/login"><strong>로그인</strong></a>
						    <a href="../login/new.jsp"><strong>회원가입</strong></a>
						</c:if>
                     
                    </p>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="${pageContext.request.contextPath}//productList.do">&emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                     상품</a>
                    &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                    &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                    &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                    <img src="../img/logo.png" alt="로고">
                    <a href="#">&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                       &emsp; &emsp; 후기</a>
                    <a href="#">&emsp; &emsp; &emsp; &emsp; 문의</a>
                   <a href="../img/cart.jsp">&emsp; &emsp;<img src="../img/cart.png" alt="로고"></a>
                </div>
                <br>
                   <a href="#">
                   &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                   &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                   &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
                   <img src="../img/category.png" alt="로고">
                       카테고리
                 </a>
               <a href="#">&emsp; &emsp; &emsp; &emsp; 정육</a>
               <a href="#">&emsp; &emsp; &emsp; &emsp; 채소</a>
               <a href="#">&emsp; &emsp; &emsp; &emsp; 과일</a>
               <a href="#">&emsp; &emsp; &emsp; &emsp; 간식</a>
               <a href="#">&emsp; &emsp; &emsp; &emsp; 과자</a>
               <a href="#">&emsp; &emsp; &emsp; &emsp; 밀키트</a>
            </div>
            <br><br>
        </header>
        <section id="cs">
            <div class="main">
            &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
            &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
            &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
            &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
            &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
            &emsp; &emsp; &emsp; &emsp;
            <img src="../img/curly.png" alt="로고">
                <section class="tel">
                    <h1>고객 행복센터</h1>
                    <article>
                        <div>
                            <h3>고객    행복센터 이용안내</h3>
                            <p>
                                <strong>1644-1107</strong>
                                <a>&emsp;<img src="../img/write1.png" alt="로고"></a>
                                <a>&emsp;<img src="../img/write2.png" alt="로고"></a>
                                <br><br>
                            </p>
                        </div>
                    </article>
                    <article>
                        <div>
                           <a>&emsp;<img src="../img/write3.png" alt="로고"></a>
                            <p>
                                     
                            </p>
                        </div>
                    </article>
                </section>
            </div>
        </section>
        <footer>
            <div>
           &emsp; &emsp; &emsp;<img src="../img/footer1.png" alt="로고">
           <br><br>
           &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;<img src="../img/footer2.png" alt="로고">
            </div>
        </footer>
    </div>
</body>