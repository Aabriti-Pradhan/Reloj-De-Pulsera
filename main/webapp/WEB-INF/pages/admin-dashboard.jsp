<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<%
			request.setAttribute("activePage", "dashboard");
			%>
			<div><jsp:include page="sidebar.jsp" /></div>

			<!-- Dashboard Content -->
			<div class="content">
				<div class="section-title">Reports</div>

				<div class="cards">
					<div class="card">
						<i class="fas fa-bag-shopping"></i>
						<div>
							<div class="label">Orders</div>
							<div class="value">${totalOrders}</div>
						</div>
					</div>
					<div class="card">
						<i class="fas fa-cart-shopping"></i>
						<div>
							<div class="label">Products</div>
							<div class="value">${totalProducts}</div>
						</div>
					</div>
					<div class="card">
						<i class="fas fa-users"></i>
						<div>
							<div class="label">Customers</div>
							<div class="value">${totalCustomers}</div>
						</div>
					</div>
				</div>

				<div class="kpi">
					<div class="kpi-box">
						<p>Revenue</p>
						<h4>
							Rs.
							<fmt:formatNumber value="${totalRevenue}" type="number" maxFractionDigits="2" />
						</h4>
					</div>
					<div class="kpi-box">
						<p>Net</p>
						<h4>
							Rs.
							<fmt:formatNumber value="${netRevenue}" type="number" maxFractionDigits="2" />
						</h4>
					</div>
					<div class="kpi-box">
						<p>Pending Orders</p>
						<h4>${pendingOrders}</h4>
					</div>
					<div class="kpi-box">
						<p>Complete Order</p>
						<h4>${completedOrders}</h4>
					</div>
				</div>

				<div class="customer-table">
					<div class="table-header">
						<h3>Top Customers by Orders</h3>
						<!-- Changed title -->
						<a href="#">View All</a>
					</div>
					<table>
						<thead>
							<tr>
								<th>Customer ID</th>
								<th>Customer Name</th>
								<th>Orders Placed</th>
							</tr>
						</thead>

						</thead>
						<tbody>
							<c:forEach var="customer" items="${topCustomers}">
								<tr>
									<td>${customer.id}</td>
									<td>${customer.name}</td>
									<td>${customer.orderCount}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>