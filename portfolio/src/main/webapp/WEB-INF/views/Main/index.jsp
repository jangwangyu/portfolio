<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="Ko"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/css/index.css" rel="stylesheet" type="text/css" />
<style>
    h2.bestTitle {
        margin:0px 38px;
        text-align: left;
        font-weight: normal;
        color: #000;
        letter-spacing: 1pt;
    }
    .goodsName { 
    	display:block;
    	text-align: left;
    	font-weight: normal;
    	margin: 0 0;
     }
</style>
</head>
<body id="main">
    <div id="wrap">
        <jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
        <!-- 본문 -->
        <div id="container">
            <div id="tabPrd">
                <!-- 상품 롤링 -->
                <div class="base-product">
                    <h2>WEEKLY BEST</h2>
                    <div id="underline"></div>
                </div>
                <!-- 작은 카테고리 -->
                <div id="prdPager">
                    <li><a data-slide-index="0" href class="active">OUTER</a></li>
                    <li><a data-slide-index="1" href>KNIT</a></li>
                    <li><a data-slide-index="2" href>TOP</a></li>
                    <li><a data-slide-index="3" href>BOTTOM</a></li>
                    <li><a data-slide-index="4" href>SHIRT</a></li>
                    <li><a data-slide-index="5" href>SHOES</a></li>
                    <li><a data-slide-index="6" href>ACC</a></li>
                </div>
                <div class="bx-wrapper" style="max-width: 100%">
                    <div class="bx-viewport" style="width: 100%; overflow: hidden;">
                        <div class="prdSlider" style="width: auto; position:relative;">
                            <div class="base-product-1">
                                <ul class="prdList grid1">
                                	<c:forEach items="${list }" var="list" varStatus="status">
	                                	<c:if test="${status.index < 6}">
		                                    <li class="prdbox1">
		                                        <div class="prdbox">
		                                            <a href="#"><!-- 옷 링크 -->
		                                                <img src="${list.gdsImg }" alt="">
		                                            </a>
		                                            <span class="goodsName">
		                                            	<a href="/shop/view?n=${list.gdsNum }">${list.gdsName }</a>
		                                            </span>
		                                        </div>
		                                    </li>
	                                    </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="bx-controls"></div>
                </div>
            </div>
            <!-- 신상 -->
            <div class="listmain-2 base-product base-product-1">
                <h2>NEW ARRIVAL</h2>
                <div id="underline"></div>
                <ul class="prdList grid2">
                <c:forEach items="${list }" var="list">
                    <li class="-record">
                        <div class="prdbox">
                            <a href="/shop/shopView?n=${list.gdsNum }">
                                <img src="${list.gdsImg }" alt="옷1번">
                            </a>
                        </div>
                        <div class="description">
                            <strong class="name">
		                    	<a href="/shop/shopView?n=${list.gdsNum}">${list.gdsName }</a>
		                    </strong>                        	
                        </div>
                        <ul class="x-listitem2">
                        	<li class="x-record" style="font-size:12px; color:#303030;">${list.gdsPrice }원</li>
                        </ul>
                    </li>
                </c:forEach>
                </ul>
            </div>
            <!-- 하단 -->
            <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
        </div>
    </div>
</body>
<script>
    // 2초마다 호출되는 함수
function moveActiveClass() {
    var activeElement = document.querySelector('#prdPager .active');
    var nextElement = activeElement.parentElement.nextElementSibling;

    if (nextElement === null) {
        // 다음 요소가 없으면 첫 번째 요소로 이동
        nextElement = document.querySelector('#prdPager li:first-child');
    }

    // "active" 클래스를 다음 요소로 옮기기
    activeElement.classList.remove('active');
    nextElement.querySelector('a').classList.add('active');
}

// 페이지가 로드될 때마다 2초마다 moveActiveClass 함수 호출
window.onload = function() {
    setInterval(moveActiveClass, 3000); // 2초마다 실행
};

</script>
</html>