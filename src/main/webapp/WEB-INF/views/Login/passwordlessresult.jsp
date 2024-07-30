<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<%
String result = request.getParameter("result");
if(result == null)	result = "";

System.out.println("passwordlessresult.do : result[" + result + "]");

if(result.equals("OK"))
	response.sendRedirect("/main.do");
else
	response.sendRedirect("/Login/login.do");
%>
