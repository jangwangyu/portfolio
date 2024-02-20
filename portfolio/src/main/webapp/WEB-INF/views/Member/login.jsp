<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css" />
    
  </head>
  <style>
    * {
  margin: 0;
  padding: 0;
}

ul {
  list-style-type: none;
}

a {
  text-decoration: none;
  color: black;
}
body {
  background-color: #f1f1f1;
}

#wrap {
  width: 500px;
  min-width: 400px;
  height: 1120px;
  margin: 0 auto;
  background-color: #ffffff;
}

#login_area {
  width: 330px;
  height: 1000px;
  background-color: #ffffff;
  margin: 0 auto;

  position: relative;
}

#login_header {
  width: 100%;
  height: 20px;

  padding: 76px 0 60px;
  text-align: center;
}

#login_box {
  width: 100%;
  margin: 0 auto;
}

#login_box .input {
  width: 100%;
  height: 50px;
  padding: 15px 10px 14px;
  box-sizing: border-box;
  border: 1px solid #cccccc;
  margin-bottom: 10px;
}
.checkbox {
  display: inline-block;
  font-size: 14px;
  color: #aaa;
}
.submit {
  display: block;
  margin: 10px 0 20px;
}

.submit > input {
  width: 100%;
  height: 60px;
  color: #ffffff;
  background: #000000;
  text-align: center;
  border: none;
  display: block;
  font-size: 18px;
  font-weight: bold;
}

#login_box > #sub_menu {
  margin: 36px 0;
  display: block;
  height: 22px;
}

#sub_menu > li {
  float: left;
  margin-left: 20px;
}

#sub_menu > li:first-child {
  margin-left: 10px;
}

#sub_menu > li::after {
  content: "";
  display: inline-block;
  width: 1px;
  height: 14px;
  background-color: #aaa;
  margin-left: 20px;
  position: relative;
  top: 2px;
}

#sub_menu > li:nth-child(3)::after {
  display: none;
}

#sub_menu > li > a {
  color: #aaa;
  font-size: 14px;
}

#social {
  width: auto;
  margin: 30px 0 35px;
}

#kakao {
  width: 100%;
  height: 42px;
  background-color: #fee500;
  border: 1px #fee500 solid;
  border-radius: 6px;
  text-align: center;
  padding-top: 9px;
  box-sizing: border-box;
  position: relative;
}

#naver {
  width: 100%;
  height: 42px;
  background-color: #ffffff;
  border: 1px solid #bfbfbf;
  border-radius: 6px;
  margin-top: 10px;
  text-align: center;
  padding-top: 9px;
  box-sizing: border-box;
  position: relative;
}
#social > a {
  display: block;
}
#social > a > span {
  font-size: 15px;
  font-weight: bold;
  position: relative;
  top: -13px;
}

#social > #kakao > span::before {
  content: "";
  width: 30px;
  height: 30px;
  display: inline-block;
  background-size: 60px 30px;
  position: relative;
  top: 10px;
}

#social > #naver > span::before {
  content: "";
  width: 30px;
  height: 30px;
  display: inline-block;
  background-size: 60px 30px;
  background-position: -30px 0;
  position: relative;
  top: 12px;
}

#footer > #footer_menu {
  margin: 36px 0;
  display: block;
  height: 22px;
}

#footer_menu > li {
  float: left;
  margin-left: 15px;
}

#footer_menu > li::after {
  content: "";
  display: inline-block;
  width: 1px;
  height: 14px;
  background-color: #aaa;
  margin-left: 20px;
  position: relative;
  top: 2px;
}

#footer_menu > li:nth-child(3)::after {
  display: none;
}

#footer_menu > li > a {
  color: #aaa;
  font-size: 14px;
}
  </style>
  <body>
    <div id="wrap">
      <div id="login_area">
        <div id="login_header">
          <a href="Home.html">포트폴리오</a>    
        </div>
        <div id="login_box">
          <form>
            <input class="input" type="text" placeholder="아이디를 입력해 주세요"/>
            <br/>
            <input class="input" type="password" placeholder="비밀번호를 입력해 주세요" />
            <br/>
            <span class="submit"><input type="submit" value="로그인"/></span>
            <label class="checkbox">
                <input type="checkbox" name="autologin" id="autologin"/> 자동 로그인
            </label>
          </form>
          <ul id="sub_menu">
            <li><a href="join.html">회원 가입</a></li>
            <li><a href="#">아이디 찾기</a></li>
            <li><a href="#">비밀번호 찾기</a></li>
          </ul>
        </div>
        <div id="social">
          <a id="kakao" href="#">
            <span>카카오 로그인</span>
          </a>
          <a id="naver" href="#">
            <span>네이버 로그인</span>
          </a>
        </div>
          <footer id="footer">
            <ul id="footer_menu">
              <li><a href="#">이용약관</a></li>
              <li>
                <a href="#"><b>개인정보처리방침</b></a>
              </li>
              <li><a href="#">고객센터</a></li>
            </ul>
          </footer>
      </div>
    </div>
  </body>
</html>