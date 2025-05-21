<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Purchase History</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/purchaseHistory.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/userProfile.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/userProfileSidebar.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body>
	<div class="container">
		<%
		request.setAttribute("activePage", "purchaseHistory");
		%>
		<jsp:include page="nav.jsp" />
		<div><jsp:include page="userProfileSidebar.jsp" /></div>

		<!-- Main Content -->
		<main class="purchase-history-container">
			<h2 class="section-title">Purchase History</h2>
			<table class="orders-table">
				<thead>
					<tr>
						<th>Order No.</th>
						<th>Order Date</th>
						<th>Purchase Order</th>
						<th>Status</th>
						<th>Total Price</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orders}">
						<tr>
							<td>#${order.id}</td>
							<td><fmt:formatDate value="${order.date}"
									pattern="yyyy-MM-dd" /></td>
							<td>${order.customerName}</td>
							<!-- This is watch name -->
							<td><span class="status-${order.status.toLowerCase()}">${order.status}</span></td>
							<td>Rs. ${order.total_amt}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</main>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>
