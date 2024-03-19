<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/css/layout2.css" rel="stylesheet" type="text/css" />
</head>
<style>
	#container table td {width:100px;}
	.oriImg{width: 500px; height:auto;}
</style>
<body id="main">
    <div id="wrap">
        <jsp:include page="/WEB-INF/views/Admin/interface.jsp"/>
    	<div class="container">
	    	<form role="form" method="post" autocomplete="off">
			<input type="hidden" name="n" value="${view.gdsNum}" />
				<div class="inputArea">   
				   <label>1차 분류</label>
				   <span class="category1"></span>
				   <label>2차 분류</label>
				   <span class="category2">${view.cateCode} </span>
				</div>
				
				<div class="inputArea">
				   <label for="gdsName">상품명</label>
				   <span>${view.gdsName} </span>
				</div>
				
				<div class="inputArea">
				   <label for="gdsPrice">상품가격</label>
				   <span><fmt:formatNumber value="${view.gdsPrice}" pattern="###,###,###"/></span> 
				</div>
				
				<div class="inputArea">
				   <label for="gdsStock">상품수량</label>
				   <span>${view.gdsStock} </span>
				</div>
				
				<div class="inputArea">
				   <label for="gdsDes">상품소개</label>
				   <span>${view.gdsDes} </span>
				</div>
				<div class="inputArea">
					<label for="gdsImg">이미지</label>
					<p>원본 이미지</p>
					<img src="${view.gdsImg}" class="oriImg"/>
					 
					<p>썸네일</p>
					<img src="${view.gdsThumbImg}" class="thumbImg"/>
				</div>
				
				<div class="inputArea">
				   <button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
				   <button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
				</div>
				
			</form>
		</div>
	</div>

</body>
<script>
  var formObj = $("form[role='form']");
  
  $("#modify_Btn").click(function(){
   formObj.attr("action", "/Admin/itemModify");
   formObj.attr("method", "get")
   formObj.submit();
  });
  
  $("#delete_Btn").click(function(){
	   
	   var con = confirm("정말로 삭제하시겠습니까?");
	   
	   if(con) {        
	    formObj.attr("action", "/Admin/delete");
	    formObj.submit();
	   }
	});
 </script>
</html>