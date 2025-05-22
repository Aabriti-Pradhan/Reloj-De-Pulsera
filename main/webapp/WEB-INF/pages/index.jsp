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
        
        setTimeout(() => {
            showSlides(slideIndex);
            startTimer();
        }, 100);
        
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
			<a href="${pageContext.request.contextPath}/explore"><button>Shop
					Now</button></a>
		</div>


	</header>
	<div style="padding-left: 20px; padding-right: 20px">


		<section class="watch-section">
			<img
				src="${pageContext.request.contextPath}/resources/image/system/watch 1.png"
				alt="Watch 1">
			<div class="para">
				<h2>Luxe Chronorise</h2>
				<br>
				<p class="first">Classic craftsmanship meets modern elegance.</p>
				<br>
				<p>Lorem ipsum dolor sit amet consectetur adipiscing elit.
					Placerat in id cursus mi pretium tellus duis. Urna tempor pulvinar
					vivamus fringilla lacus nec metus. Integer nunc posuere ut
					hendrerit semper vel class. Conubia nostra inceptos himenaeos orci
					varius natoque penatibus. Mus donec rhoncus eros lobortis nulla
					molestie mattis. Purus est efficitur laoreet mauris pharetra
					vestibulum fusce. Sodales consequat magna ante condimentum neque at
					luctus. Ligula congue sollicitudin erat viverra ac tincidunt nam.
					Lectus commodo augue arcu dignissim velit aliquam imperdiet. Cras
					eleifend turpis fames primis vulputate ornare sagittis. Libero
					feugiat tristique accumsan maecenas potenti ultricies habitant.
					Cubilia curae hac habitasse platea dictumst lorem ipsum. Faucibus
					ex sapien vitae pellentesque sem placerat in. Tempus leo eu aenean
					sed diam urna tempor.</p>
			</div>
		</section>
		<hr>

		<section class="categories">
			<div class="col image-overlay">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/luxury 1.jpg"
					alt="Limited">
				<div class="overlay-text">Luxurious Watch</div>
			</div>
			<div class="col image-overlay">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/straps.jpg"
					alt="Straps">
				<div class="overlay-text">Bands</div>
			</div>
			<div class="col image-overlay">
				<img
					src="${pageContext.request.contextPath}/resources/image/system/boxes.png"
					alt="Cases">
				<div class="overlay-text">Boxes</div>
			</div>
		</section>
		<hr>

		<section class="watch-section">
			<div class="para">
				<h2>Luxe Chronorise</h2>
				<br>
				<p class="first">Classic craftsmanship meets modern elegance.</p>
				<br>
				<p>Lorem ipsum dolor sit amet consectetur adipiscing elit.
					Placerat in id cursus mi pretium tellus duis. Urna tempor pulvinar
					vivamus fringilla lacus nec metus. Integer nunc posuere ut
					hendrerit semper vel class. Conubia nostra inceptos himenaeos orci
					varius natoque penatibus. Mus donec rhoncus eros lobortis nulla
					molestie mattis. Purus est efficitur laoreet mauris pharetra
					vestibulum fusce. Sodales consequat magna ante condimentum neque at
					luctus. Ligula congue sollicitudin erat viverra ac tincidunt nam.
					Lectus commodo augue arcu dignissim velit aliquam imperdiet. Cras
					eleifend turpis fames primis vulputate ornare sagittis. Libero
					feugiat tristique accumsan maecenas potenti ultricies habitant.
					Cubilia curae hac habitasse platea dictumst lorem ipsum. Faucibus
					ex sapien vitae pellentesque sem placerat in. Tempus leo eu aenean
					sed diam urna tempor.</p>
			</div>
			<img
				src="${pageContext.request.contextPath}/resources/image/system/watch 2.jpg"
				alt="Watch 1">
		</section>
		<hr>

		<section class="product-row">
			<c:forEach var="watch" items="${watchList}">
				<div class="card">
					<div class="product">
						<img
							src="${pageContext.request.contextPath}/resources/image/watch/${watch.imageURL}"
							alt="${watch.name}" />
						<p>${watch.name}</p>
						<p>$${watch.price}</p>
						<a
							href="${pageContext.request.contextPath}/productView?id=${watch.id}">
							<button>View Product</button>
						</a>
					</div>
				</div>
			</c:forEach>
		</section><hr>



		<div class="gallery-container">
			<h1>Featured Products</h1>

			<div class="image-toggle">
				<!-- Slides -->
				<div class="slide active"
					style="background-image: url('${pageContext.request.contextPath}/resources/image/system/toggle image 1.png');"></div>
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
	</div>

	<jsp:include page="footer.jsp" />

</body>

</html>