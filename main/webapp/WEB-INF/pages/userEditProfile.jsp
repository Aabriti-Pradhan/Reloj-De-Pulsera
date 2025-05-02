<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Profile Form</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/userEditProfile.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/userProfileSidebar.css" />
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css" />
</head>

<body>

	<div class="container">
		<%
		request.setAttribute("activePage", "editProfile");
		%>
		<div><jsp:include page="userProfileSidebar.jsp" /></div>

		<main class="content">

			<div class="banner"></div>

			<!-- Profile Section -->
			<div class="profile-section">
				<div class="profile-pic-wrapper">
					<img src="${pageContext.request.contextPath}/resources/image/system/obama.png" class="profile-pic"
						alt="Profile" /> 
				</div>
				<button class="upload-btn">Upload New</button>
				<button class="avatar-btn">Create Avatar</button>
			</div>

			<!-- Form Section -->
			<form class="form-section">

				<!-- Row 1: Names + Gender -->
				<div class="form-row row-inline">
					<div class="form-half-inline">
						<div class="input-group-inline">
							<label>First Name</label> <input type="text"
								placeholder="Enter first name">
						</div>
						<div class="input-group-inline">
							<label>Last Name</label> <input type="text"
								placeholder="Enter last name">
						</div>
					</div>

					<div class="divider"></div>

					<div class="form-half-inline gender-group">
						<div class="input-group-inline same-height">
							<label>Gender</label>
							<div class="gender-options">
								<label class="radio-input"> <input type="radio"
									name="gender" /> Male
								</label> <label class="radio-input"> <input type="radio"
									name="gender" /> Female
								</label>
							</div>
						</div>
					</div>
				</div>

				<!-- Row 2: Email + Mobile | Purchase + Address -->
				<div class="form-row row-inline">
					<div class="form-half-inline">
						<div class="input-group-inline">
							<label>Email</label> <input type="email"
								placeholder="Enter email">
						</div>
						<div class="input-group-inline">
							<label>Mobile Number</label> <input type="text"
								placeholder="Enter mobile number">
						</div>
					</div>

					<div class="divider"></div>

					<div class="form-half-inline">
						<div class="input-group-inline">
							<label>Purchase History</label> <input type="text"
								placeholder="Purchase history">
						</div>
						<div class="input-group-inline">
							<label>Residential Address</label> <input type="text"
								placeholder="Residential address">
						</div>
					</div>
				</div>

				<!-- Tax Row -->
				<div class="tax-row">
					<label class="centered-label">Tax Identification Number</label> <input
						type="text" placeholder="Enter Tax ID">
				</div>

				<!-- Save Button -->
				<div class="save-row">
					<button type="submit" class="save-btn">Save Changes</button>
				</div>

			</form>

		</main>
	</div>
	<jsp:include page="footer.jsp" />

</body>

</html>