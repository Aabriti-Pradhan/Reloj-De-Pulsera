package com.relojdepulsera.controller;

import java.io.IOException;

import com.relojdepulsera.util.RedirectionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Aabriti Pradhan
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/index", "/" })

public class indexController extends HttpServlet {
	
		private static final long serialVersionUID = 1L;

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.getRequestDispatcher(RedirectionUtil.indexUrl).forward(req, resp);
		}


}
