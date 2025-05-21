<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Watch Store</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/explore.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>



<jsp:include page="nav.jsp" />
	<header>
		

		<div>
			<h1>Watch Collection</h1>
		</div>
	</header>


	<!-- First Row: 4 Products -->
	<section class="product-row">
		<c:forEach var="product" items="${products}">

			<div class="card">
				<div class="product">
					<img
						src="${pageContext.request.contextPath}/resources/image/watch/${product.imageURL}"
						alt="${product.name}">
					<p>${product.name}</p>
					<p>$${product.price}</p>
					<br> 
					<a href="${pageContext.request.contextPath}/productView?id=${product.id}">
						<button>View Product</button>
					</a>
				</div>
			</div>
			
		</c:forEach>
	</section>

	
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>