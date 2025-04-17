<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Reloj de Pulsera - Login</title>
  <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css" />
	 <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
</head>

<body>
	<jsp:include page="nav.jsp" />


  <div>
    <div class="login-box">
      <div class="avatar">&#128100;</div>
      <form>
        <div class="input-group">
          <input type="text" placeholder="Username" required>
          <span class="icon">&#128100;</span>
        </div>
        <div class="input-group">
          <input type="password" placeholder="Password" required>
          <span class="icon">&#128274;</span>
        </div>
        <button type="submit">LOGIN</button>
      </form>
    </div>
  </div>
</body>

</html>