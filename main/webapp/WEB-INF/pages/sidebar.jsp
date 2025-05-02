<div class="sidebar">
	<a href="${pageContext.request.contextPath}/admin-dashboard" class="${activePage == 'dashboard' ? 'active' : ''}">
		<i class="fas fa-home"></i> Home
	</a>
	<a href="${pageContext.request.contextPath}/admin-order" class="${activePage == 'order' ? 'active' : ''}">
		<i class="fas fa-receipt"></i> Order
	</a> 
	<a href="${pageContext.request.contextPath}/admin-productlist" class="${activePage == 'product' ? 'active' : ''}">
		<i class="fas fa-box"></i> Product
	</a> 
	<a href="${pageContext.request.contextPath}/admin-addproduct" class="${activePage == 'addproduct' ? 'active' : ''}">
		<i class="fas fa-plus-square"></i> Add Product
	</a> 
	<a href="${pageContext.request.contextPath}/admin-customer" class="${activePage == 'customer' ? 'active' : ''}">
		<i class="fas fa-users"></i> Customer
	</a>
</div>
