<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <link href="modify.css" rel="stylesheet" type="text/css" />
</head>
<body id="main">
    <div id="wrap">
    
        <jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
        
        <div id="container">
            <div class="titleArea">
                <h2>회원 정보 수정</h2>
            </div>
            <form id="editForm" name="editForm" action="#" method="POST" target="_self" enctype="multipart/form-data">
                <!--
                    input
                -->
                <div class="x-element x-member x-member-edit">
                    <!-- 
                        $login_page = /member/login.html
                    -->
                    <h3 class="">기본정보</h3>
                    <div class="base-table typeWrite">
                        <table border="1" summary>
                            <colgroup>
                                <col style="width:150px;">
                                <col style="width:auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">아이디</th>
                                    <td>
                                        <input id="member_id" name="member_id" label="아이디" fw-filter="isFill&isFill&isMin[4]&isMax[16]&isIdentity"  placeholder value type="text">
                                        <span id="idMsg" class="error">아이디를 입력해주세요.</span>
                                        (영소문자/숫자, 4~16자)
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">비밀번호</th>
                                    <td>
                                        <input id="passwd" name="passwd" label="비밀번호" autocomplete="off" maxlength="16" disabled="1" value type="password">
                                        (영문 대소문자/숫자 4자~16자)
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">비밀번호 확인</th>
                                    <td>
                                        <input id="user_passwd_confirm" name="user_passwd_confirm" fw-filter="isFill&isMatch[passwd]" label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" disabled="1" value type="password">
                                        <span id="pwConfirmMsg"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" id="nameTitle">이름</th>
                                    <td>
                                        <span id="nameContents">
                                            <input type="text" name="name" id="name" maxlength="20">
                                        </span>
                                    </td>
                                </tr>
                                <tr calss>
                                    <th scope="row">주소</th>
                                    <td>
                                        <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg class="inputTypeText" placeholder readonly="readonly" maxlength="14" value type="text">
                                        <a href="#none" onclick id="postBtn"><img src="" alt="우편번호"></a>
                                        <br>
                                        <input id="addr1" name="addr1" fw-filter fw-label="주소" fw-msg class="inputTypeText" placeholder readonly="readonly" value type="text">
                                        기본주소
                                        <br>
                                        <input id="addr2" name="addr2" fw-filter fw-label="주소" fw-msg class="inputTypeText" placeholder value type="text">
                                        나머지 주소(선택입력가능)
                                    </td>
                                </tr>
                                <tr class>
                                    <th scope="row">휴대전화</th>
                                    <td>
                                        <select id="mobile1" name="mobile[]" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg>
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="017">017</option>
                                            <option value="018">018</option>
                                            <option value="019">019</option>
                                        </select>
                                        -
                                        <input id="mobile2" name="mobile[]" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg placeholder value type="text">
                                        -
                                        <input id="mobile3" name="mobile[]" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg placeholder value type="text">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">이메일</th>
                                    <td>
                                        <input id="email" name="email" fw-filter="isFill&isEmail" fw-label="이메일" fw-alone="N" fw-msg placeholder value type="text">
                                        <span id="emailMsg"></span>
                                    </td>
                                </tr>    
                            </tbody>
                        </table>
                    </div>
                    <h3 class=" ">추가정보</h3>
                    <div class="base-table typeWrite">
                        <table border="1" summary>
                            <caption>회원 추가정보</caption>
                            <colgroup>
                                <col style="width:150px">
                                <col style="width:auto">
                            </colgroup>
                            <tbody>
                                <tr class>
                                    <th scope="row">성별</th>
                                    <td>
                                        <input id="is_sex0" name="is_sex" fw-filter fw-label="성별" fw-msg value="M" type="radio" autocomplete="off">
                                        <label for="is_sex0">남자</label>
                                        <input id="is_sex1" name="is_sex" fw-filter fw-label="성별" fw-msg value="F" type="radio" autocomplete="off">
                                        <label for="is_sex1">여자</label>
                                    </td>
                                </tr>
                                <tr class>
                                    <th scope="row">생년월일</th>
                                    <td>
                                        <input id="birth_year" name="birth_year" fw-filter fw-label="생년월일" fw-msg class="inputTypeText" placeholder maxlength="4" value type="text">
                                        년
                                        <input id="birth_month" name="birth_month" fw-filter fw-label="생년월일" fw-msg class="inputTypeText" placeholder maxlength="2" value type="text">
                                        월
                                        <input id="birth_day" name="birth_day" fw-filter fw-label="생년월일" fw-msg class="inputTypeText" placeholder maxlength="2" value type="text">
                                        일
                                    </td>
                                </tr>
                                <tr class>
                                    <th scope="row">환불계좌 정보</th>
                                    <td>
                                        <a href="#none" onclick="window.open('/#','bank_account','width=300,height=300');return false;">
                                            <img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_account.gif" alt="환불계좌등록" id="id_reg_bank_img" class="">
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
	                </div>
	                <div class="base-button justify">
	                    <a href="#none" onclick="memberEditAction()">
	                        <img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_modify_member.gif" alt="회원정보수정">
	                    </a>
	                    <a href="/Home.html">
	                        <img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_modify_cancel.gif" alt="취소">
	                    </a>
	                    <span class="gRight">
	                        <a href="#none" onclick="memberDelAction(0, 0, -1)">
	                            <img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_modify_out.gif" alt="회원탈퇴">
	                        </a>
	                    </span>
	                </div>
	            </form>
            </div>
            <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
        </div>
    </div>
</body>
</html>