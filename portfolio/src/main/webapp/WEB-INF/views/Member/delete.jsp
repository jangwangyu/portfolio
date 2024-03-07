<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="/css/layout.css" rel="stylesheet" type="text/css" />
	<link href="/css/delete.css" rel="stylesheet" type="text/css" />
</head>
<body id="main">
    <div id="wrap">
    
        <jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
        
        <div id="container">
            <div class="titleArea">
                <h2>회원 탈퇴</h2>
            </div>
            <form action="/Member/deletePost" method="post" id="deleteForm" name="deleteForm">
            <input type="hidden" id="member_id" name="member_id" value="${login.member_id}">
	            <div class="x-element x-member x-member-edit">
		            <table border="1" summary>
		                <colgroup>
		                	<col style="width:150px;">
		                    <col style="width:auto;">
		                </colgroup>
		                	<tbody>
		                    	<tr>
		                        	<tr>
		                    	        <th scope="row">비밀번호</th>
		                	            <td>
		                                    <input id="passwd" name="passwd" maxlength="16" type="password">
		                                    (영문 대소문자/숫자 4자~16자)
		                                </td>
		                            </tr>
		                            <tr>
		                                <th scope="row">비밀번호 확인</th>
		                                <td>
		                                    <input id="user_passwd_confirm" name="user_passwd_confirm" autocomplete="off" maxlength="16"  type="password">
		                                    <span id="pwConfirmMsg"></span>
		                                </td>
		                            </tr>
		                    </tbody>
		            </table>
		            <div class="base-button justify">
		            	<a href="/">
	                        <img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_modify_cancel.gif" alt="취소">
	                    </a>
			            <span class="gRight">
			                <a href="#" id="deletee">
			                    <img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_modify_out.gif" alt="회원탈퇴">
			                </a>
			            </span>
			        </div>
		        </div>
	        </form>
        </div>
        <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
    </div>

</body>
<script type="text/javascript">
		$(document).ready(function(){
		
			$("#deletee").on("click", function(){
				
				if($("#passwd").val()==""){
					alert("비밀번호를 입력해주세요");
					$("#passwd").focus();
					return false
				}
				
				if($("#passwd").val()==""){
					alert("비밀번호 확인을 입력해주세요");
					$("#memberPw2").focus();
					return false
				}
				
				if ($("#passwd").val() != $("#user_passwd_confirm").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#user_passwd_confirm").focus();
					 
					return false;
					}
				
				$.ajax({
					url : "/Member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#deleteForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("비밀번호를 확인해주세요.");
							return;
						}else{
							if(confirm("탈퇴하시겠습니까?")){
								$("#deleteForm").submit();
							}
							
						}
					}
				})
			});
		})
	</script>
</html>