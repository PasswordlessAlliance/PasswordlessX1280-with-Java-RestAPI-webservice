<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String session_id = (String) session.getAttribute("id");

if(session_id != null && !session_id.equals(""))
	response.sendRedirect("/main.do");

// ----------------------- 다국어 선택 -----------------------

String enLang ="";
String koLang = "";

String lang = (String) request.getParameter("lang");
if(lang == null)
	lang = "";

if(lang.equals("")) {
	
	javax.servlet.http.Cookie[] cookies = request.getCookies();
	if(cookies != null)
		for(Cookie c:cookies) {
			if(c.getName().equals("lang")) {
				String value = java.net.URLDecoder.decode(c.getValue(), "UTF-8");
				if(value != null && !value.equals(""))
					lang = value;
			}
		}
}

if(lang.toLowerCase().equals("en"))
	enLang = " selected";

if(lang.toLowerCase().equals("ko"))
	koLang = " selected";

%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/Common/Include/headTop.jsp" %>
<script src="/js/passwordless.js"></script>
<script type="text/javascript">
str_login = "<spring:message code="user.login" />";									// 로그인
str_cancel = "<spring:message code="user.cancel" />";								// 취소
str_title_password = "<spring:message code="title.login.passwordless" />";			// 타이틀 - password
str_title_passwordless = "<spring:message code="title.login.password" />";			// 타이틀 - passwordless
str_passwordress_notreg = "<spring:message code="text.passwordless.notreg" />";		// Passwordless 등록이 필요합니다.
str_passwordless_regunreg = "<spring:message code="user.passwordless.regunreg" />";	// passwordless 등록/해지
str_input_id = "<spring:message code="user.input.id" />";							// ID를 입력하세요.
str_input_password = "<spring:message code="user.input.password" />";				// 비밀번호를 입력하세요.
str_passwordless_blocked = "<spring:message code="text.passwordless.blocked" />";	// Passwordless 계정이 중지되었습니다.\n계정관리자에게 문의하세요.
str_login_expired = "<spring:message code="user.input.login.expired" />";			// Passwordless 로그인 시간이 만료되었습니다.
str_login_refused = "<spring:message code="user.input.login.refused" />";			// 인증을 거부하였습니다.
str_qrreg_expired = "<spring:message code="user.input.qrreg.expired" />";			// Passwordless QR 등록시간이 만료되었습니다.
str_passwordless_unreg = "<spring:message code="text.passwordless.unreg" />";		// Passwordless 서비스 해지
str_try = "<spring:message code="user.input.try" />";								// 잠시 후 다시 시도하세요.

str_serverUrlCopy = "<spring:message code="user.passwordless.serverUrlCopy" />";	// 서버 URL이 복사되었습니다.
str_regCodeCopy = "<spring:message code="user.passwordless.regCodeCopy" />";		// 등록코드가 복사되었습니다.
</script>
</head>

