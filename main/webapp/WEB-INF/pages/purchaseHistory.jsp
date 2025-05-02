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
	href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/userProfileSidebar.css" />
</head>
<body>

	<div class="container">
		<%
		request.setAttribute("activePage", "purchaseHistory");
		%>
		<div><jsp:include page="userProfileSidebar.jsp" /></div>
		<main class="purchase-history-container">
			<h2 class="section-title">Purchase History</h2>
			<table>
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
					<tr>
						<td>1201</td>
						<td>July 29, 2024</td>
						<td>4506</td>
						<td>Order Received</td>
						<td>$300</td>
					</tr>
					<tr>
						<td>1202</td>
						<td>August 01, 2024</td>
						<td>4507</td>
						<td>Order Received</td>
						<td>$350</td>
					</tr>
					<tr>
						<td>1203</td>
						<td>August 05, 2024</td>
						<td>4508</td>
						<td>Order Pending</td>
						<td>$200</td>
					</tr>
					<tr>
						<td>1204</td>
						<td>August 06, 2024</td>
						<td>4509</td>
						<td>Order Pending</td>
						<td>$250</td>
					</tr>
					<tr>
						<td>1201</td>
						<td>July 29, 2024</td>
						<td>4506</td>
						<td>Order Received</td>
						<td>$150</td>
					</tr>
					<tr>
						<td>1202</td>
						<td>August 01, 2024</td>
						<td>4507</td>
						<td>Order Received</td>
						<td>$200</td>
					</tr>
					<tr>
						<td>1203</td>
						<td>August 05, 2024</td>
						<td>4508</td>
						<td>Order Pending</td>
						<td>$150</td>
					</tr>
					<tr>
						<td>1204</td>
						<td>August 06, 2024</td>
						<td>4509</td>
						<td>Order Pending</td>
						<td>$200</td>
					</tr>
				</tbody>
			</table>
		</main>

		
		</div>
		<div class="foot"><jsp:include page="footer.jsp" /></div>
		
</body>
</html>
