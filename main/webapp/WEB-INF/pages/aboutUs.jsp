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
		<div class="hero">
			<h2>About Us "Meet the team"</h2>
			<p>Get to know the amazing people behind our company</p>
		</div>
	</header>

	<main class="team-section">
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
	</main>

	<jsp:include page="footer.jsp" />
</body>
</html>
