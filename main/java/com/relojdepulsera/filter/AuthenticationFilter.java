package com.relojdepulsera.filter;

import java.io.IOException;

import com.relojdepulsera.util.SessionUtil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {
	
	private static final String LOGIN = "/login";
	private static final String REGISTER = "/register";
	private static final String HOME = "/index";
	private static final String ROOT = "/";
	private static final String EXPLORE = "/explore";
	private static final String PRODUCT_VIEW = "/productView";
	private static final String PURCHASE_HISTORY = "/purchaseHistory";
	private static final String ABOUT = "/aboutUs";
	private static final String USER_PROFILE = "/userProfile";
	private static final String CONTACT = "/contactUs";
	private static final String USER_EDIT_PROFILE = "/userEditProfile";
	private static final String BUY_NOW = "/buyNow";
	

	private static final String LOGOUT = "/logout";

	private static final String DASHBOARD = "/dashboard";
	private static final String ADD_PRODUCT = "/admin-addproduct";
	private static final String CUSTOMER_LIST = "/admin-customer";
	private static final String ORDER_LIST = "/admin-order";
	private static final String PRODUCT_LIST = "/admin-productlist";
	private static final String EDIT_PROFILE = "/admin-profile";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Initialization logic, if required
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();
		
		// Allow access to resources
		if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")) {
			chain.doFilter(request, response);
			return;
		}
		
		boolean isLoggedIn = SessionUtil.getAttribute(req, "username") != null;
		String userRole = (String) SessionUtil.getAttribute(req, "role");


		if ("admin".equalsIgnoreCase(userRole)) {
			// Admin is logged in
			if (uri.endsWith(DASHBOARD) || uri.endsWith(ADD_PRODUCT) || uri.endsWith(CUSTOMER_LIST)
					|| uri.endsWith(PRODUCT_LIST) || uri.endsWith(ORDER_LIST) || uri.endsWith(EDIT_PROFILE) || uri.endsWith(LOGOUT)) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath() + DASHBOARD);
			}
		} else if ("user".equalsIgnoreCase(userRole)) {
			// User is logged in
			if (uri.endsWith(HOME) || uri.endsWith(EXPLORE) || uri.endsWith(PRODUCT_VIEW) || uri.endsWith(PURCHASE_HISTORY)
					|| uri.endsWith(ABOUT) || uri.endsWith(USER_PROFILE) || uri.endsWith(CONTACT) || uri.endsWith(USER_EDIT_PROFILE) 
					|| uri.endsWith(LOGOUT) || uri.endsWith(BUY_NOW)) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath() + HOME);
			}
		} else {
			// Not logged in
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT)) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath() + LOGIN);
			}
		}
	}

	@Override
	public void destroy() {
		// Cleanup logic, if required
	}

}
