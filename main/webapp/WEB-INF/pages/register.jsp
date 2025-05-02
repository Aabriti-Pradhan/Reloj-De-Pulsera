<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.relojdepulsera.model.UserModel" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Register - Reloj de Pulsera</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/register.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/message.css" />
</head>
<body>

	<jsp:include page="nav.jsp" />

	<div class="register-container">
		<div class="register-box">
			<div class="avatar">&#128100;</div>

			<form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
				<div class="form-row">
					<div class="input-group">
						<input type="text" placeholder="First Name" name="firstname" /> 
						<span class="icon">&#9998;</span>
					</div>
					<div class="input-group">
						<input type="password" placeholder="Password" name="password"/>
						<span class="icon">&#128274;</span>
					</div>
				</div>

				<div class="form-row">
					<div class="input-group">
						<input type="text" placeholder="Last Name" name="lastname"/>
						<span class="icon">&#9998;</span>
					</div>
					<div class="input-group">
						<input type="password" placeholder="Retype Password" name="retype"/>
						<span class="icon">&#128274;</span>
					</div>
				</div>

				<div class="form-row">
					<div class="input-group">
						<input type="text" placeholder="Username" name="username"/>
						<span class="icon">&#128100;</span>
					</div>
					<div class="input-group">
						<input type="email" placeholder="Email" name="email"/>
						<span class="icon">&#9993;</span>
					</div>
				</div>

				<div class="form-row">

					<div class="input-group">
						<input type="tel" placeholder="Phone Number" name="phone" />
						<span class="icon">&#128222;</span>
					</div>
					<div class="input-group">
						<select name="role">
							<option value="" disabled selected>Select Role</option>
							<%
							List<UserModel> roles = (List<UserModel>) request.getAttribute("roles");
							if (roles != null) {
								for (UserModel user : roles) {
							%>
							<option value="<%=user.getrole()%>"><%=user.getrole()%></option>
							<%
							}
							}
							%>
						</select> 
						<span class="icon">&#128101;</span>
					</div>
				</div>
				
				<div class="form-row">

					<div class="input-group">
						<input type="text" placeholder="Address" name="address" />
						<span class="icon">&#128222;</span>
					</div>
					<div class="input-group">
						<input type="file" id="image" name="image">
						<span class="icon">&#128101;</span>
					</div>
				</div>

				<button type="submit" class="register-btn">Register</button>
			</form>
		</div>
	</div>

	<div class="message-box">
		<jsp:include page="messages.jsp" />
	</div>
</body>
</html>
