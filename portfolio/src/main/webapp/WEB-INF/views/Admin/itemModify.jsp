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
<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:100px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#gdsDes { width:400px; height:180px; }
.select_img img{width:500px; margin:20px 0;}
</style>
<body id="main">
    <div id="wrap">
        <jsp:include page="/WEB-INF/views/Admin/interface.jsp"/>
    	<div class="container">
    		<form role="form" method="post" autocomplete="off" action="/Admin/modify" enctype="multipart/form-data">
				<input type="hidden" name="gdsNum" value="${goods.gdsNum }" />
				<div class="inputArea">   
				   <label>1차 분류</label>
				   <select class="category1">
				   	<option value="">전체</option>
				   </select>
				
				   <label>2차 분류</label>
				   <select class="category2" name="cateCode">
					<option value="">전체</option>
				   </select>
				</div>
				
				<div class="inputArea">
				   <label for="gdsName">상품명</label>
				   <input type="text" id="gdsName" name="gdsName" value="${goods.gdsName}"/>
				</div>
				
				<div class="inputArea">
				   <label for="gdsPrice">상품가격</label>
				   <input type="text" id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}"/>
				</div>
				
				<div class="inputArea">
				   <label for="gdsStock">상품수량</label>
				   <input type="text" id="gdsStock" name="gdsStock" value="${goods.gdsStock}"/>
				</div>
				
				<div class="inputArea">
				   <label for="gdsDes">상품소개</label>
				   <textarea rows="5" cols="50" id="gdsDes" name="gdsDes" >${goods.gdsDes}</textarea>
				</div>
				
				<div class="inputArea">
					<label for="gdsImg">이미지</label>
					<input type="file" id="gdsImg" name="file" />
					<div class="select_img">
					<img src="${goods.gdsImg }" /></div>
					<input type="hidden" name="gdsImg" value="${goods.gdsImg }" />
					<input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}" />
				</div>
				<script>
					$("#gdsImg").change(function(){
						if(this.files && this.files[0]) {
					    	var reader = new FileReader;
					    	reader.onload = function(data) {
					     		$(".select_img img").attr("src", data.target.result).width(500);        
					    	}
					    	reader.readAsDataURL(this.files[0]);
					   	}
					});
				 </script>
				
				<%=request.getRealPath("/") %>
				<div class="inputArea">
				   <button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
				   <button type="button" id="back_Btn" class="btn btn-warning">취소</button>
				</div>
			
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	// 컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);
	
	var cate1Arr = new Array();
	var cate1Obj = new Object();
	
	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	   
	   if(jsonData[i].level == "1") {
	    cate1Obj = new Object();  //초기화
	    cate1Obj.cateCode = jsonData[i].cateCode;
	    cate1Obj.cateName = jsonData[i].cateName;
	    cate1Arr.push(cate1Obj);
	   }
	}
	
	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")
	
	for(var i = 0; i < cate1Arr.length; i++) {
	   cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
	        + cate1Arr[i].cateName + "</option>");   
	}

$(document).on("change", "select.category1", function(){

	   var cate2Arr = new Array();
	   var cate2Obj = new Object();
	   
	   // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	   for(var i = 0; i < jsonData.length; i++) {
	    
	    if(jsonData[i].level == "2") {
	     cate2Obj = new Object();  //초기화
	     cate2Obj.cateCode = jsonData[i].cateCode;
	     cate2Obj.cateName = jsonData[i].cateName;
	     cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	     
	     cate2Arr.push(cate2Obj);
	    }
	   }
	   
	   var cate2Select = $("select.category2");
	   
	   /*
	   for(var i = 0; i < cate2Arr.length; i++) {
	     cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	          + cate2Arr[i].cateName + "</option>");
	   }
	   */
	   
	   cate2Select.children().remove();

	   $("option:selected", this).each(function(){
	    
	    var selectVal = $(this).val();    
	    cate2Select.append("<option value='"+ selectVal + "'>전체</option>");
	    
	    for(var i = 0; i < cate2Arr.length; i++) {
	     if(selectVal == cate2Arr[i].cateCodeRef) {
	      cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	           + cate2Arr[i].cateName + "</option>");
	     }
	    }
	    
	   });
	   
	});
</script>
<script type="text/javascript">
	var select_cateCode = '${goods.cateCode}';
	var select_cateCodeRef = '${goods.cateCodeRef}';
	var select_cateName = '${goods.cateName}';
	
	if(select_cateCodeRef != null &amp;&amp; select_cateCodeRef != '') {
	   $(".category1").val(select_cateCodeRef);
	   $(".category2").val(select_cateCode);
	   $(".category2").children().remove();
	   $(".category2").append("<option value='"
	         					+ select_cateCode + "'>" + select_cateName + "</option>");
	} else {
	   $(".category1").val(select_cateCode);
	   //$(".category2").val(select_cateCode);
	   // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
	   $(".category2").append("<option value="' + select_cateCode + '" selected='selected'>전체</option>");
	}
</script>
<script type="text/javascript">
 $("#back_Btn").click(function(){
  //history.back();
  location.href = "/Admin/itemView?n=" + ${goods.gdsNum};
 });   
</script>
</html>