<body>
<div class=" main_container">
	<div class="modal">
		<div style="width:100%; text-align:right;">
			<div class="select_lang">
				<select id="lang" name="lang" onchange="javascript:selLang();">
					<option value="en"<%=enLang %>>EN</option>
					<option value="ko"<%=koLang %>>KR</option>
				</select>
			</div>
		</div>
		<div class="login_article">
			<div class="title"><em style="width:100%; text-align:center;" id="login_title" name="login_title"></em></div>
			<div class="content">
				<div id="login_content">
					<form id="frm">
						<div class="input_group">
							<input type="text" id="id" name="id" placeholder="ID" />
						</div>
						<div class="input_group" id="pw_group">
							<input type="password" id="pw" name="pw" placeholder="PASSWORD" />
						</div>
					</form>
					<div class="input_group" id="bar_group" style="display:none;">
						<div class="timer" id="bar_content" name="bar_content" style="position: relative; background: url('/image/timerBG.png') no-repeat center right; border-radius: 8px; background-size: cover;">
							<div class="pbar" id="passwordless_bar" style="background: rgb(55 138 239 / 70%); height: 50px;width: 100%;border-radius: 8px; animation-duration: 0ms; width:0%;"></div>
							<div class="OTP_num" id="passwordless_num" name="passwordless_num" style="text-shadow:2px 2px 3px rgba(0,0,0,0.7); top: 0; position: absolute; font-size: 22px; color: #ffffff; text-align: center; height:50px; width: 100%; line-height: 50px; font-weight: 800; letter-spacing: 1px;">
								--- ---
							</div>
						</div>
					</div>
					
					<div id="passwordlessSelButton" style="height:30px;margin-top:10px;margin-bottom:10px;">
						<div style="text-align: center;">
							<span style="display:inline-block; padding: 6px 10px 16px 10px; text-align:right;">
								<label for"selLogin1" style="margin:0;padding:0;font-family: 'Noto Sans KR', sans-serif;font-weight:300;font-size:medium;">
									<input type="radio" id="selLogin1" name="selLogin" value="1" onchange="selPassword(1);" checked>
									Password
								</label>
							</span>
							<span style="display:inline-block; padding: 6px 10px 16px 10px; text-align:right;">
								<label for"selLogin2" style="margin:0;padding:0;font-family: 'Noto Sans KR', sans-serif;font-weight:300;font-size:medium;">
									<input class="radio_btn" type="radio" id="selLogin2" name="selLogin" value="2" onchange="selPassword(2);">
									Passwordless
								</label>
							</span>
							<span style="display:inline-block; padding: 6px 10px 16px 10px; text-align:right;">
								<a href="javascript:show_help();" class="cbtn_ball"><img src="/image/help_bubble.png" style="width:16px; height:16px; border:0;"></a>
							</span>
						</div>
					</div>
					
					<div class="pwless_info">
						<a href="javascript:hide_help();" class="cbtn_ball"><img src="/image/ic_fiicls.png" height="20" alt=""></a>
						<p>
							<spring:message code="text.passwordless.help1" /><!-- Passwordless 서비스는 보안성과 편리성을 갖춘 무료 인증 서비스입니다. -->
							<br><br>
							<spring:message code="text.passwordless.help2" /><!-- Passwordless 서비스를 이용하기 위해서는 스마트폰에 Passwordless X1280앱을 설치 한 후 QR코드를 스캔하여 이용할 수 있습니다. -->
							<br>
							<br>
							<p style="width:100%;text-align:center;font-size:140%;font-weight:800;">
								<font color="#5555FF">Passwordless X1280 Mobile App</font>
								<br>
								<br>
								<a href="https://apps.apple.com/us/app/autootp/id1290713471" target="_new_app_popup"><img src="/image/app_apple_icon.png" style="width:45%;"></a>
								&nbsp;
								<a href="https://play.google.com/store/apps/details?id=com.estorm.autopassword" target="_new_app_popup"><img src="/image/app_google_icon.png" style="width:45%;"></a>
								<br>
								<img src="/image/app_apple_qr.png" style="width:45%;">
								&nbsp;
								<img src="/image/app_google_qr.png" style="width:45%;">
							</p>
							<br>
							<spring:message code="text.passwordless.help3" /><!-- 제공되는 Passwordless 서비스는 UN산하 국제기술표준기구인 ITU-T가 X.1280으로 권고하는  표준 기술로 본 온라인 서비스가 사용자에게 무료로 제공 중에 있습니다. -->
							<br>
							<br>
							<spring:message code="text.passwordless.help4" /><!-- Passwordless를 통해 안전하고 편리한 나만의 온라인 서비스를 만들어 보세요! -->
						</p>
					</div>
					
					<div id="passwordlessNotice" style="display:none;">
						<div style="text-align: center;line-height:24px;">
							<spring:message code="text.passwrodless.verify" /><!-- Passwordless 서비스를 등록/해지 하려면<br>사용자 인증이 필요합니다. -->
						</div>
					</div>
					
					<div class="btn_zone">
						<a href="javascript:login();" class="btn active_btn" id="btn_login"><spring:message code="user.login" /></a><!-- 로그인 -->
					</div>
					<div class="btn_zone" id="login_mobile_check" name="login_mobile_check" style="display:none;">
						<a href="javascript:mobileCheck();" class="btn active_btn"><spring:message code="user.input.afterconfirm" /></a><!-- 모바일 인증 후 확인 --><!-- Websocket 접속 오류 시 수동으로 확인 -->
					</div>
					
					<div class="menbership" id="login_bottom1" name="login_bottom" style="text-align:center;">
						<a href="./join.do"><spring:message code="user.join" /></a><!-- 회원가입 -->
						<a href="./changepw.do"><spring:message code="user.password.find" /></a><!-- 비밀번호찾기 -->
					</div>
					<div class="menbership" id="login_bottom2" name="login_bottom" style="text-align:center;">
						<a href="./join.do"><spring:message code="user.join" /></a><!-- 회원가입 -->
						<a href="javascript:moveManagePasswordless();"><font style="font-weight:800;"><spring:message code="user.passwordless.regunreg" /></font></a><!-- Passwordless 등록/해지 -->
					</div>
					<div class="menbership" id="manage_bottom" name="manage_bottom" style="display:none;text-align:center;">
						<a href="./changepw.do"><spring:message code="user.password.find" /></a><!-- 비밀번호찾기 -->
						<a href="javascript:cancelManage();"><font style="font-weight:800;"><spring:message code="user.login" /></font></a><!-- 로그인 -->
					</div>
				</div>
				
				<div id="passwordless_reg_content" style="display:none;">
					<div style="text-align:center;">
						<span style="width:100%; text-align:center; font-weight:500; font-size:24px;">
							<br>
							<spring:message code="text.passwordless.reg1" /><!-- Passwordless 서비스 등록 -->
						</span>
						<br>
						<img id="qr" name="qr" src="" width="300px" height="300px" style="display:inline-block;margin-top:10px;">
						<p style="width:100%; padding:0% 0%; font-weight:500; font-size:16px; line-height:24px;">
							<spring:message code="text.passwordless.reg2" /><!-- 스마트폰에 Passwodless X1280앱을<br>설치한 후 QR코드를 스캔하세요. -->
						</p>
						<br>
						<span style="display:inline-block; width:100%; font-size:18px; padding:10px; margin-bottom:20px;">
							<div style="gap: 10px;display: flex; justify-content: center; margin:8px 0; font-size:13px;">
								<div style="width:88%; text-align:left;">
									<span style="width:30%;">[ <spring:message code="user.passwordless.serverUrl" /> ]</span>
									<span id="server_url" name="server_url" style="font-weight:800;"></span></div>
								<div style="width:10%;"><img src="/image/ic-copy.png" onclick="javascripit:copyTxt1();"></div>
							</div>
							<div style="gap: 10px;display: flex; justify-content: center; margin:8px 0; font-size:13px;">
								<div style="width:88%; text-align:left;">
									<span style="width:30%;">[ <spring:message code="user.passwordless.regCode" /> ]</span>
									<span id="register_key" name="register_key" style="font-weight:800;"></span></div>
								<div style="width:10%;"><img src="/image/ic-copy.png" onclick="javascripit:copyTxt2();"></div>
							</div>
							<br>
							<b><span id="rest_time" style="font-size:24px;text-shadow:1px 1px 2px rgba(0,0,0,0.9);color:#afafaf;"></span></b>
						</span>
					</div>
					<div class="btn_zone">
						<a href="javascript:cancelManage();" class="btn active_btn" id="btn_login"><spring:message code="user.cancel" /></a><!-- 취소 -->
					</div>
					<div class="btn_zone" id="reg_mobile_check" name="reg_mobile_check" style="display:none;">
						<a href="javascript:mobileCheck();" class="btn active_btn"><spring:message code="user.input.afterconfirm" /></a><!-- 모바일 인증 후 확인 --><!-- Websocket 접속 오류 시 수동으로 확인 -->
					</div>
				</div>
				<input type="hidden" id="passwordlessToken" name="passwordlessToken" value="">
				<div id="passwordless_unreg_content" style="display:none;width:100%; text-align:center; font-weight:500; font-size:24px; line-height:35px;">
					<spring:message code="text.passwordless.unreg1" /><!-- Passwordless 서비스 해지 -->
					<br>
					<br>
					<div class="passwordless_unregist">
						<div style="padding: 0px;">
							<button type="button" id="btn_unregist" name="btn_unregist" style="height:120px; border-radius:4px; color:#FFFFFF; background:#3C9BEE; border-color:#3090E0; padding: 4px 20px; font-size: 20px; line-height:40px;">
								<spring:message code="text.passwordless.unreg2" /><!-- Passwordless 서비스<br>해지하기 -->
							</button>
						</div>
						<div>
							&nbsp;
							<br>
							<p style="width:100%; padding:0% 0%; font-weight:500; font-size:16px; line-height:24px;">
								<spring:message code="text.passwordless.unreg3" /><!-- Passwodless서비스를 해지하면<br>사용자 패스워드로 로그인해야 합니다. -->
							</p>
						</div>
						<br>
						<div class="btn_zone">
							<a href="javascript:cancelManage();" class="btn active_btn" id="btn_login"><spring:message code="user.cancel" /></a><!-- 취소 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>
var input = document.getElementById("id");
input.addEventListener("keyup", function (event) {
	if (event.keyCode === 13) {
		event.preventDefault();
		login();
	}
});

var input = document.getElementById("pw");
input.addEventListener("keyup", function (event) {
	if (event.keyCode === 13) {
		event.preventDefault();
		login();
	}
});

$("#btn_unregist").on("click", function(){
	if(confirm("<spring:message code="user.input.passwordless.unreg" />")) {	// Passwordless 서비스를 해지하시겠습니까?
		unregPasswordless();
	}
})

</script>
</html>
