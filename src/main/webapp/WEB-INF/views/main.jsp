<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String session_id = (String) session.getAttribute("id");

if(session_id == null || session_id.equals(""))
	response.sendRedirect("/Login/login.do");

// ----------------------- Language Selection -----------------------

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
.sample_site li p{width: 500px; text-decoration: none; color: #333333; padding: 30px 30px 30px; border: 1px solid #e1e1e1; box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.15); border-radius: 10px; }
.sample_site li a{width: 500px; text-decoration: none; color: #333333; padding: 0px 0px 0px; border: 1px solid #e1e1e1; box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.15); border-radius: 10px; }
.sample_site li .btn{line-height: 20px; font-size: 17px; padding: 17px 40px; font-weight: 500; display: inline-block; margin: 0 auto; background: #4ea1ff; margin: 15px 0 0 0; border-radius: 8px; color: #ffffff;}
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
						<p style="background-color:#ffffff;">
							<strong><spring:message code="text.title.experience1" /></strong>
							<span><spring:message code="text.title.experience2" /></span>
							<a href="javascript:logout();"><em class="btn" id="btn_logout"><spring:message code="user.logout" /></em></a>
							&nbsp;
							<a href="javascript:withdraw();"><em class="btn" id="btn_delete"><spring:message code="user.withdraw" /></em></a>
						</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>

<script>
$("#btn_logout").click(function(e){
	console.log("Logout");
});

function logout() {
	$.ajax({
        url : "/api/Login/logout",
        type : "post",
        success : function(res) {
            location.href = "/";
        },
        error : function(res) {
            alert(res.msg);
        },
        complete : function() {
        }
    });
}

function withdraw() {
	if(confirm("<spring:message code="user.deleteall" />\n<spring:message code="user.withdrawal" />")) {
		$.ajax({
	        url : "/api/Login/withdraw",
	        type : "post",
	        success : function(res) {
	        	if(res.result == "OK")
	        		alert("Membership withdrawal has been completed.");
	        	
	            location.href = "/";
	        },
	        error : function(res) {
	            alert(res.msg);
	        },
	        complete : function() {
	        }
	    });
	}
}
</script>
</html>