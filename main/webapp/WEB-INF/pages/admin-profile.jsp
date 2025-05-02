<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<div class="profile-img">👤</div>
						<button class="change-btn">Change</button>
					</div>

					<form class="edit-form">
						<label>First Name</label> <input type="text"
							placeholder="Enter first name" /> <label>Last Name</label> <input
							type="text" placeholder="Enter last name" /> <label>Email</label>
						<input type="email" placeholder="Enter email" /> <label>Address</label>
						<input type="text" placeholder="Enter address" /> <label>Phone</label>
						<input type="text" placeholder="Enter phone number" />

						<button class="save-btn" type="submit">Save settings</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>