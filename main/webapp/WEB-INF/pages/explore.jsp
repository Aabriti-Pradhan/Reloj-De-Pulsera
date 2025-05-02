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
</head>
<body>



	<header>
		<jsp:include page="nav.jsp" />

		<div>
			<h1>Watch Collection</h1>
		</div>
	</header>


	<!-- First Row: 4 Products -->
	<section class="product-row">
		<a href="${pageContext.request.contextPath}/productView">
			<div class="product">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/kidswatch2.jpg"
					alt="Watch 1">
				<p>Watch 1</p>
				<span>$100</span>
			</div>
		</a> <a>
			<div class="product">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/kidswatch3.jpg"
					alt="Watch 2">
				<p>Watch 2</p>
				<span>$120</span>
			</div>
		</a> <a>
			<div class="product">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/watch1.jpg"
					" alt="Watch 3">
				<p>Watch 3</p>
				<span>$140</span>
			</div>
		</a> <a>
			<div class="product">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/watch2.jpg"
					alt="Watch 4">
				<p>Watch 4</p>
				<span>$160</span>
			</div>
		</a>
	</section>

	<!-- Second Row: 4 Products -->
	<section class="product-row">
		<a>
			<div class="product">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/watch3.jpg"
					alt="Watch 5">
				<p>Watch 5</p>
				<span>$110</span>
			</div>
		</a> <a>
			<div class="product">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/watch4.jpg"
					alt="Watch 6">
				<p>Watch 6</p>
				<span>$130</span>
			</div>
		</a> <a>
			<div class="product">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/watch5.jpg"
					alt="Watch 7">
				<p>Watch 7</p>
				<span>$150</span>
			</div>
		</a> <a>
			<div class="product">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/watch6.jpg"
					alt="Watch 8">
				<p>Watch 8</p>
				<span>$170</span>
			</div>
		</a>
	</section>

	<!-- Third Row: 1 tall left image + 2 stacked right images -->
	<section class="special-row">
		<a>
			<div class="left-tall">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/watch7.jpg"
					alt="Tall Image">
			</div>
		</a> <a>
			<div class="right-stack">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/watch8main.jpg"
					alt="Top Right Image"> <img
					src="${pageContext.request.contextPath}/resources/image/system/products/watchband1.jpg"
					alt="Bottom Right Image">
			</div>
		</a>
	</section>

	<!-- Fourth Row: 4 Images only -->
	<section class="product-row no-text">
		<a>
			<div class="product">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/watchband2.jpg"
					alt="Watch 12">
			</div>
		</a> <a>
			<div class="product">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/products/watchbox1.jpg"
					alt="Watch 13">
			</div> <a> <a>
					<div class="product">
						<img
							src="${pageContext.request.contextPath}/resources/image/system/products/watchbox2.jpg"
							alt="Watch 14">
					</div>
			</a> <a>
					<div class="product">
						<img
							src="${pageContext.request.contextPath}/resources/image/system/products/womenwatch2.jpg"
							alt="Watch 15">
					</div>
			</a>
	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>