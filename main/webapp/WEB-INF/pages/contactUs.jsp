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

	<jsp:include page="nav.jsp" />
	<main class = "main">
		<h1>CONTACT US</h1>

		<section class="form-container">
			<form>
				<div class="input-row">
					<input type="email" placeholder="Email" /> <input type="tel"
						placeholder="Phone" />
				</div>
				<input type="text" placeholder="Name" />
				<textarea placeholder="Messages"></textarea>
				<button type="submit">Submit Button</button>
			</form>
		</section>

		<section class="contact-info">
			<div class="info-box colored">
				<img src="https://img.icons8.com/ios-filled/24/000000/phone.png"
					alt="Phone Icon" />
				<p>+977 9843253681</p>
			</div>
			<div class="info-box">
				<img src="https://img.icons8.com/ios-filled/24/000000/email.png"
					alt="Email Icon" />
				<p>reloj@gmail.com</p>
			</div>
			<div class="info-box">
				<img src="https://img.icons8.com/ios-filled/24/000000/marker.png"
					alt="Location Icon" />
				<p>Kathmandu, Nepal</p>
			</div>
		</section>

		<section class="map">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3531.4214946810544!2d85.3123290749504!3d27.731331376180824!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb1997b0f2dc99%3A0xa694b37a0dc3e9fa!2sKathmandu%2C%20Nepal!5e0!3m2!1sen!2snp!4v1716120000000"
				width="100%" height="300" style="border: 0; border-radius: 10px;"
				allowfullscreen="" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade"> </iframe>
		</section>
	</main>

	<jsp:include page="footer.jsp" />
</body>
</html>