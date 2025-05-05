<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.relojdepulsera.model.UserModel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Edit Profile - Reloj De Pulsera</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin-profile.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/topbar.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/sidebar.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

	<c:if test="${empty user}">
		<c:set var="user" value="${sessionScope.user}" />
	</c:if>



	<!-- Main Content -->
	<div class="main">
		<div><jsp:include page="topbar.jsp" /></div>
		<div class="topside">
			<div><jsp:include page="sidebar.jsp" /></div>



			<div class="content">
				<h2>Edit Profile</h2>
				<p class="subtitle">Account</p>

				<div class="form-container">
					<div class="profile-image-section">
						<div class="profile-img">
							<c:choose>
								<c:when test="${not empty user.imageURL}">
									<img
										src="${pageContext.request.contextPath}/resources/image/system/${user.imageURL}"
										alt="Profile Image" class="image" />
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/resources/image/system/boxes.png"
										alt="Default Avatar" />
								</c:otherwise>
							</c:choose>
						</div>
						<input type="file" id="image" name="image" style="display: none;" />
						<label for="image" class="change-btn">Change</label>
					</div>

					<form class="edit-form" method="POST" action="${pageContext.request.contextPath}/admin-profile" enctype="multipart/form-data">
						<c:if test="${not empty user}">
							<label>Username:</label>
							<input type="text" name="username" value="${user.userName}" />

							<label>Email:</label>
							<input type="text" name="email" value="${user.email}" />

							<label>Phone:</label>
							<input type="text" name="phone" value="${user.phone}" />

							<label>Address:</label>
							<input type="text" name="address" value="${user.address}" />
						</c:if>

						<button class="save-btn" type="submit">Save settings</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>