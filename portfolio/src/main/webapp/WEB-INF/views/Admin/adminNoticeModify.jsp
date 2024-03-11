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
    <link href="/css/adminNoticeWrite.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
	<div id="wrap">
        <jsp:include page="/WEB-INF/views/Admin/interface.jsp"/>
        <div id="container">
			<div class="x-board-write">
				<form id="write" method="post" action="/Admin/adminNoticeUpdate">
				<input type="hidden" name="bno" value="${view.bno}">
					<div class="base-table typeWrite">
						<table border="1">
							<colgroup>
								<col style="width:130px;">
								<col style="width:auto;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"> 제목</th>
		                    		<td> 
		                    			<input id="title" name="title" class="inputTypeText" maxlength="125" value="${view.title }" type="text">  
		                    		</td>
		                		</tr>
		                		<tr>
									<th scope="row"> 작성자</th>
		                    		<td> 
		                    			<input id="writer" name="writer" class="inputTypeText" readonly value="관리자" type="text">  
		                    		</td>
		                		</tr>
		                		<tr>
		                			<td colspan="2" class="clear">
		                				<textarea name="content" id="smartEditor" style="width: 100%; height: 412px;">
		                				${view.content } </textarea>
		                			</td>
		                		</tr>
							</tbody>
						</table>
						<a href="/Admin/adminNotice"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_list.gif" alt="목록"></a>
						<span class="gRight">
						    <a href="#" id="adminNoticeUpdate"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_write.gif" alt="글쓰기"></a>
							<a href="/Admin/adminNotice"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_cancel.gif" alt="취소"></a>
						</span>
						        
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "smartEditor",
		sSkinURI : "/editor/SmartEditor2Skin.html", //경로
		fCreator : "createSEditor2",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,

			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : false,

			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : false
		}
	});

	$(function() {
        $("#adminNoticeUpdate").click(function(e) {
            e.preventDefault(); // 기본 동작 중단
            oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 

            var title = $("#title").val();
            var content = document.getElementById("smartEditor").value;

            if (title == null || title == "") {
                alert("제목을 입력해주세요.");
                $("#title").focus();
                return;
            }
            if(content == "" || content == null || content == '&nbsp;' || 
                    content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
                alert("본문을 작성해주세요.");
                oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱
                return;
            } 
            
            var result = confirm("수정 하시겠습니까?");
            
            if(result){
                alert("수정 완료!");
                $("#write").submit();
            }else{
                return;
            }
        });
    })

</script>
</html>