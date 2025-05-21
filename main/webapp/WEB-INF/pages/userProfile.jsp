<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Profile Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/userProfile.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/userProfileSidebar.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>

<body>
	<div class="container">
		<%
		request.setAttribute("activePage", "userProfile");
		%>
		<jsp:include page="nav.jsp" />
		<div><jsp:include page="userProfileSidebar.jsp" /></div>

		<main class="main-content">

			<section class="bio-section">
				<h4>Bio graph</h4>

				<form class="edit-form" method="POST"
					action="${pageContext.request.contextPath}/user-profile">
					<div class="sepe">
						<div class="bio-grid">
							<div class="form-field">
								<label>First Name:</label> <input type="text" name="firstName"
									value="${sessionScope.user.firstName}" />
							</div>
							<hr>
							<div class="form-field">
								<label>Last Name:</label> <input type="text" name="lastName"
									value="${sessionScope.user.lastName}" />
							</div>
							<hr>
							<div class="form-field">
								<label>Email:</label> <input type="text" name="email"
									value="${sessionScope.user.email}" />
							</div>
							<hr>
							<div class="form-field">
								<label>Phone:</label> <input type="text" name="phone"
									value="${sessionScope.user.phone}" />
							</div>
							<hr>
							<div class="form-field">
								<label>Address:</label> <input type="text" name="address"
									value="${sessionScope.user.address}" />
							</div>
						</div>
						<div>
							<div class="product-reviews">
								<h3>Previous Reviews</h3><hr><br>
								<div class="review">
									<p>⭐⭐⭐⭐⭐</p>
									<p>"Absolutely love this watch – the leather strap feels
										premium."</p><br>
									<p>⭐⭐⭐⭐⭐</p>
									<p>"Absolutely love this watch – the leather strap feels
										premium."</p><br>
									<p>⭐⭐⭐⭐⭐</p>
									<p>"Absolutely love this watch – the leather strap feels
										premium."</p><br>
								</div>
							</div>
							<div class = "butto">
							<button class="save-btn" type="submit">Save Changes</button>
							<button class="save-btn" type="submit">Save Changes</button>
							</div>
						</div>
					</div>
				</form>
			</section>
		</main>
	</div>

	<jsp:include page="footer.jsp" />

</body>

</html>