<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.relojdepulsera.model.CategoryModel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Add Product - Reloj De Pulsera</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin-addproduct.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/topbar.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/sidebar.css" />
<link href="https://fonts.googleapis.com/css2?family=Inter&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/message.css" />

</head>
<body>


	<!-- Main Content -->
	<div class="main">
		<div><jsp:include page="topbar.jsp" /></div>
		<div class="topside">
			<%
			request.setAttribute("activePage", "addproduct");
			%>
			<div><jsp:include page="sidebar.jsp" /></div>
			<div class="content">
				<h2>Add a product</h2>

				<form action="${pageContext.request.contextPath}/admin-addproduct"
					method="post" enctype="multipart/form-data">
					<div class="form-area">
						<div class="left-form">
							<label>Product Title</label> <input type="text"
								placeholder="Write title here..." name="title" /> <label>Product
								Description</label>
							<textarea placeholder="Write a description here..."
								name="describe"></textarea>

							<label name>Display Images</label>
							<div class="image-upload-box">
								<input type="file" id="image" name="image">
							</div>

							<label>Inventory</label>
							<div class="inventory">
								<input type="text" placeholder="Quantity" name="stock" /><input
									type="text" placeholder="Sale Price" name="price" />
							</div>
						</div>

						<div class="right-panel">
							<div class="category-box">
								<p>Organize</p>
								<label for="category">Category</label> <select name="category">
									<option value="" disabled selected>Select Category</option>

									<c:if test="${not empty category}">
										<c:forEach var="category" items="${category}">
											<option value="${category.id}">${category.name}</option>
										</c:forEach>
									</c:if>

								</select>
							</div>

							<button type="submit" class="publish-btn">Publish
								Product</button>
							<button class="discard-btn">Discard</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="message-box">
		<jsp:include page="messages.jsp" />
	</div>
</body>
</html>