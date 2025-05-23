<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page session="true"%>
<%
String username = (String) session.getAttribute("username");
%>

<div class="navbar">
	<a href="${pageContext.request.contextPath}/">Reloj de Pulsera</a>
	<nav>
		<a href="${pageContext.request.contextPath}/explore">Explore</a> <a
			href="${pageContext.request.contextPath}/aboutUs">About</a>

		<c:choose>
			<c:when test="${empty username}">
				<a href="${pageContext.request.contextPath}/login">Login</a>
				<a href="${pageContext.request.contextPath}/register">Sign Up</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/userProfile">Profile</a>
				<a href="${pageContext.request.contextPath}/logout">Logout</a>
			</c:otherwise>
		</c:choose>

	</nav>
</div>
