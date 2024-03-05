<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/css/modify.css" rel="stylesheet" type="text/css" />
</head>
<body id="main">
    <div id="wrap">
    
        <jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
        
        <div id="container">
            <div class="titleArea">
                <h2>회원 정보 수정</h2>
            </div>
            <form id="modify" action="/Member/updateMember" method="POST">
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
                                        <input id="member_id" name="member_id"  readonly value="${member.member_id}" type="text">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">비밀번호</th>
                                    <td>
                                        <input id="passwd" name="passwd" maxlength="16" type="password">
                                        (영문 대소문자/숫자 4자~16자)
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">비밀번호 확인</th>
                                    <td>
                                        <input id="user_passwd_confirm" name="user_passwd_confirm" autocomplete="off" maxlength="16"  type="password">
                                        <span id="pwConfirmMsg"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" id="nameTitle">이름</th>
                                    <td>
                                        <span id="nameContents">
                                            <input type="text" name="name" id="name" value="${member.name}" maxlength="20">
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">주소</th>
                                    <td>
                                        <input id="postcode1" name="postcode1" fw-msg class="inputTypeText" readonly="readonly" maxlength="14" value="${member.postcode1}" type="text">
                                        <a href="#none" onclick id="postBtn"><img src="" alt="우편번호"></a>
                                        <br>
                                        <input id="addr1" name="addr1" class="inputTypeText" readonly="readonly" value="${member.addr1}" type="text">
                                        기본주소
                                        <br>
                                        <input id="addr2" name="addr2" class="inputTypeText" value="${member.addr2}" type="text">
                                        나머지 주소(선택입력가능)
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">휴대전화</th>
                                    <td>
                                        <select id="mobile1" name="mobile1">
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="017">017</option>
                                            <option value="018">018</option>
                                            <option value="019">019</option>
                                        </select>
                                        -
                                        <input id="mobile2" name="mobile2" maxlength="4" value="${member.mobile2}" type="text">
                                        -
                                        <input id="mobile3" name="mobile3" maxlength="4" value="${member.mobile3}" type="text">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">이메일</th>
                                    <td>
                                        <input id="email" name="email" value="${member.email}" type="text">
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
                                <tr>
                                    <th scope="row">성별</th>
                                    <td>
                                        <input id="is_sex0" name="is_sex" value="M" type="radio" autocomplete="off">
                                        <label for="is_sex0">남자</label>
                                        <input id="is_sex1" name="is_sex" value="F" type="radio" autocomplete="off">
                                        <label for="is_sex1">여자</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">생년월일</th>
                                    <td>
                                        <input id="birth_year" name="birth_year" class="inputTypeText" maxlength="4" value="${member.birth_year}" type="text">
                                        년
                                        <input id="birth_month" name="birth_month" class="inputTypeText"  maxlength="2" value="${member.birth_month}" type="text">
                                        월
                                        <input id="birth_day" name="birth_day" class="inputTypeText"  maxlength="2" value="${member.birth_day}" type="text">
                                        일
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">환불계좌 정보</th>
                                    <td>
                                    	<dl class="typeBullet">
	                                        <dt>예금주</dt>
	                                        <dd><input id="bank_account_owner" name="bank_account_owner" fw-filter="isFill" fw-label="예금주" fw-msg="" class="inputTypeText" placeholder="" autocomplete="off" value="" type="text"></dd>
	                                        <dt>은행명</dt>
	                                        <dd><select id="refund_bank_code" name="refund_bank_code" fw-filter="isFill" fw-label="은행명" fw-msg="">
	                                            <option value="" selected="selected">- 은행선택 -</option>
	                                            <option value="bank_02">산업은행</option>
	                                            <option value="bank_03">기업은행</option>
	                                            <option value="bank_04">국민은행</option>
	                                            <option value="bank_05">하나(외환)은행</option>
	                                            <option value="bank_07">수협중앙회</option>
	                                            <option value="bank_11">농협중앙회</option>
	                                            <option value="bank_12">농협개인</option>
	                                            <option value="bank_13">농협</option>
	                                            <option value="bank_20">우리은행</option>
	                                            <option value="bank_209">유안타증권</option>
	                                            <option value="bank_218">KB증권</option>
	                                            <option value="bank_23">SC제일은행</option>
	                                            <option value="bank_230">미래에셋증권</option>
	                                            <option value="bank_238">대우증권</option>
	                                            <option value="bank_240">삼성증권</option>
	                                            <option value="bank_243">한국투자증권</option>
	                                            <option value="bank_26">신한은행</option>
	                                            <option value="bank_261">교보증권</option>
	                                            <option value="bank_262">하이투자증권</option>
	                                            <option value="bank_263">현대차증권</option>
	                                            <option value="bank_266">SK증권</option>
	                                            <option value="bank_267">대신증권</option>
	                                            <option value="bank_269">한화증권</option>
	                                            <option value="bank_270">하나대투증권</option>
	                                            <option value="bank_278">신한금융투자</option>
	                                            <option value="bank_279">동부증권</option>
	                                            <option value="bank_280">유진투자증권</option>
	                                            <option value="bank_287">메리츠증권</option>
	                                            <option value="bank_288">카카오페이증권</option>
	                                            <option value="bank_289">NH투자증권</option>
	                                            <option value="bank_291">신영증권</option>
	                                            <option value="bank_292">케이뱅크</option>
	                                            <option value="bank_293">카카오뱅크</option>
	                                            <option value="bank_294">LIG증권</option>
	                                            <option value="bank_295">OK저축은행</option>
	                                            <option value="bank_296">토스뱅크</option>
	                                            <option value="bank_297">토스증권</option>
	                                            <option value="bank_31">대구은행</option>
	                                            <option value="bank_32">부산은행</option>
	                                            <option value="bank_34">광주은행</option>
	                                            <option value="bank_35">제주은행</option>
	                                            <option value="bank_37">전북은행</option>
	                                            <option value="bank_39">경남은행</option>
	                                            <option value="bank_52">모건스탠리은행</option>
	                                            <option value="bank_53">씨티은행</option>
	                                            <option value="bank_57">유에프제이은행</option>
	                                            <option value="bank_58">미즈호코퍼레이트은행</option>
	                                            <option value="bank_59">미쓰비시도쿄은행</option>
	                                            <option value="bank_60">뱅크오브아메리카</option>
	                                            <option value="bank_71">우체국</option>
	                                            <option value="bank_76">신용보증기금</option>
	                                            <option value="bank_77">기술신용보증기금</option>
	                                            <option value="bank_81">하나은행</option>
	                                            <option value="bank_82">농협회원조합</option>
	                                            <option value="bank_83">도이치은행</option>
	                                            <option value="bank_84">상호저축은행</option>
	                                            <option value="bank_85">새마을금고</option>
	                                            <option value="bank_86">수출입은행</option>
	                                            <option value="bank_87">신용협동조합</option>
	                                            <option value="bank_89">홍콩상하이은행(HSBC)</option>
	                                            <option value="bank_90">에이비엔암로은행</option>
	                                            <option value="bank_91">산림조합</option>
	                                            <option value="bank_93">한국주택금융공사</option>
	                                            <option value="bank_94">서울보증보험</option>
	                                            <option value="bank_95">경찰청</option>
	                                            <option value="bank_99">금융결제원</option>
	                                            <option value="bank_999">기타</option>
	                                            </select>
	                                        </dd>
	                                        <dt>계좌번호</dt>
	                                        <dd><input id="bank_account_no" name="bank_account_no" fw-filter="isFill" fw-label="계좌번호" fw-msg="" class="inputTypeText" placeholder="" autocomplete="off" value="" type="text">
	                                            ('-'와 숫자만 입력해주세요.)
	                                        </dd>
	                                    </dl>
	                                </td>    
                                </tr>
                            </tbody>
                        </table>
                    </div>
	                </div>
	                <div class="base-button justify">
	                    <a href="#none" onclick="memberModifyAction()">
	                        <img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_modify_member.gif" alt="회원정보수정">
	                    </a>
	                    <a href="/">
	                        <img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_modify_cancel.gif" alt="취소">
	                    </a>
	                    <span class="gRight">
	                        <button>
	                            <img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_modify_out.gif" alt="회원탈퇴">
	                        </button>
	                    </span>
	                </div>
	            </form>
            </div>
            <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
        </div>
    </div>
