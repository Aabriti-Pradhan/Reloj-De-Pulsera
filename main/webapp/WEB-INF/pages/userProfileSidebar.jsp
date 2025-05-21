<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sidebar">
	<div class="profile-img">
		<c:choose>
			<c:when test="${not empty sessionScope.user.imageURL}">
				<img
					src="${pageContext.request.contextPath}/resources/image/user/${sessionScope.user.imageURL}"
					alt="Profile Image" class="image" />
			</c:when>
			<c:otherwise>
				<img
					src="${pageContext.request.contextPath}/resources/image/system/boxes.png"
					alt="Default Avatar" class="image" />
			</c:otherwise>
		</c:choose>
	</div>
	<h3>${sessionScope.user.firstName}${sessionScope.user.lastName}</h3>
	<p class="email">${sessionScope.user.email}</p>
	<hr>
	<br>
	<div class = "box">
		<a href="${pageContext.request.contextPath}/userProfile"
			class="${activePage == 'userProfile' ? 'active' : ''}"> <i
			class="fas fa-home"></i> Profile
		</a> <a href="${pageContext.request.contextPath}/userEditProfile"
			class="${activePage == 'editProfile' ? 'active' : ''}"> <i
			class="fas fa-receipt"></i> Edit Profile
		</a> <a href="${pageContext.request.contextPath}/purchaseHistory"
			class="${activePage == 'purchaseHistory' ? 'active' : ''}"> <i
			class="fas fa-receipt"></i> Purchase History
		</a>
	</div>
</div>

