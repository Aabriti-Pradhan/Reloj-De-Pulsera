<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Orders - Reloj De Pulsera</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin-order.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/topbar.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/sidebar.css" />
<link href="https://fonts.googleapis.com/css2?family=Inter&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

	<!-- Main Content -->
	<div class="main">
		<div><jsp:include page="topbar.jsp" /></div>
		<div class="topside">
		<% request.setAttribute("activePage", "order"); %>
			<div><jsp:include page="sidebar.jsp" /></div>
			<div class="container">
				<section class="content">
					<div class="search-filter">
						<input type="text" placeholder="Search..." class="search-box" />
						<div class="filter">📊 Filter</div>
					</div>

					<table class="orders-table">
						<thead>
							<tr>
								<th>ORDER</th>
								<th>DATE</th>
								<th>CUSTOMER</th>
								<th>STATUS</th>
								<th>TOTAL</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>#123</td>
								<td>18 Apr 2025</td>
								<td>Aastha Paudel</td>
								<td>Delivered</td>
								<td>Rs. 1,20,000</td>
							</tr>
							<tr>
								<td>#123</td>
								<td>18 Apr 2025</td>
								<td>Aabriti Pradhan</td>
								<td>Processed</td>
								<td>Rs. 1,10,000</td>
							</tr>
							<tr>
								<td>#123</td>
								<td>18 Apr 2025</td>
								<td>Simona Thapa</td>
								<td>Processed</td>
								<td>Rs. 90,000</td>
							</tr>
							<tr>
								<td>#123</td>
								<td>18 Apr 2025</td>
								<td>Mandira Budhathoki</td>
								<td>Delivered</td>
								<td>Rs. 1,25,000</td>
							</tr>
							<tr>
								<td>#123</td>
								<td>18 Apr 2025</td>
								<td>Manusha Karki</td>
								<td>Processed</td>
								<td>Rs. 70,000</td>
							</tr>
							<tr>
								<td>#123</td>
								<td>18 Apr 2025</td>
								<td>Aastha Paudel</td>
								<td>Delivered</td>
								<td>Rs. 90,000</td>
							</tr>
						</tbody>
					</table>

					<div class="pagination">1 of 6</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>