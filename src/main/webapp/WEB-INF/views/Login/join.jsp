<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

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
</head>

<body>
<div class=" main_container">
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
				<div class="title"><em style="width:100%; text-align:center;"><spring:message code="user.join" /></em></div><!-- Create Account -->
				<div class="content">
					<div>
						<form>
							<div class="input_group">
								<input type="text" id="id" placeholder="ID" />
							</div>
							<div class="input_group">
								<input type="password" id="pw" placeholder="PASSWORD" />
							</div>
							<div class="input_group">
								<input type="password" id="pw_re" placeholder="Confirmation PASSWORD" />
							</div>
							<div class="input_group">
								<input type="text" id="email" placeholder="Email" />
							</div>
						</form>
					</div>
					<div class="btn_zone">
						<a href="javascript:join();" class="btn active_btn"><spring:message code="user.join" /></a><!-- Create Account -->
						&nbsp;
						<a href="/Login/login.do" class="btn active_btn"><spring:message code="user.cancel" /></a><!-- Cancel -->
					</div>           
				</div>
			</div>
		</div>
		<div class="modal_bg"></div>
	</div>
</div>
</body>

<script>
$(document).ready(function() {
	$("#id").focus();
})

function trim(stringToTrim) {
    return stringToTrim.replace(/^\s+|\s+$/g,"");
}

function join() {
	id = $("#id").val();
	pw = $("#pw").val();
	pw_re = $("#pw_re").val();
	email = $("#email").val();
	
	id = trim(id);
	pw = trim(pw);
	pw_re = trim(pw_re);
	email = trim(email);

	$("#id").val(id);
	$("#pw").val(pw);
	$("#pw_re").val(pw_re);
	$("#email").val(email);

	if(id == "") {
		alert("<spring:message code="user.input.id" />");	// Please enter your ID.
		$("#id").focus();
		return false;
	}

	if(pw == "") {
		alert("<spring:message code="user.input.password" />");	// Please enter a password.
		$("#pw").focus();
		return false;
	}

	if(pw_re == "") {
		alert("<spring:message code="user.input.passwordre" />");	// Please enter confirmation password.
		$("#pw_re").focus();
		return false;
	}
	
	if(pw != pw_re) {
		alert("<spring:message code="user.input.password.notmatch" />");	// Passwords do not match.
		$("#pw_re").val("");
		$("#pw_re").focus();
		return false;
	}

	if(email == "") {
		alert("<spring:message code="user.input.email" />");	// Please enter your email.
		$("#email").focus();
		return false;
	}
	
	$.ajax({
        url : "/api/Login/join",
        type : "post",
        data : {
        	"id" : id,
            "pw" : pw,
            "email" : email
        },
        success : function(res) {
        	if(res.result == "OK") {
        		alert("Sign up is complete.");
            	location.href = "/Login/login.do";
        	}
            else {
            	alert(res.result);
            }
        },
        error : function(res) {
            alert(res.msg);
        },
        complete : function() {
        }
    });
}
</script>

</html>
