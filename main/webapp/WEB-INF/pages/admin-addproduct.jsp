<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

</head>
<body>


	<!-- Main Content -->
	<div class="main">
		<div><jsp:include page="topbar.jsp" /></div>
		<div class="topside">
		<% request.setAttribute("activePage", "addproduct"); %>
			<div><jsp:include page="sidebar.jsp" /></div>
			<div class="content">
				<h2>Add a product</h2>

				<div class="form-area">
					<div class="left-form">
						<label>Product Title</label> <input type="text"
							placeholder="Write title here..." /> <label>Product
							Description</label>
						<textarea placeholder="Write a description here..."></textarea>

						<label>Display Images</label>
						<div class="image-upload-box">
							<p>
								Drag your photo here or <span>Browse from device</span>
							</p>
							<div class="upload-icon">📷➕</div>
						</div>

						<label>Inventory</label>
						<div class="inventory">
							<input type="text" placeholder="Quantity" /> <input type="text"
								placeholder="Product ID" /> <input type="text"
								placeholder="Sale Price" />
						</div>
					</div>

					<div class="right-panel">
						<div class="category-box">
							<p>Organize</p>
							<label for="category">Category</label> <select id="category">
								<option>Men's Watch</option>
								<option>Women's Watch</option>
								<option>Luxury</option>
								<option>Sport</option>
							</select>
						</div>

						<button class="publish-btn">Publish Product</button>
						<button class="discard-btn">Discard</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>