<div class="sidebar">
	<div class="avatar"></div>
	<h3>Barack Obama</h3>
	<p class="email">barackobama@gmail.com</p>
	<a href="${pageContext.request.contextPath}/userProfile"
		class="${activePage == 'userProfile' ? 'active' : ''}"> <i
		class="fas fa-home"></i> Profile
	</a> <a href="${pageContext.request.contextPath}/userEditProfile"
		class="${activePage == 'editProfile' ? 'active' : ''}"> <i
		class="fas fa-receipt"></i> Edit Profile
	</a>
	<a href="${pageContext.request.contextPath}/purchaseHistory"
		class="${activePage == 'purchaseHistory' ? 'active' : ''}"> <i
		class="fas fa-receipt"></i> Purchase History
	</a>
</div>

