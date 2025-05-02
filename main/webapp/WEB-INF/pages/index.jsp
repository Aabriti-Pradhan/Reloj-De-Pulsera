<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Watch Store</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/message.css" />
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css" />
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

	<header class="hero">
		<jsp:include page="nav.jsp" />

		<div class="search-box">
			<input type="text" placeholder="Search">
		</div>

		<div class="hero-content">
			<h1>Timeless. Exquisite. Sophisticated.</h1>
			<p>Make Your Time Worthwhile.</p>
			<button>Shop Now</button>
		</div>


	</header>


	<section class="watch-section">
		<img
			src="${pageContext.request.contextPath}/resources/image/system/watch 1.png"
			alt="Watch 1">
		<div>
			<h2>Watch 1 Name</h2>
			<p>Classic craftsmanship meets modern elegance.</p>
		</div>
	</section>

	<section class="categories">
		<img
			src="${pageContext.request.contextPath}/resources/image/system/luxury 1.jpg"
			alt="Limited"> <img
			src="${pageContext.request.contextPath}/resources/image/system/straps.jpg"
			alt="Straps"> <img
			src="${pageContext.request.contextPath}/resources/image/system/boxes.png"
			alt="Cases">
	</section>

	<section class="watch-section">
		<div>
			<h2>Watch 2 Name</h2>
			<p>Luxury skeleton design for the modern gentleman.</p>
		</div>
		<img
			src="${pageContext.request.contextPath}/resources/image/system/watch 2.jpg"
			alt="Watch 2">
	</section>

	<section class="products">
		<div class="product-card">
			<img
				src="${pageContext.request.contextPath}/resources/image/system/buy now watch 1.png"
				alt="Watch A">
			<p>Watch A</p>
			<button>Buy Now</button>
		</div>
		<div class="product-card">
			<img
				src="${pageContext.request.contextPath}/resources/image/system/buy now watch 2.png"
				alt="Watch B">
			<p>Watch B</p>
			<button>Buy Now</button>
		</div>
		<div class="product-card">
			<img
				src="${pageContext.request.contextPath}/resources/image/system/buy now watch 3.png"
				alt="Watch C">
			<p>Watch C</p>
			<button>Buy Now</button>
		</div>
	</section>

	<div class="gallery-container">
		<h1>Featured Products</h1>

		<div class="image-toggle">
			<!-- Slides -->
			<div class="slide active"
				style="background-image: url('${pageContext.request.contextPath}/resources/image/system/toggle image 1.jpeg');"></div>
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

	<section class="cta">
		<h2>Crafted to make time matter.</h2>
		<button>Learn More</button>
	</section>

	<jsp:include page="footer.jsp" />

</body>

</html>