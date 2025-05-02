<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin-customer.css" />
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
		<% request.setAttribute("activePage", "customer"); %>
			<div><jsp:include page="sidebar.jsp" /></div>



			<div class="content">
				<div class="header">
					<h2>Customer List</h2>
					<div class="actions">
						<button class="add-product">Add customer</button>
						<input type="text" placeholder="Search product" />
					</div>
				</div>

				<table class="product-table">
					<thead>
						<tr>
							<th><input type="checkbox" /></th>
							<th>Name</th>
							<th>Email</th>
							<th>Phone Number</th>
							<th>Address</th>
							
							<th></th>
						</tr>
					</thead>
					<tbody>
						<!-- Repeat this row as needed -->
						<tr>
							<td><input type="checkbox" /></td>
							<td><img src="placeholder.jpg" class="product-img" /> Aastha Paudel</td>
							<td>aasthapaudel123@gmail.com</td>
							<td>98123456789</td>
							<td>Kathmandu</td>							
							<td>⋮</td>
						</tr>
						<tr>
							<td><input type="checkbox" /></td>
							<td><img src="placeholder.jpg" class="product-img" /> Aabriti Pradhan</td>
							<td>aabritipradhan123@gmail.com</td>
							<td>98123456788</td>
							<td>Kathmandu</td>
							<td>⋮</td>
						</tr>
						<!-- ... -->
					</tbody>
				</table>

				<div class="pagination">
					<button>&lt;</button>
					<button class="active-page">1</button>
					<button>2</button>
					<button>&gt;</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>