</body>

<script>
function memberModifyAction() {
	
	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일
	var passwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; // 비밀번호
	
		 
	if ($("#name").val() == null || $("#name").val() == "") {
		alert("이름을 입력해주세요.");
		$("#memberName").focus();
		 
		return false;
	}
	 
	if ($("#passwd").val() == null || $("#passwd").val() == "") {
	alert("비밀번호를 입력해주세요.");
	$("#memberPw").focus();
	 
	return false;
	}
	 
	if ($("#user_passwd_confirm").val() == null || $("#user_passwd_confirm").val() == "") {
	alert("비밀번호 확인을 입력해주세요.");
	$("#user_passwd_confirm").focus();
	 
	return false;
	}
	
	if (!passwdCheck.test($("#passwd").val())) {
	    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
	    $("#passwd").focus();
	    return false;
	}
	
	if ($("#passwd").val() != $("#user_passwd_confirm").val()) {
	alert("비밀번호가 일치하지 않습니다.");
	$("#user_passwd_confirm").focus();
	 
	return false;
	}
	
	if ($("#email").val() == null || $("#email").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#memberEmail").focus();
		 
		return false;
	}
	
	if(!email_rule.test($("#email").val())){
		alert("이메일을 형식에 맞게 입력해주세요. ex) 1234@naver.com");
		$("#email").focus();
		return false;
	}
	
	if (confirm("수정하시겠습니까?")) {
	 
	$("#modify").submit();
	 
	return false;
	}
}
</script>
</html>