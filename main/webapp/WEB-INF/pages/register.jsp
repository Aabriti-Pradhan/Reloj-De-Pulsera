<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Register - Reloj de Pulsera</title>
  <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/register.css" />
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/nav.css" />
</head>
<body>

	<jsp:include page="nav.jsp" />

  <div class="register-container">
    <div class="register-box">
      <div class="avatar">&#128100;</div>

      <form>
        <div class="form-row">
          <div class="input-group">
            <input type="text" placeholder="First Name" required />
            <span class="icon">&#9998;</span>
          </div>
          <div class="input-group">
            <input type="text" placeholder="DOB" required />
            <span class="icon">&#128197;</span>
          </div>
        </div>

        <div class="form-row">
          <div class="input-group">
            <input type="text" placeholder="Last Name" required />
            <span class="icon">&#9998;</span>
          </div>
          <div class="input-group">
            <input type="text" placeholder="Gender" required />
            <span class="icon">&#9792;&#9794;</span>
          </div>
        </div>

        <div class="form-row">
          <div class="input-group">
            <input type="text" placeholder="Username" required />
            <span class="icon">&#128100;</span>
          </div>
          <div class="input-group">
            <input type="email" placeholder="Email" required />
            <span class="icon">&#9993;</span>
          </div>
        </div>

        <div class="form-row">
          <div class="input-group">
            <input type="password" placeholder="Password" required />
            <span class="icon">&#128274;</span>
          </div>
          <div class="input-group">
            <input type="tel" placeholder="Phone Number" required />
            <span class="icon">&#128222;</span>
          </div>
        </div>

        <div class="form-row">
          <div class="input-group">
            <input type="password" placeholder="Retype Password" required />
            <span class="icon">&#128274;</span>
          </div>
          <div class="input-group">
            <input type="text" placeholder="Admin/User" required />
            <span class="icon">&#128101;</span>
          </div>
        </div>

        <button type="submit" class="register-btn">Register</button>
      </form>
    </div>
  </div>
</body>
</html>
