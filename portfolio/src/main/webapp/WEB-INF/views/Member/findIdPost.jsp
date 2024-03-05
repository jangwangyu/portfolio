<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link href="/css/layout.css" rel="stylesheet" type="text/css" />
	<link href="/css/findIdPost.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
		<div id="container">
			<div class="titleArea">
				<h2>아이디 찾기</h2>
			</div>
			<div class="x-member x-member-findidresult">
				<div class="findId">
					<h3><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/h3_find_id.gif" alt="아이디 찾기"></h3>
					<p class="info">아이디 찾기가 완료 되었습니다.</p>
					<div class="base typeMember gMessage">
					<h2> 아이디는 : </h2><br/>
				  		<ul>
				  		<c:forEach items="${member}" var="member">
				  		  	
				  		  	<li>${member.member_id} </li><br/>
				  		
				  		</c:forEach>
				  		</ul>
				  	<h2>입니다</h2>
						<p class="base-button">
				            <a href="/Member/login" class=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_login.gif" alt="로그인"></a>
				            <a href="/Member/findPw" class=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_find_pw.gif" alt="비밀번호 찾기"></a>       
			            </p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>