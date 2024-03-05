<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
	<link href="/css/findIdPost.css" rel="stylesheet" type="text/css" />
</head>
<body id="main">
	<div id="wrap">
	<jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
		<div id="container">
			<div class="titleArea">
				<h2>회원가입</h2>
			</div>
				<div >
					<div>
						${member_id}님 회원가입해주셔서 감사합니다. <br>
						${email} 으로 인증메일을 보냈습니다 <br>
						메일 확인 후 인증버튼을 눌러주세요
					</div>
				</div>
		</div>
		<jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
	</div>
</body>
</html>