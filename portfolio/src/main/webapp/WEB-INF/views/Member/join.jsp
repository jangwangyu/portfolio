<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <link href="join.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="wrap">
    
        <jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
        
        <hr class="layout">
        <div id="container">
            <div class="titleArea">
                <h2>회원 가입</h2>
            </div>
            <div class="member member-join">
                <!--
                    returnUrl = join_result.html
                    checkIdUrl = check_id.html
                    personalName = 이름
                    companyName = 회사명
                    companySsn = 회사번호
                -->
                <div class="base-table typeWrite">
                    <table border="1" summary>
                        <caption>회원가입</caption>
                        <colgroup>
                            <col style="width:150px">
                            <col style="width:auto">
                        </colgroup>
                        <tbody>
                            <tr class>
                                <th scope="row">
                                    회원구분
                                </th>
                                <td>
                                    <input id="member_type0" name="member_type" aria-label="회원구분" value="회원구분" type="radio" checked="checked" autocomplete="off">
                                    <label for="member_type0">개인회원</label>
                                    <input id="member_type1" name="member_type" aria-label="회원구분" type="radio">
                                    <label for="member_type1">사업자회원</label>
                                    <input id="member_type2" name="member_type" aria-label="회원구분" type="radio">
                                    <label for="member_type2">외국인회원(foreigner)</label>
                                </td>
                            </tr>
                        </tbody>
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
                                    <input id="member_id" name="member_id" label="아이디" fw-filter="isFill&isFill&isMin[4]&isMax[16]&isIdentity"  placeholder value type="text">
                                    <span id="idMsg" class="error">아이디를 입력해주세요.</span>
                                    (영소문자/숫자, 4~16자)
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">비밀번호</th>
                                <td>
                                    <input id="passwd" name="passwd" label="비밀번호" autocomplete="off" maxlength="16" 0="disabled" value type="password">
                                    (영문 대소문자/숫자 4자~16자)
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
            <div class="join-button">
                <a href="#none" onclick="memberJoinAction()">
                    <img src="join.png" alt="회원가입">
                </a>
            </div>
            
            <jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
            
        </div>
    </div>
</body>
</html>