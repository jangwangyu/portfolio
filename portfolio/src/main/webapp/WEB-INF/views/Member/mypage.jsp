<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="Ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <link href="mypage.css" rel="stylesheet" type="text/css" />
</head>
<body id="main">
    <div id="wrap">
    
        <jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
        
        <div id="container">
            <div class="titleArea">
                <h2>마이 쇼핑</h2>
            </div>
            <div class="x-myshop x-myshop-asyncbankbook base-box gHalf">
                <ul>
                    <li class="">
                        <strong class="title">가용적립금</strong>
                        <strong class="data use"><span id="x_myshop_bankbook_avail_milege">0원</span></strong>
                        <a href="#" class="button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_result.gif" alt="조회"></a>
                    </li>
                    <li class>
                        <strong class="title">총적립금</strong>
                        <strong class="data"><span id="x_myshop_bankbook_total_milege">0원</span></strong>
                    </li>
                    <li class>
                        <strong class="title">사용적립금</strong>
                        <strong class="data"><span id="x_myshop_bankbook_used_milege">0원</span></strong>
                    </li>
                    <li class>
                        <strong class="title">예치금</strong>
                        <strong class="data"><span id="x_myshop_bankbook_deposit">0원</span></strong>
                        <a href="#" class="button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_result.gif" alt="조회"></a>
                    </li>
                    <li class>
                        <strong class="title">총주문</strong>
                        <strong class="data"><span id="x_myshop_bankbook_order_price">0원</span>
                            <span id="x_myshop_bankbook_order_count">(0회)</span>
                        </strong>
                    </li>
                    <li class>
                        <strong class="title">쿠폰</strong>
                        <strong class="data"><span id="x_myshop_bankbook_coupon_cnt">0개</span></strong>
                        <a href="#" class="button"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_result.gif" alt="조회"></a>
                    </li>
                </ul>
            </div>
            <div class="x-myshop x-myshop-orderstate">
                <div class="title">
                    <h3>나의 주문처리 현황</h3>
                    <span class="desc">(최근 3개월 기준)</span>
                </div>
                <div class="state">
                    <ul class="order">
                        <li>
                            <strong>입금전</strong>
                                <a href="#" class="count"><span id="xans_myshop_orderstate_shppied_before_count">0</span></a>
                        </li>
                        <li>
                            <strong>배송준비중</strong>
                            <a href="#" class="count"><span id="xans_myshop_orderstate_shppied_standby_count">0</span></a>
                        </li>
                        <li>
                            <strong>배송중</strong>
                            <a href="#" class="count"><span id="xans_myshop_orderstate_shppied_begin_count">0</span></a>
                        </li>
                        <li>
                            <strong>배송완료</strong>
                            <a href="#" class="count"><span id="xans_myshop_orderstate_shppied_complate_count">0</span></a>
                        </li>
                    </ul>
                    <ul class="cs">
                        <li>
                            <span class="icoDot"></span>
                            <strong>취소 : </strong>
                            <a href="#" class="count">
                                <span id="xans_myshop_orderstate_order_cancel_count">0</span>
                            </a>
                        </li>
                        <li>
                            <span class="icoDot"></span>
                            <strong>교환 : </strong>
                            <a href="#" class="count">
                                <span id="xans_myshop_orderstate_order_exchange_count">0</span>
                            </a>
                        </li>
                        <li>
                            <span class="icoDot"></span>
                            <strong>반품 : </strong>
                            <a href="#" class="count">
                                <span id="xans_myshop_orderstate_order_return_count">0</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="myshopMain" class="x-myshop x-myshop-main">
                <div class="shopMain order">
                    <h3>
                        <a href="/order.html">
                            <strong>order</strong>
                            주문내역 조회
                        </a>
                    </h3>
                    <p>
                        <a href="/order.html">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.
                        <br>비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.
                        </a>
                    </p>
                </div>
                <div class="shopMain profile">
                    <h3>
                        <a href="/modify.html">
                        <strong>profile</strong>
                        회원 정보</a>
                    </h3>
                    <p>
                        <a href="/modify.html">회원이신 고객님의 개인정보를 관리하는 공간입니다.
                            <br>개인정보를 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.
                        </a>
                    </p>
                </div>
                <div class="shopMain wishlist">
                    <h3>
                        <a href="/#">
                            <strong>wishlist</strong>
                            관심 상품
                        </a>
                    </h3>
                    <p>
                        <a href="/#">관심상품으로 등록하신 상품의 목록을 보여드립니다.
                        </a>
                    </p>
                </div>
                <div class="shopMain likeIt displaynone ">
                    <h3>
                        <a href="#">
                            <strong>Like it</strong>
                            좋아요
                        </a>
                    </h3>
                    <p>
                        <a href="#">'좋아요'를 선택한 상품과 상품분류 목록을 보여드립니다.
                        </a>
                    </p>
                </div>
                <div class="shopMain mileage ">
                    <h3 class="txtTitle16B">
                        <a href="/#">
                            <strong>mileage</strong>
                            적립금
                        </a>
                    </h3>
                    <p class="txtSub11">
                        <a href="/#">적립금은 상품 구매 시 사용하실 수 있습니다.
                            <br>적립된 금액은 현금으로 환불되지 않습니다.
                        </a>
                    </p>
                </div>
                <div class="shopMain deposits  ">
                    <h3 class="txtTitle16B">
                        <a href="/#">
                            <strong>deposits</strong>예치금
                        </a>
                    </h3>
                    <p class="txtSub11">
                        <a href="/#">예치금은 현금과 동일하게 상품 구매시 사용하실 수 있습니다.
                            <br>예치된 금액은 현금으로 환불이 가능합니다. (예치금 적립: 주문취소 등의 환불금액 발생 시 예치금으로 적립이 가능합니다.)
                        </a>
                    </p>
                </div>
                <div class="shopMain consult displaynone">
                    <h3>
                        <a href="/#">
                            <strong>consult</strong>
                            1:1 맞춤상담
                        </a>
                    </h3>
                    <p>
                        <a href="/#">고객님의 궁금하신 문의사항에 대하여 1:1맞춤상담 내용을 확인하실 수 있습니다.
                        </a>
                    </p>
                </div>
                <div class="shopMain coupon ">
                    <h3>
                        <a href="/#">
                            <strong>coupon</strong>
                            쿠폰
                        </a>
                    </h3>
                    <p>
                        <a href="/#">고객님이 보유하고 계신 쿠폰내역을 보여드립니다.
                        </a>
                    </p>
                </div>
                <div class="shopMain board">
                    <h3>
                        <a href="/#">
                            <strong>board</strong>
                            게시물 관리
                        </a>
                    </h3>
                    <p>
                        <a href="/#">고객님께서 작성하신 게시물을 관리하는 공간입니다.
                            <br>고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다.
                        </a>
                    </p>
                </div>
                <div class="shopMain Address">
                    <h3>
                        <a href="/#">
                            <strong>address</strong>
                            배송 주소록 관리
                        </a>
                    </h3>
                    <p>
                        <a href="/#">자주 사용하는 배송지를 등록하고 관리하실 수 있습니다.
                        </a>
                    </p>
                </div>
            </div>
            <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
        </div>
    </div>
</body>
</html>