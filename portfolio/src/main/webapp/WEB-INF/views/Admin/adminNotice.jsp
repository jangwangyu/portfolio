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
    <link href="/css/adminNotice.css" rel="stylesheet" type="text/css" />
</head>
<body id="main">
    <div id="wrap">
        <jsp:include page="/WEB-INF/views/Admin/interface.jsp"/>
        
        <div id="container">
            <div class="x-board x-board-listpackage board-1002">
                <div class="x-board x-board-board-title">
                    <div class="title">
                        <h2><font color="#555555">NOTICE</font></h2>
                        <p>ㅣ 공지사항입니다.</p>
                    </div>
                </div>
                <div class="base-table typeList gBorder">
                    <table border="1" summary>
                        <caption>게시판목록</caption>
                        <colgroup class="x-board x-board-listheader-1002 x-board-listheader">
                            <col style="width:70px">
                            <col style="width:auto">
                            <col style="width:84px">
                            <col style="width:77px">
                        </colgroup>
                        <thead class="x-board x-board-listheader-1002 x-board-listheader">
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">작성자</th>
                                <th scope="col">작성일</th>
                            </tr>
                        </thead>
                        <tbody class="x-board x-board-notice-1002 x-board-notice center">
                        <c:forEach var="row" items="${list }">
                            <!-- $count = 10 -->
                            <tr style="background-color: #FFFFFF; color:#555555;" class="x-record">
                                <td>공지</td>
                                <td class="subject left txtBreak">
                                    <strong><a href="/Admin/adminNoticeView?bno=${row.bno}">${row.title }</a></strong>
                                </td>
                                <td>${row.writer}</td>
                                <td>
                                    <span class="txtNum"><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd"/></span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <p class="x-board message">검색결과가 없습니다.</p>
                </div>
                <form id="boardSerachForm" name action="#" method="get" target="_top" enctype="multipart/form-data">
                    <input id="board_no" name="board_no" value="1" type="hidden">
                    <input id="page" name="page" value="1" type="hidden">
                    <input id="board_sort" name="board_sort" value type="hidden">
                    <div class="x-board board-search">
                        <fieldset class="boardSearch">
                            <legend>게시물 검색</legend>
                            <p>
                                <select id="search_date" name="search_date">
                                    <option value="week">일주일</option>
                                    <option value="month">한달</option>
                                    <option value="month3">세달</option>
                                    <option value="all" selected="selected">전체</option>
                                </select>
                                <select id="search_key" name="search_key">
                                    <option value="subject" selected="selected">제목</option>
                                    <option value="content">내용</option>
                                    <option value="writer_name">글쓴이</option>
                                    <option value="member_id">아이디</option>
                                    <option value="nick_name">별명</option>
                                </select>
                                <input id="search" class="inputTypeText" value="" type="text">
                                <a href="#none" onclick="BOARD.form_submit('boardSearchForm');">
                                    <img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_find.gif" alt="찾기">
                                </a>
                                <span class="gRight">
						            <a href="adminNoticeWrite"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_write.gif" alt="글쓰기"></a>
						        </span>
                            </p>
                        </fieldset>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>