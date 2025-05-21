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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>

<script>
    // Wait for DOM to be fully loaded
    document.addEventListener('DOMContentLoaded', function() {
        let slideIndex = 1;
        let slideInterval;
        
        // Initialize the slider
        showSlides(slideIndex);
        startTimer();
        
        function startTimer() {
            slideInterval = setInterval(() => {
                changeSlide(1);
            }, 5000);
        }
        
        // Next/previous controls
        function changeSlide(n) {
            showSlides(slideIndex += n);
            resetTimer();
        }
        
        // Thumbnail image controls
        function currentSlide(n) {
            showSlides(slideIndex = n);
            resetTimer();
        }
        
        function resetTimer() {
            clearInterval(slideInterval);
            startTimer();
        }
        
        function showSlides(n) {
            let slides = document.getElementsByClassName("slide");
            let dots = document.getElementsByClassName("dot");
            
            // Check if elements exist
            if (slides.length === 0 || dots.length === 0) {
                console.error("Slides or dots not found!");
                return;
            }
            
            // Boundary checks
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            
            // Hide all slides
            for (let i = 0; i < slides.length; i++) {
                slides[i].classList.remove("active");
            }
            
            // Remove active class from all dots
            for (let i = 0; i < dots.length; i++) {
                dots[i].classList.remove("active");
            }
            
            // Show current slide
            slides[slideIndex-1].classList.add("active");
            dots[slideIndex-1].classList.add("active");
            
            // Debug output
            console.log("Showing slide:", slideIndex, 
                        "Image:", slides[slideIndex-1].style.backgroundImage);
        }
        
        // Pause on hover
        const slider = document.querySelector('.image-toggle');
        if (slider) {
            slider.addEventListener('mouseenter', () => clearInterval(slideInterval));
            slider.addEventListener('mouseleave', startTimer);
        }
    });
</script>
<body>
	<header>
		<jsp:include page="nav.jsp" />

	</header>

	<main class="product-page">
		<section class="top-section">
			<div class="images">
				<img
					src="${pageContext.request.contextPath}/resources/image/watch/${product.imageURL}"
					alt="${product.name}" />
			</div>

			<div class="info">
				<h2>
					<c:out value="${product.name}" />
				</h2>
				<hr>
				<label>Select Size</label>
				<div class="sizes">
					<button>41 mm</button>
					<button>42 mm</button>
					<button>43 mm</button>
					<button>44 mm</button>
				</div>
				<div class="sep">
					<div>
						<div class="price-qty">
							<p>
								Total Price: <strong>$<c:out value="${product.price}" /></strong>
							</p>
							<%-- <div class="qty-control">
								<label>Quantity</label> <input type="number" value="1" min="1" />
							</div> --%>
						</div>
						<br>
						<div class="color-swatches">
							<span style="background-color: #000000;"></span> <span
								style="background-color: #ff0000;"></span> <span
								style="background-color: #0044cc;"></span>
						</div>
						<div class="buy-now">

							<form action="${pageContext.request.contextPath}/buyNow"
								method="post">
								<input type="hidden" name="productId" value="${product.id}" />
								<input type="hidden" name="price" value="${product.price}" /> 
								<div class="qty-control">
								<label>Quantity</label><input type="number" name="quantity" value="1" min="1" required />
								</div><br>
								<button>Buy It Now</button>
							</form>

						</div>
					</div>
					<div class="product-reviews">
						<h3>Customer Reviews</h3>
						<div class="review">
							<p>⭐⭐⭐⭐⭐</p>
							<p>"Absolutely love this watch – the leather strap feels
								premium."</p>
							<span>- Arjun S.</span>
						</div>
					</div>
				</div>
			</div>
		</section>

		<br>
		<hr>
		<br>

		<div class="gallery-container">
			<h1>Product Images</h1>

			<div class="image-toggle">
				<!-- Slides -->
				<div class="slide active"
					style='background-image: url("${pageContext.request.contextPath}/resources/image/watch/${product.imageURL}")'>
				</div>
				<div class="slide"
					style="background-image: url('${pageContext.request.contextPath}/resources/image/system/toggle image 2.png');"></div>
				<div class="slide"
					style="background-image: url('${pageContext.request.contextPath}/resources/image/system/toggle image 3.png');"></div>
				<div class="slide"
					style="background-image: url('${pageContext.request.contextPath}/resources/image/system/toggle image 4.png');"></div>

				<!-- Navigation Arrows -->
				<div class="arrow prev" onclick="changeSlide(-1)">&#10094;</div>
				<div class="arrow next" onclick="changeSlide(1)">&#10095;</div>
			</div>

			<!-- Navigation Dots -->
			<div class="dots-container">
				<span class="dot active" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span> <span class="dot"
					onclick="currentSlide(4)"></span>
			</div>
		</div>

		<br>
		<hr>
		<br>

		<section class="product-detail">
			<h3>Product Detail</h3>
			<br>
			<p>"${product.description}"</p>
			<div class="para">
				<p>Glass: Superior Crystal Glass</p>
				<p>Colours: Red Blue Green</p>
				<p>Strap Material: Cold Resistant Leather Strap</p>
				<p>Warranty: 10-Year International Warranty</p>
				<p>Water Resistance: 50m</p>
			</div>

			<br>
			<hr>
			<br>

			<div class="two-cols">
				<div class="col image-overlay">
					<img alt="band 1"
						src="${pageContext.request.contextPath}/resources/image/system/band 1.png" />
					<div class="overlay-text">Extra Band</div>
				</div>
				<div class="col image-overlay">
					<img alt="band 2"
						src="${pageContext.request.contextPath}/resources/image/system/band 2.png" />
					<div class="overlay-text">More Colours</div>
				</div>
			</div>

		</section>

		<br>
		<hr>
		<br>

		<section class="related-products">
			<h3>Related Products</h3>
			<div class="product-row">
				<c:forEach var="related" items="${related}">
					<div class="card">
						<div class="product">
							<img
								src="${pageContext.request.contextPath}/resources/image/watch/${related.imageURL}"
								alt="${related.name}">
							<p>${related.name}</p>
							<p>$${related.price}</p>
							<br> <a
								href="${pageContext.request.contextPath}/productView?id=${related.id}">
								<button>View Product</button>
							</a>
						</div>
					</div>
				</c:forEach>

			</div>
		</section>

	</main>

	<jsp:include page="footer.jsp" />
</body>
</html>
