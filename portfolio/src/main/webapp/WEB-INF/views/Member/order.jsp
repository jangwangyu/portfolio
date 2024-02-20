<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <link href="order.css" rel="stylesheet" type="text/css" />
</head>
<body id="main">
    <div id="wrap">
        
		<jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>

        <div id="container">
            <div class="titleArea">
                <h2>주문조회</h2>
            </div>
            <div class="x-myshop x-myshop-orderhistorytab base-tab">
                <ul class="menu">
                    <li class="tab_class selected">
                        <a href="order.html">주문내역조회 
                            (<span id="x_myshop_total_orders">0</span>)
                        </a>
                    </li>
                    <li class="tab_calss_cs">
                        <a href="orderCancel.html">취소/반품/교환 내역 
                            (<span id="xans_myshop_total_orders_cs">0</span>)
                        </a>
                    </li>
                </ul>
            </div>
            <form method="GET" id="OrderHistoryForm" name="OrderHistoryForm">
                <div class="x-myshop x-myshop-orderhistoryhead">
                    <fieldset class="base-box">
                        <div class="stateSelect">
                            <select id="order_status" name="order_status" class="fSelect">
                                <option value="all" selected="selected">전체 주문처리상태</option>
                                <option value="shipped_before">입금전</option>
                                <option value="shipped_standby">배송준비중</option>
                                <option value="shipped_begin">배송중</option>
                                <option value="shipped_complate">배송완료</option>
                                <option value="order_cancel">취소</option>
                                <option value="order_exchange">교환</option>
                                <option value="order_return">반품</option>
                            </select>
                        </div>
                        <span class="period">
                            <a href="#none" class="btnNormal" days="00">
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif" offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif" onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1_on.gif" alt="오늘">
                            </a>
                            <a href="#none" class="btnNormal" days="07">
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif" offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif" onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2_on.gif" alt="1주일">
                            </a>
                            <a href="#none" class="btnNormal" days="30">
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif" offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif" onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3_on.gif" alt="1개월">
                            </a>
                            <a href="#none" class="btnNormal" days="90">
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif" offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif" onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4_on.gif" alt="3개월">
                            </a>
                            <a href="#none" class="btnNormal" days="180">
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif" offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif" onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5_on.gif" alt="6개월">
                            </a>
                        </span>
                        <input id="history_start_date" name="history_start_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2024-02-17" type="text">
                        <button type="button" class="ui-datepicker-trigger">
                            <img src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="...">
                        </button>
                        ~
                        <input id="history_end_date" name="history_end_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2024-02-17" type="text">
                        <button type="button" class="ui-datepicker-trigger">
                            <img src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="...">
                        </button>
                        <input alt="조회" id="order_search_btn" type="image" src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif">
                    </fieldset>
                    <ul>
                        <li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
                        <li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
                    </ul>
                </div>
            </form>
            <div class="x-myshop x-myshop-orderhistorylistitem base-table typeList">
                <!--
                    $login_url = /member/login.html
                -->
                <div class="title">
                    <h3>주문 상품 정보</h3>
                </div>
                <table border="1" summary>
                    <colgroup>
                        <col style="width:135px;">
                        <col style="width:93px;">
                        <col style="width:auto;">
                        <col style="width:61px;">
                        <col style="width:111px;">
                        <col style="width:111px;">
                        <col style="width:111px;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">주문일자
                            <br>[주문번호]
                            </th>
                            <th scope="col">이미지</th>
                            <th scope="col">상품정보</th>
                            <th scope="col">수량</th>
                            <th scope="col">상품구매금액</th>
                            <th scope="col">주문처리상태</th>
                            <th scope="col">취소/교환/반품</th>
                        </tr>
                    </thead>
                </table>
                <p class="message">주문 내역이 없습니다.</p>
            </div>
            <div class="x-myshop x-myshop-orderhistorypaging base-paginate">
                <a href="#" class="first">
                    <img src="//img.echosting.cafe24.com/skin/base/common/btn_page_first.gif" alt="첫 페이지">
                </a>
                <a href="#">
                    <img src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif" alt="이전 페이지">
                </a>
                <ol>
                <li class="x-record">
                    <a href="#" class="this">1</a>
                </li>
                </ol>
                <a href="#">
                    <img src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif" alt="다음 페이지">
                </a>
                <a href="#" class="last">
                    <img src="//img.echosting.cafe24.com/skin/base/common/btn_page_last.gif" alt="마지막 페이지">
                </a>
            </div>
            <!-- 하단 -->
            <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
        </div>
    </div>
</body>
</html>