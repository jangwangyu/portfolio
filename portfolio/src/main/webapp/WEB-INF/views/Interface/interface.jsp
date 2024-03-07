<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">
            <!-- 공용 인터페이스 -->
            <div class="topLogo">
                <!-- 홈페 로고 -->
                <a href="/">포트폴리오</a>
            </div>
            <div class="topLog">
                <div class="layout-statelogoff">
                <!-- 로그인 -->
             	<c:if test="${empty login}">
                    <li><a href="../Member/login" class="-ms">LOGIN</a></li>
                </c:if>
                 <c:if test="${not empty login}">
                 	<li><a href="${path}/Member/logout" class="-ms">LOGOUT</a></li>
                 </c:if>
                    <li><a href="../Member/modify" class="-ms">MODIFY</a></li>
                    <li><a href="../Member/cart" class="-ms">CART</a></li>
                    <li><a href="../Member/order" class="-ms">ORDER</a></li>
                    <li><a href="../Member/mypage" class="-ms">MYPAGE</a></li>
                </div>
            </div>
            <div id="topMenu">
                <!-- 카테고리 -->
                <div class="category1">
                    <h2>CATEGORY</h2>
                    <div class="position">
                        <ul>
                            <li class="-record"><a href="#">BEST</a></li>
                            <li class="-record"><a href="#">NEW 5%</a></li>
                            <li class="-record"><a href="#">TIME SALE 10%</a></li>
                            <li class="-record"><a href="#">OUTER</a></li>
                            <li class="-record"><a href="#">SUIT</a></li>
                            <li class="-record"><a href="#">SHIRT</a></li>
                            <li class="-record"><a href="#">TOP</a></li>
                            <li class="-record"><a href="#">KNIT</a></li>
                            <li class="-record"><a href="#">BOTTOM</a></li>
                            <li class="-record"><a href="#">SHOES</a></li>
                            <li class="-record"><a href="#">ACC</a></li>
                            <li class="-record"><a href="#">1+1 EVENT</a></li>
                            <li class="-record"><a href="#">당일발송</a></li>
                        </ul>
                    </div>
                </div>
                <div class="category2">
                    <h2>COMMUNITY</h2>
                    <ul>
                        <li><a href="/Board/notice">NOTICE</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Q&A</a></li>
                        <li><a href="#">REVIEW</a></li>
                        <li><a href="#">MEMBERSHIP</a></li>
                    </ul>
                </div>
                <div class="category3">
                    <ul>
                        <li><a href="#"><span>BOOKMARK</span></a></li>
                        <li><a href="#">TODAY VIEW</a></li>
                    </ul>
                </div>
            </div>
            <div id="menuSns">
                <!-- sns 로고 -->
                <ul>
                    <li>
                        <a href="">
                            <i class="xi xi -instagram"></i>
                            INSTAGRAM
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <i class="xi xi -facebook"></i>
                            FACEBOOK
                        </a>
                    </li>
                </ul>
            </div>
            <form id="searchBarForm" name action="" method="get" target="_self" enctype="multipart/form-data">
                <!-- 검색창 -->
                <input id="banner_action" name="banner_action" value type="hidden">
                <div calss="">

                </div>
            </form>
            <div id="menuCs">
                <ul class="layout-footer">
                    <li class="tel">T.010-0000-0000</li>
                    <li>
                        mon-fri 09:00am - 18:00pm
                        <br>
                        sat,sun,holiday off
                        <br>
                        <br>
                        예금주 : 장완규
                        <br>
                        카카오뱅크 0000000000
                        <br>
                        <br>
                    </li>
                </ul>
            </div>
        </div>