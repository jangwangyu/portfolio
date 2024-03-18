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
</style>
<body id="main">
    <div id="wrap">
        <jsp:include page="/WEB-INF/views/Admin/interface.jsp"/>
    	<div class="container">
    		<table>
			   <thead>
			    <tr>
			     <th>번호</th>
			     <th>이름</th>
			     <th>카테고리</th>
			     <th>가격</th>
			     <th>수량</th>
			     <th>등록날짜</th>
			    </tr>
			   </thead>
			   <tbody>
			    <c:forEach items="${list}" var="list">
			    <tr>
			     <td><a href="/Admin/itemView?n=${list.gdsNum}">${list.gdsNum}</a></td>
			     <td><a href="/Admin/itemView?n=${list.gdsNum}">${list.gdsName}</a></td>
			     <td>${list.cateCode}</td>
			     <td><fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###" /></td>
			     <td>${list.gdsStock}</td>
			     <td><fmt:formatDate value ="${list.gdsDate}" pattern="yyyy-MM-dd" /></td>
			    </tr>     
			    </c:forEach>
			   </tbody>
			</table>	
    	</div>
    </div>

</body>
</html>