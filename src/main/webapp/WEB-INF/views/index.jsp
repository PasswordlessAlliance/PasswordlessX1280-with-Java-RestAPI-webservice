<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String session_id = (String) session.getAttribute("id");

if(session_id != null && !session_id.equals(""))
	response.sendRedirect("/main.do");

//----------------------- Language Selection -----------------------


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
<style>
.sample_site{ padding: 2em;  text-align: center; width: 80%;  margin: 0 0 0 0;}
</style>
</head>
<body>
<div class=" main_container">
	<div class="modal">
		<div class="sample_site" sylte="margin: -150px 0 0 0;">
			<div style="width:100%; text-align:right; margin:20px 45px;">
				<div class="select_lang">
					<select id="lang" name="lang" onchange="javascript:selLang();">
						<option value="en"<%=enLang %>>EN</option>
						<option value="ko"<%=koLang %>>KR</option>
					</select>
				</div>
			</div>
			<div style="width:100%;">
				<ul>
					<li>
						<a href="/Login/login.do" style="background-color:#ffffff;"><img src="/image/pl_logo.png">
							<strong><spring:message code="text.title.experience1" /></strong>
							<span><spring:message code="text.title.experience2" /></span>
							<em class="btn"><spring:message code="text.title.experience3" /></em>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>