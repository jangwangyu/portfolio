<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
.table-hover>tbody>tr:hover {
	background-color: skyblue;
}
.pagination-container {
    justify-content: center;
    margin-top: 20px; /* 필요한 여백 조정 */
}
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/Admin/interface.jsp"/>
	<div style="margin-top: 100px; background-color: white; padding-bottom: 30px; border: 1px solid #ccc">
		<h1 class="text-center mt-5 mb-4" style="padding-top: 50px;">회원 목록</h1>
		<div class="text-right mb-3" style="margin-bottom: 10px;">
			<div class="panel col-md-8">
				<div class="body">
					<div class="input-group">
						<label for="searchBox"><h2>검색 : </h2></label>
						<input type="search" id="searchBox" placeholder="검색" style="margin-left:20px;">
					</div>
				</div>
			</div>
		</div>
	    <table class="myTable table table-hover" style="margin:0 auto">
			<tr>
				<th style="width: 9%;">아이디</th>
				<th style="width: 9%;">이름</th>
				<th style="width: 9%;">번호</th>
				<th style="width: 4%;">나이</th>
				<th style="width: 4%;">성별</th>
				<th style="width: 13%;">메일</th>
				<th style="width: 8%;">주소1</th>
				<th style="width: 13%;">주소2</th>
				<th style="width: 12%;">주소3</th>
				<th style="width: 10%">탈퇴</th>
				<th> </th>
			</tr>
		<tbody>
			<c:forEach items="${list}" var="user">
				<tr>
					<td>${user.member_id}</td>
					<td>${user.name}</td>
					<td>${user.mobile1}${user.mobile2}${user.mobile3}</td>
					<td>${user.birth_year}</td>
					<td>${user.is_sex}</td>
					<td>${user.email}</td>
					<td>${user.postcode1}</td>
					<td>${user.addr1}</td>	
					<td>${user.addr2}</td>
					<td></td>
					<td>
						<form action="/Admin/memberBan" method="POST">
							<input type="hidden" id="userId_input" name="member_id">
							<button type="submit" class="btn btn-danger me-2" name="member_id" data-users-id="${user.member_id}"> 
								회원탈퇴 
							</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>

	<script>
	$(document).ready(function() {
	    $(".btn-danger").on("click", function() {
	        var member_id = $(this).data("users-id");
	        if (confirm("탈퇴하시겠습니까?")) {
	            $.ajax({
	                type: "POST",
	                url: "memberBan",
	                data: { member_id: member_id },
	                dataType: "json",
	                success: function(response) {
	                    if (response.result === "success") {
	                        console.log("사용자 ID", member_id, "탈퇴 처리 완료");
	                        alert("회원 탈퇴 성공");
	                        window.location.href = "/Admin/memberList";
	                    } else {
	                        console.log("사용자 ID", member_id, "탈퇴 처리 실패");
	                        alert("회원 탈퇴 실패");
	                    }
	                },
	                error: function(xhr, status, error) {
	                    console.error("사용자 ID", member_id, "탈퇴 처리 오류:", error);
	                    alert("회원 탈퇴 중 오류가 발생하였습니다.");
	                }
	            });
	        }
	    });
	});
		
	let options = {
	    numberPerPage:10, //Cantidad de datos por pagina
	    goBar:true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
	    pageCounter:true, //Contador de paginas, en cual estas, de cuantas paginas
	};
	
    let filterOptions = {
	    el:'#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
	};

    paginate.init('.myTable',options,filterOptions);
	    
    let paginationWrap = document.querySelector('.paginate-wrap');
    paginationWrap.style.margin = '0 auto';
	
	</script>
</body>
</html>
