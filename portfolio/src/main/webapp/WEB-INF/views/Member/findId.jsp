<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link href="/css/layout.css" rel="stylesheet" type="text/css" />
	<link href="/css/findId.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">



	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}


</script>
<body id="main">
	<div id="wrap">
	<jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
		<div id="container">
			<div class="titleArea">
				<h2>아이디 찾기</h2>
			</div>
			<form class="user" action="/Member/findIdPost" method="POST">
				<div class="x-member x-member-findid">
					<div class="findId">
						<h3>
							<img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/h3_find_id.gif" alt="아이디 찾기">
						</h3>
						<fieldset>
							<p id="name_view" class="name">
								<strong id="name_lable">이름</strong> 
								<input id="name" name="name" class="lostInput" type="text">
							</p>
							<p id="email_view" class="email">
								<strong>이메일로 찾기</strong> 
								<input id="email" name="email" class="lostInput" type="text">
							</p>
							<p class="base-button ">
				                <button type="submit">
				                	<img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_submit.gif" alt="확인">
				                </button>
				            </p>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
	</div>
</body>
</html>