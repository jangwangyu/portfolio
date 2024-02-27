<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/css/join.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<style>
.button {
    display: inline-block;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    background-color: #007BFF;
    color: white;
    border-radius: 5px;
    border: none;
    cursor: pointer;
}

.button:hover {
    background-color: #0056b3;
}
</style>
<body>
    <div id="wrap">
    
        <jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
        
        <hr class="layout">
        <div id="container">
            <div class="titleArea">
                <h2>회원 가입</h2>
            </div>
            <div class="member member-join">
            <form id="join" action="/Member/register" method="POST">
                <div class="base-table typeWrite">
                    <table border="1" summary>
                        <caption>회원가입</caption>
                     </table>
                </div>
                <h3 class=" ">기본정보</h3>
                <p class="required">필수입력사항</p>
                <div class="base-table typeWrite">
	                    <table border="1" summary>
	                        <caption>회원기본정보</caption>
	                        <colgroup>
	                            <col style="width:150px">
	                            <col style="width:auto">                        
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <th scope="row">아이디</th>
	                                <td>
	                                    <input id="member_id" name="member_id" label="아이디" fw-filter="isFill&isFill&isMin[4]&isMax[16]&isIdentity" type="text">
									    <!-- <a href="#" class="button" onclick="duplicate(); return false;">중복체크</a> -->
									    <label id="label1"></label>
									    <span id="idMsg" class="error">아이디를 입력해주세요.</span>
									    (영소문자/숫자, 4~16자)
	                                </td>
	                            </tr>
	                            <tr>
	                                <th scope="row">비밀번호</th>
	                                <td>
	                                    <input id="passwd" name="passwd" label="비밀번호" autocomplete="off" maxlength="16" type="password">
	                                    (영문 대소문자/특수문자 숫자 조합 8자~25자)
	                                </td>
	                            </tr>
	                            <tr>
	                                <th scope="row">비밀번호 확인</th>
	                                <td>
	                                    <input id="user_passwd_confirm" name="user_passwd_confirm" fw-filter="isFill&isMatch[passwd]" label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" 0="disabled" value type="password">
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
	                                    <a href="#" onclick="execPostCode();" id="postBtn"><img src="" alt="우편번호"></a>
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
	                                    <select id="mobile1" name="mobile1" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg>
	                                        <option value="010" selected>010</option>
	                                        <option value="011">011</option>
	                                        <option value="016">016</option>
	                                        <option value="017">017</option>
	                                        <option value="018">018</option>
	                                        <option value="019">019</option>
	                                    </select>
	                                    -
	                                    <input id="mobile2" name="mobile2" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg placeholder value type="text">
	                                    -
	                                    <input id="mobile3" name="mobile3" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg placeholder value type="text">
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
           		</form>
            </div>
            <div class="join-button">
                <a href="#none" onclick="memberJoinAction()">
                    <img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_member_join1.gif" alt="회원가입">
                </a>
            </div>
            
            <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
            
        </div>
    </div>
</body>
<script>
/* $(document).ready(function(){
	

});
function duplicate(){
	var member_id = $("#member_id").val();

	var submitObj = new Object();
	submitObj.member_id = member_id;
	
	$.ajax({
		url : "/Member/idCnt",
		type : "POST",
		contentType : "application/json; charset-utf-8",
		data : JSON.stringify(submitObj),
		dataType : "json"
		}).done(function(resMap) {
		if (resMap.res == "ok") {
		if (resMap.idCnt == 0) {
		alert("사용할 수 있는 아이디입니다.");
		$("#member_id_yn").val("Y");
		} else {
		alert("중복된 아이디 입니다.");
		$("#member_id_yn").val("N");
		}
		}
		
		}).fail(function(e) {
		alert("등록 시도에 실패하였습니다." + e);
		}).always(function() {
		pass = false;
		});
		
	} */
    $(document).ready(function() {
    	//ID 중복 확인
    	//id를 입력할 수 있는 input text 영역을 벗어나면 동작한다.
    	$("#member_id").on("focusout", function() {
    		
    		var id = $("#member_id").val();
    		
    		if(id == '' || id.length == 0) {
    			$("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
    			return false;
    		}
    		
        	//Ajax로 전송
        	$.ajax({
        		url : '/Member/ConfirmId',
        		data : {
        			id : id
        		},
        		type : 'POST',
        		dataType : 'json',
        		success : function(result) {
        			if (result == true) {
        				$("#label1").css("color", "black").text("사용 가능한 ID 입니다.");
        			} else{
        				$("#label1").css("color", "red").text("사용 불가능한 ID 입니다.");
        				$("#member_id").val('');
        			}
        		}
        	}); //End Ajax
    	});
    })
function memberJoinAction() {
	
	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일
	var passwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; // 비밀번호
	var regId = /^[a-zA-Z0-9]{4,12}$/; // 아이디
	
	
	 
	if ($("#member_id").val() == null || $("#member_id").val() == "") {
	alert("아이디를 입력해주세요.");
	$("#memberId").focus();
	 
	return false;
	}
	
	else if(!regId.test($("#member_id").val())){
        alert("아이디는 4~12자 영문 대소문자, 숫자만 입력하세요.")
        uid.focus();
        return false;
    }
		 
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
	    $("passwd").focus();
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
	
	if (confirm("회원가입하시겠습니까?")) {
	 
	$("#join").submit();
	 
	return false;
	}
}
	
	function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               
               
               $("#postcode1").val(data.zonecode);
               $("#addr1").val(fullRoadAddr);
               
               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
           }
        }).open();
    }
</script>
</html>