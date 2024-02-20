<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <link href="cart.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="wrap">
        <jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
        
        <div id="container">
            <div class="titleArea">
                <h2>장바구니</h2>
            </div>
            <div class="order order-basketpackage">
                <div class="order order-tabinfo typeLight tab">
                    <ul class="menu">
                        <li class="selected">
                            <a href="#">국내배송상품(0)</a>
                        </li>
                        <li class="">
                            <a href="#">해외배송상품(0)</a>
                        </li>
                    </ul>
                    <p class="right">장바구니에 담긴 상품은 30일 동안 보관됩니다.</p>
                </div>
                <!-- 비어있을때 -->
                <div class="order-empty">
                    <p>장바구니가 비어 있습니다.</p>
                </div>
                <!-- 상품 -->
                <div class="orderListArea">

                </div>
                <div class="order order-totalorder order-button justify">
                    <a href="#none" onclick="Basket.orderAll(this)" class="">
                        <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_all.gif" alt="전체상품주문">
                    </a>
                    <a href="#none" onclick="Basket.orderSelectBasket(this)" link-order="/order/orderform.html?basket_type=all_buy" link-login="/member/login.html" class="">
                        <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_select.gif" alt="선택상품주문">
                    </a>
                    <span class="gRight">
                        <a href="\">
                            <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_ing.gif" alt="쇼핑계속하기">
                        </a>
                    </span>
                </div>
            </div>
            
            <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
            
        </div>
    </div>
</body>
</html>