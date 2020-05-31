package cart;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import data.*;
import metier.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext sc = getServletContext();
		String action = request.getParameter("action");
		if (action == null) {
			action = "cart";
		}
		String url = "/index.jsp";
		if (action.equals("shop")) {
			url = "/index.jsp";
		} else if (action.equals("cart")) {
			String productCode = request.getParameter("productCode");
			String quantityString = request.getParameter("quantity");

			HttpSession session = request.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			if (cart == null) {
				cart = new Cart();
			}
			int quantity;
			try {
				quantity = Integer.parseInt(quantityString);
				if (quantity < 0) {
					quantity = 1;
				}
			} catch (NumberFormatException nfe) {
				quantity = 1;
			}

			Product product = null;
			try {
				product = ProductIO.getProduct(productCode);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			LineItem lineItem = new LineItem();
			lineItem.setProduct(product);
			lineItem.setQuantity(quantity);

			if (quantity > 0) {
				cart.addItem(lineItem);
			} else if (quantity == 0) {
				cart.removeItem(lineItem);
			}
			session.setAttribute("cart", cart);
			url = "/cart.jsp";
		} else if (action.equals("checkout")) {
			url = "/checkout.jsp";
		}
		sc.getRequestDispatcher(url).forward(request, response);
	}

}
