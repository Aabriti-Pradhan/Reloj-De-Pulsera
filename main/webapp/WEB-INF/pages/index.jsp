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
</head>


<body>

  <header class="hero">
    <jsp:include page="nav.jsp" />
    
    <div class="search-box">
      <input type="text" placeholder="Search">
    </div>
    <div class="hero-content">
      <h1>Timeless. Exquisite. Sophisticated.</h1>
      <p> Make Your Time Worthwhile.</p>
      <button>Shop Now</button>
    </div>
  </header>

  <section class="watch-section">
    <img src="${pageContext.request.contextPath}/resources/image/system/watch 1.png" alt="Watch 1">
    <div>
      <h2>Watch 1 Name</h2>
      <p>Classic craftsmanship meets modern elegance.</p>
    </div>
  </section>

  <section class="categories">
    <img src="${pageContext.request.contextPath}/resources/image/system/luxury 1.jpg" alt="Limited">
    <img src="${pageContext.request.contextPath}/resources/image/system/straps.jpg" alt="Straps">
    <img src="${pageContext.request.contextPath}/resources/image/system/boxes.png" alt="Cases">
  </section>

  <section class="watch-section">
    <div>
      <h2>Watch 2 Name</h2>
      <p>Luxury skeleton design for the modern gentleman.</p>
    </div>
    <img src="${pageContext.request.contextPath}/resources/image/system/watch 2.jpg" alt="Watch 2">
  </section>

  <section class="products">
    <div class="product-card">
      <img src="${pageContext.request.contextPath}/resources/image/system/buy now watch 1.png" alt="Watch A">
      <p>Watch A</p>
      <button>Buy Now</button>
    </div>
    <div class="product-card">
      <img src="${pageContext.request.contextPath}/resources/image/system/buy now watch 2.png" alt="Watch B">
      <p>Watch B</p>
      <button>Buy Now</button>
    </div>
    <div class="product-card">
      <img src="${pageContext.request.contextPath}/resources/image/system/buy now watch 3.png" alt="Watch C">
      <p>Watch C</p>
      <button>Buy Now</button>
    </div>
  </section>

  <div class="carousel"></div>

  <section class="cta">
    <h2>Crafted to make time matter.</h2>
    <button>Learn More</button>
  </section>

  <footer>
    Footer
  </footer>

</body>

</html>