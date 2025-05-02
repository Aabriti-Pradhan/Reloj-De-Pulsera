<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Watch Product Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/productView.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css" />
</head>
<body>
	<header>
		<jsp:include page="nav.jsp" />

	</header>

	<main class="product-page">
		<section class="top-section">
			<div class="images">
				<div class="main-image"></div>
				<%-- <div class="thumbnails">
					<div class="thumb"></div>
					<div class="thumb"></div>
					<div class="thumb"></div>
					<div class="thumb"></div>
				</div>  --%>
			</div>

			<div class="info">
				<h2>Watch Name 1</h2>
				<label>Select Size</label>
				<div class="sizes">
					<button>41 mm</button>
					<button>42 mm</button>
					<button>43 mm</button>
					<button>44 mm</button>
				</div>
				<div class="price-qty">
					<p>
						Total Price: <strong>$350</strong>
					</p>
					<div class="qty-control">
						<label>Quantity</label> <input type="number" value="1" min="1" />
					</div>
				</div>
				<div class="buttons">
					<button class="add-to-cart">Add to Cart</button>
					<button class="buy-now">Buy It Now</button>
				</div>
				<p class="note">Easy styling watch featured on cart & new watch
					section.</p>
			</div>
		</section>

		<section class="feature-watch">
			<h3>STYLISH WATCH</h3>
			<p>Your Perfect Featured Watch</p>
			<div class="feature-image"></div>
		</section>

		<section class="product-detail">
			<h3>Product Detail</h3>
			<ul>
				<li>Water Resistant 50m+ 50m</li>
				<li>Superior Crystal Glass</li>
				<li>Available Colors</li>
				<li>Cold Resistant Leather Strap</li>
				<li>10-Year International Warranty</li>
			</ul>
			<div class="two-cols">
				<div class="col">
					<div class="image-box"></div>
					<p>Text</p>
				</div>
				<div class="col">
					<div class="image-box"></div>
					<p>Text</p>
				</div>
			</div>
		</section>

		<section class="related-products">
			<h3>Related Products</h3>
			<div class="related-images">
				<div class="related-item"></div>
				<div class="related-item"></div>
				<div class="related-item"></div>
			</div>
		</section>
	</main>

	<jsp:include page="footer.jsp" />
</body>
</html>
