<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String errorMessage = (String) request.getAttribute("error");
String successMessage = (String) request.getAttribute("success");
String passwordMessage = (String) request.getAttribute("pass-error");

if (errorMessage != null && !errorMessage.isEmpty()) {
%>
<p class="error-message"><%=errorMessage%></p>
<%
}
if (successMessage != null && !successMessage.isEmpty()) {
%>
<p class="success-message"><%=successMessage%></p>
<%
}
if (passwordMessage != null && !passwordMessage.isEmpty()) {
%>
<p class="password-message"><%=passwordMessage%></p>
<%
}
%>