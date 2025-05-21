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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

</head>
<body>



	<!-- Main Content -->
	<div class="main">
		<div><jsp:include page="topbar.jsp" /></div>
		<div class="topside">
			<%
			request.setAttribute("activePage", "customer");
			%>
			<div><jsp:include page="sidebar.jsp" /></div>



			<div class="content">
				<div class="header">
					<h2>Customer List</h2>
					<div class="actions">
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
						<c:forEach var="user" items="${customer}">
							<tr>
								<td><input type="checkbox" /></td>
								<td><img
									src="${pageContext.request.contextPath}/resources/image/user/${user.imageURL}"
									class="product-img" /> ${user.firstName} ${user.lastName}</td>
								<td>${user.email}</td>
								<td>${user.phone}</td>
								<td>${user.address}</td>
								<td>⋮</td>
							</tr>
						</c:forEach>
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