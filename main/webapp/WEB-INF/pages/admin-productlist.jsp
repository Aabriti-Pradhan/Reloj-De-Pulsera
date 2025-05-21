<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin-productlist.css" />
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
			request.setAttribute("activePage", "product");
			%>
			<div><jsp:include page="sidebar.jsp" /></div>



			<div class="content">
				<div class="header">
					<h2>Product List</h2>
					<div class="actions">
						<a href="${pageContext.request.contextPath}/admin-addproduct" class="add-product">Add product</a>

						<input type="text" placeholder="Search product" />
					</div>
				</div>

				<table class="product-table">
					<thead>
						<tr>
							<th><input type="checkbox" /></th>
							<th>Name</th>
							<th>Price</th>
							<th>Stock Quantity</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="watch" items="${watches}">
							<tr>
								<td><input type="checkbox" /></td>
								<td><img
									src="${pageContext.request.contextPath}/resources/image/watch/${watch.imageURL}"
									class="product-img" /> ${watch.name}</td>
								<td>Rs. ${watch.price}</td>
								<td>${watch.stock}</td>
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