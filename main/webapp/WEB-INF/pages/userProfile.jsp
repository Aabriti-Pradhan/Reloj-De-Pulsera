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
	href="${pageContext.request.contextPath}/css/footer.css" />
</head>

<body>
	<div class="container">
		<%
		request.setAttribute("activePage", "userProfile");
		%>
		<div><jsp:include page="userProfileSidebar.jsp" /></div>

		<main class="main-content">
			<div class="banner"></div>

			<section class="bio-section">
				<h4>Bio graph</h4>
				<div class="bio-grid">
					<div>
						<strong>First Name :</strong> Barack
					</div>
					<div>
						<strong>Last Name :</strong> Obama
					</div>
					<div>
						<strong>Country :</strong> Nepal
					</div>
					<div>
						<strong>Birthdate :</strong> 13th July, 2000
					</div>
					<div>
						<strong>Location :</strong> Kalanki, Kathmandu
					</div>
					<div>
						<strong>Email :</strong> barackobama@gmail.com
					</div>
					<div>
						<strong>Mobile Number :</strong> 9844567657
					</div>
					<div>
						<strong>Phone :</strong> 0568899
					</div>
				</div>
			</section>

			<section class="orders-note">
				<p>
					<strong>Oder Listing</strong>
				</p>
				<div class="order-list">
					<p>Order #1 - Watch 1 Price:$300</p>
					<p>Order #2 - Watch 2 Price:$200</p>
					<p>Order #3 -Watch 3 Price:$300</p>
					<p>Order #4 -Watch 4 Price:$300</p>
					<p>Order #5 -Watch 5 Price:$300</p>
					<p>Order #6 -Watch 6 Price:$200</p>
					<p>Order #7 -Watch 7 Price:$250</p>
					<p>Order #8 -Watch 8 Price:$150</p>
					<p>Order #9 -Watch 9 Price:$250</p>
					<p>Order #10 -Watch 10 Price:$200</p>
				</div>
	</div>
	</section>
	</main>
	</div>
	<jsp:include page="footer.jsp" />

</body>

</html>