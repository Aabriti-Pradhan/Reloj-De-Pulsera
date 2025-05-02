<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Contact Page</title>
<link rel="stylesheet" href="styles.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/contactUs.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css" />
</head>
<body>
	<header>
		<jsp:include page="nav.jsp" />

	</header>
	<section class="contact-section">
		<div class="contact">
			<div class="contact-header-container">
				<h2>Contact Information</h2>
				<div class="header-image">
					<img
						src="${pageContext.request.contextPath}/resources/image/system/icon.png"
						alt="Contact Image">
				</div>
			</div>
			<div class="contact-icons">
				<div>
					<i class="fas fa-phone"></i>
					<p>(123) 456-7890</p>
				</div>
				<div>
					<i class="fas fa-envelope"></i>
					<p>support@example.com</p>
				</div>
				<div>
					<i class="fas fa-map-marker-alt"></i>
					<p>Visit Us</p>
				</div>
			</div>
		</div>
		<div class="form-location-wrapper">
			<div class="contact-form">
				<h3>Get in Touch</h3>
				<input type="email" placeholder="Email"><input type="text"
					placeholder="Full Name">
				<textarea placeholder="Your Message"></textarea>
				<button type="submit">Submit</button>
			</div>
			<div class="location-map">
				<h4>Office Location</h4>
				<img
					src="${pageContext.request.contextPath}/resources/image/system/map.png"
					alt="Map">
				<p>Located centrally and easily accessible via all major
					transport routes.</p>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>