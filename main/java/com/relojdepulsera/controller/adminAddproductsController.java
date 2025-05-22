package com.relojdepulsera.controller;

import java.io.IOException;

import com.relojdepulsera.model.UserModel;
import com.relojdepulsera.model.WatchModel;
import com.relojdepulsera.service.AddproductService;
import com.relojdepulsera.service.RegisterService;
import com.relojdepulsera.util.ImageUtil;
import com.relojdepulsera.util.PasswordUtil;
import com.relojdepulsera.util.RedirectionUtil;
import com.relojdepulsera.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
/**
 * @author Aabriti Pradhan
 */


@WebServlet(urlPatterns = { "/admin-addproduct"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class adminAddproductsController extends  HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private final String rootURL = "WEB-INF/pages";
	private final String add = rootURL+"/admin-addproduct.jsp";
	private static final String PAGE = "/WEB-INF/pages/admin-addproduct.jsp";
	private AddproductService addproductService;
	private ImageUtil imageUtil;
	private final ValidationUtil validationUtil = new ValidationUtil();
	private final RedirectionUtil redirectionUtil = new RedirectionUtil();
	
	public void init() throws ServletException {
		this.imageUtil = new ImageUtil();
	}

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	if (addproductService == null) {
            addproductService = new AddproductService();
        }
    	
        req.setAttribute("category", addproductService.getDistinctCategory());
        req.getRequestDispatcher(PAGE).forward(req, resp);
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    	req.setAttribute("category", addproductService.getDistinctCategory());
		
    	String Name = req.getParameter("title");
		String Desc = req.getParameter("describe");
		String Stock = req.getParameter("stock");
		String Price = req.getParameter("price");
		String Category = req.getParameter("category");


		if (validationUtil.isNullOrEmpty(Name) || 
			validationUtil.isNullOrEmpty(Desc) || 
			validationUtil.isNullOrEmpty(Stock)|| 
			validationUtil.isNullOrEmpty(Price) || 
			validationUtil.isNullOrEmpty(Category)) {
			redirectionUtil.setMsgAndRedirect(req, resp, "error", "You have not filled the feilds!", add);
		} else {
			
			try {
				System.out.println("Received values: ");
				System.out.println("Name: " + Name);
				System.out.println("Desc: " + Desc);
				System.out.println("Stock: " + Stock);
				System.out.println("Price: " + Price);
				System.out.println("Category: " + Category);
				
				WatchModel watchModel = extractWatchModel(req, resp);
				Boolean isAdded = addproductService.addWatch(watchModel);

				if (isAdded == null) {
					redirectionUtil.setMsgAndRedirect(req, resp, "error",
							"An unexpected error occurred. Please try again later!", RedirectionUtil.addUrl);
				} else if (isAdded) {
					if (uploadImage(req)) {
						redirectionUtil.setMsgAndRedirect(req, resp, "success", "Watch was successfully added!",
								RedirectionUtil.addUrl);
					} else {
						redirectionUtil.setMsgAndRedirect(req, resp, "error",
								"Could not upload the image. Please try again later!", RedirectionUtil.addUrl);
					}
				} else {
					redirectionUtil.setMsgAndRedirect(req, resp, "error",
							"Could not register your account. Please try again later!", RedirectionUtil.addUrl);
				}
			} catch (Exception e) {
				redirectionUtil.setMsgAndRedirect(req, resp, "error",
						"Try catch ko error. Please try again later!", RedirectionUtil.addUrl);
				e.printStackTrace(); // Log the exception
			}
			
		}
		

	}
    
    private WatchModel extractWatchModel(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String Name = req.getParameter("title");
		String Desc = req.getParameter("describe");
		int Stock = Integer.parseInt(req.getParameter("stock"));
		int Price = Integer.parseInt(req.getParameter("price"));
		int Category = Integer.parseInt(req.getParameter("category"));


		Part image = req.getPart("image");
		String imageUrl = null; // Default value
	    
	    if (image != null && image.getSize() > 0) {
	        imageUrl = imageUtil.getImageNameFromPart(image);
	    }

		return new WatchModel(Name, Category, Price, Desc, Stock, imageUrl);
	}
    
    
    private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {
		Part image = req.getPart("image");
		if (image == null || image.getSize() == 0) {
	        return false; // No image to upload
	    }
		return imageUtil.uploadImage(image, req.getServletContext().getRealPath("/"), "user");
	}

}
