/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.ProductDao;
import Dtos.Product;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author D00185666
 */
public class AddProductCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";

        String product_idString = request.getParameter("product_id");
        
        String product_name = request.getParameter("product_name");

        String product_priceString = request.getParameter("product_price");

        String product_details = request.getParameter("product_details");

        String category_idString = request.getParameter("category_id");

        String supplier_idString = request.getParameter("supplier_id");

        if (product_name != null && !product_name.equals("")) {
            try {
                
                int product_id = Integer.parseInt(product_idString);
                
                double product_price = Double.parseDouble(product_priceString);

                int category_id = Integer.parseInt(category_idString);

                int supplier_id = Integer.parseInt(supplier_idString);
                ProductDao productdao = new ProductDao("fishmoley");
                int Result = productdao.addProduct(product_id, product_name, product_price, product_details, category_id, supplier_id);

                if (Result == 1) {
                    Product p = new Product();
                    HttpSession session = request.getSession();

                    session.setAttribute("product_status", "Successfully added product!");
                    forwardToJsp = "addedProduct.jsp";
                } else if (Result == 0) {
                    HttpSession session = request.getSession();

                    session.setAttribute("product_status", "failed to add product");
                    forwardToJsp = "failAddedProduct.jsp";
                }
            } catch (NumberFormatException e) {
                forwardToJsp = "error.jsp";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Not added");

            }

        }
        return forwardToJsp;
    }
}
