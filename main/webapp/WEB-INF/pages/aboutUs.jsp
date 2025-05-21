<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>About Us</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/aboutUs.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css" />
</head>
<body>
	<jsp:include page="nav.jsp" />

	<div class="about-box">
		<div class="about-text">
			<h2>About Us</h2>
			<p>We are a team of passionate individuals dedicated to blending
				timeless style with modern craftsmanship. Our mission is to offer
				beautifully designed watches that reflect both tradition and
				innovation.</p>
		</div>
		<!-- Directly Inserting Image -->
		<div class="about-image">
			<img
				src="${pageContext.request.contextPath}/resources/image/about/head.png"
				alt="About Us Image" class = "image" />
		</div>
	</div>

	<!-- Team Members Section -->
	<div class="team-section">
		<div class="team-row">
			<div class="team-member">
				<!-- Directly Inserting Image -->
				<div class="team-image">
					<img
						src="${pageContext.request.contextPath}/resources/image/about/b.png"
						alt="Aabriti Pradhan" class = "image"/>
				</div>
				<span class="member-name">Aabriti Pradhan</span>
				<h3>CEO</h3>
				<p>Leads the company vision and oversees creative and business
					decisions.</p>
			</div>
			<div class="team-member">
				<!-- Directly Inserting Image -->
				<div class="team-image">
					<img
						src="${pageContext.request.contextPath}/resources/image/about/a.png"
						alt="Aastha Paudel" class = "image" />
				</div>
				<span class="member-name">Aastha Paudel</span>
				<h3>Founder</h3>
				<p>Drives strategic growth and manages the overall operations of
					the company.</p>
			</div>
			<div class="team-member">
				<!-- Directly Inserting Image -->
				<div class="team-image">
					<img src="${pageContext.request.contextPath}/resources/image/about/e.png" alt="Mandira Budhathoki" class = "image" />
				</div>
				<span class="member-name">Mandira Budhathoki</span>
				<h3>Director</h3>
				<p>Supervises product development and ensures quality in every
					watch.</p>
			</div>
		</div>

		<div class="team-row center">
			<div class="team-member">
				<!-- Directly Inserting Image -->
				<div class="team-image">
					<img
						src="${pageContext.request.contextPath}/resources/image/about/c.png"
						alt="Simona Thapa" class = "image" />
				</div>
				<span class="member-name">Simona Thapa</span>
				<h3>Manager</h3>
				<p>Handles team coordination and ensures smooth day-to-day
					operations.</p>
			</div>
			<div class="team-member">
				<!-- Directly Inserting Image -->
				<div class="team-image">
					<img
						src="${pageContext.request.contextPath}/resources/image/about/d.png"
						alt="Manusha Khadka" class = "image" />
				</div>
				<span class="member-name">Manusha Khadka</span>
				<h3>Marketing Head</h3>
				<p>Manages brand presence and connects customers to our unique
					style.</p>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>
