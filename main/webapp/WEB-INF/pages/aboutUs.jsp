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
	<header>
		<jsp:include page="nav.jsp" />
	</header>
	<div class="header">
			<h1>Reloj De Pulsera</h1>
			<p>Where Time Meets Style – Crafted Elegance for Every Wrist</p>
		</div>

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
				src="${pageContext.request.contextPath}/resources/image/system/mandy.jpg"
				alt="About Us Image" width="400" height="280" />
		</div>
	</div>

	<!-- Team Members Section -->
	<div class="team-section">
		<div class="team-row">
			<div class="team-member">
				<!-- Directly Inserting Image -->
				<div class="team-image">
					<img
						src="${pageContext.request.contextPath}/resources/image/system/mandy.jpg"
						alt="Aabriti Pradhan" width="250" height="200" />
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
						src="${pageContext.request.contextPath}/resources/image/system/mandy.jpg"
						alt="Aastha Paudel" width="250" height="200" />
				</div>
				<span class="member-name">Aastha Paudel</span>
				<h3>Founder</h3>
				<p>Drives strategic growth and manages the overall operations of
					the company.</p>
			</div>
			<div class="team-member">
				<!-- Directly Inserting Image -->
				<div class="team-image">
					<img src="team-member-3.png" alt="Mandira Budhathoki" width="250"
						height="200" />
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
						src="${pageContext.request.contextPath}/resources/image/system/mandy.jpg"
						alt="Simona Thapa" width="250" height="200" />
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
						src="${pageContext.request.contextPath}/resources/image/system/mandy.jpg"
						alt="Manusha Khadka" width="250" height="200" />
				</div>
				<span class="member-name">Manusha Khadka</span>
				<h3>Marketing Head</h3>
				<p>Manages brand presence and connects customers to our unique
					style.</p>
			</div>
		</div>
	</div>

	<%--  <main class="team-section">
		<div class="team-member">
			<img src="${pageContext.request.contextPath}/resources/image/system/aabriti.jpg">
			<div class="info">
				<h3>Aabriti Pradhan</h3>
				<p>Skilled in React, HTML, CSS, and TypeScript, Aabriti brings
					designs to life with attention to detail and performance
					optimization. Recent projects include interactive dashboards,
					e-commerce UIs, and component libraries built for scalability and
					reuse..</p>
			</div>
		</div>

		<div class="team-member reverse">
			<div class="info">
				<h3>Aastha Paudel</h3>
				<p>UX/UI specialist who brings ideas to life with vibrant
					visuals and great user flows.</p>
			</div>
			<img src="${pageContext.request.contextPath}/resources/image/system/aastha.jpg">
		</div>

		<div class="team-member">
			<img src="${pageContext.request.contextPath}/resources/image/system/mandy.jpg">
			<div class="info">
				<h3>Mandira Budhathoki</h3>
				<p>Backend expert who loves clean APIs and solid architecture.</p>
			</div>
		</div>

		<div class="team-member reverse">
			<div class="info">
				<h3>Simona Thapa</h3>
				<p>Full stack engineer who enjoys building robust systems and
					intuitive designs.</p>
			</div>
			<img src="${pageContext.request.contextPath}/resources/image/system/simona.jpg">
		</div>

		<div class="team-member">
			<img src="${pageContext.request.contextPath}/resources/image/system/manusha.jpg">
			<div class="info">
				<h3>Manusa Khadka</h3>
				<p>QA specialist dedicated to delivering bug-free, high-quality
					user experiences.</p>
			</div>
		</div>
	</main> --%>

	<jsp:include page="footer.jsp" />
</body>
</html>
