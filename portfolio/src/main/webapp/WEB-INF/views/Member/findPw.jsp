<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link href="/css/layout.css" rel="stylesheet" type="text/css" />
	<link href="/css/findPw.css" rel="stylesheet" type="text/css" />
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
				<h2>비밀번호 찾기</h2>
			</div>
			<form class="user" action="/Member/findPwPost" method="POST">
				<div class="x-member x-member-findpw">
					<div class="findPw">
						<h3>
							<img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/h3_find_pw.gif" alt="비밀번호 찾기">
						</h3>
						<fieldset>
							<ul class="base typeBullet gMedium">
								<li class="gBlank20">
									<strong class="term">아이디</strong>
									<span class="desc">
										<input id="member_id" name="member_id" class="lostInput" type="text">
									</span>
								</li>
								<li id="name_view" class="name">
									<strong class="term" id="name_lable">이름</strong>
									<span class="desc">
										<input id="name" name="name" class="lostInput x-member-name" type="text">
									</span>
								</li>
								<li id="email_view" class="email">
									<strong class="term">이메일</strong>
									<span class="desc">
										<input id="email" name="email" class="lostInput" type="text">
									</span>
								</li>
							</ul>
							<p class="base-button gBlank20">
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