<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin-dashboard.css" />
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
		<% request.setAttribute("activePage", "dashboard"); %>
			<div><jsp:include page="sidebar.jsp" /></div>
			<!-- Dashboard Content -->
			<div class="content">
				<div class="section-title">Reports</div>

				<div class="cards">
					<div class="card">
						<i class="fas fa-bag-shopping"></i>
						<div>
							<div class="label">Orders</div>
							<div class="value">15</div>
						</div>
					</div>
					<div class="card">
						<i class="fas fa-cart-shopping"></i>
						<div>
							<div class="label">Products</div>
							<div class="value">10</div>
						</div>
					</div>
					<div class="card">
						<i class="fas fa-users"></i>
						<div>
							<div class="label">Customers</div>
							<div class="value">100</div>
						</div>
					</div>
				</div>

				<div class="kpi">
					<div class="kpi-box">
						<p>Revenue</p>
						<h4>Rs. 15,00,000</h4>
					</div>
					<div class="kpi-box">
						<p>Net</p>
						<h4>Rs. 10,00,000</h4>
					</div>
					<div class="kpi-box">
						<p>Pending Orders</p>
						<h4>5</h4>
					</div>
					<div class="kpi-box">
						<p>Complete Order</p>
						<h4>10</h4>
					</div>
				</div>

				<div class="customer-table">
					<div class="table-header">
						<h3>Latest Customers</h3>
						<a href="#">View All</a>
					</div>
					<table>
						<thead>
							<tr>
								<th>Date</th>
								<th>Customer Name</th>
								<th>Order Info</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>17 Apr</td>
								<td>Aastha Paudel</td>
								<td>2 Orders Placed</td>
							</tr>
							<tr>
								<td>17 Apr</td>
								<td>Aabriti Pradhan</td>
								<td>0 Orders Placed</td>
							</tr>
							<tr>
								<td>17 Apr</td>
								<td>Simona Thapa</td>
								<td>0 Orders Placed</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>




</body>
</html>