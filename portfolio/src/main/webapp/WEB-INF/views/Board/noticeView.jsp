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
    <link href="/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/css/noticeView.css" rel="stylesheet" type="text/css" />
</head>
<body id="main">
    <div id="wrap">
        <jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
    		<div id="container">
    			<div class="title">
    				<h2><font color="#555555">NOTICE</font> </h2>
    				<p>공지사항입니다.</p>
    			</div>
    			<div class="x-board-read x-board">
    				<div class="base-table typeWrite">
    					<table border="1">
    						<colgroup>
    							<col style="width:130px;">
    							<col style="width:auto;">
    						</colgroup>
    						<tbody>
    							<tr>
									<th scope="row">제목</th>
									<td>${dto.title }</td>
								</tr>
								<tr>
									<th scope="row">작성자</th>
				                    <td>${dto.writer }</td>
				                </tr>
				                <tr>
									<td colspan="2">
									<ul class="etcArea">
										<li>
											<strong>작성일</strong> 
											<span class="txtNum"><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/></span>
										 </li>
									</ul>
									<div class="detail">
										<div class="view view-article">
											${dto.content }
										</div>
									</div>
				                </tr>
    						</tbody>
    					</table>
    				</div>
    				<div class="base-button">
    					<span class="gLeft">
			                <a href="/Board/notice"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_list.gif" alt="목록"></a>
			            </span>
    				</div>
    			</div>
    			
    		</div>    
    </div>
</body>
</html>