<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<body>

	<!-- Main Content -->
	<div class="main">
		<div><jsp:include page="topbar.jsp" /></div>
		<div class="topside">
			<%
			request.setAttribute("activePage", "order");
			%>
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
							<c:forEach var="order" items="${orders}">
								<tr>
									<td>#${order.id}</td>
									<td><fmt:formatDate value="${order.date}"
											pattern="yyyy-MM-dd" /></td>
									<td>${order.customerName}</td>
									<td><span class="status-${order.status.toLowerCase()}">${order.status}</span>
									</td>
									<td>Rs. ${order.total_amt}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="pagination">1 of 6</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>