package Commands;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Daos.ProductDao;
import Dtos.Product;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Colm
 */
public class UpdateProductsCommand implements Command {

    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String forwardToJsp = "";

        String product_name = request.getParameter("product_name");

        String product_priceString = request.getParameter("product_price");

        String product_details = request.getParameter("product_details");

        String category_idString = request.getParameter("category_id");

        String supplier_idString = request.getParameter("supplier_id");
        
        String product_idString = request.getParameter("product_id");

        if (product_name != null && !product_name.equals("")) {
            try {
                double product_price = Double.parseDouble(product_priceString);

                int category_id = Integer.parseInt(category_idString);

                int supplier_id = Integer.parseInt(supplier_idString);
                
                int product_id = Integer.parseInt(product_idString);

                ProductDao productdao = new ProductDao("FishMoley");
                int results = productdao.updateProducts(product_name, product_price, product_details, category_id, supplier_id, product_id);

                HttpSession session = request.getSession();

                session.setAttribute("numUpdated", results);

                if (results > 0) {
                    ArrayList<Product> products = productdao.getProductsByName(product_name);
                    session.setAttribute("updatedProducts", products);
                }
                forwardToJsp = "updateProducts.jsp";
            } catch (NumberFormatException e) {
                forwardToJsp = "error.jsp";
                HttpSession session = request.getSession();

                session.setAttribute("errorMessage", "Text was supplied for the amount to be updated by.");
            }
        } else {

            forwardToJsp = "error.jsp";

            HttpSession session = request.getSession();

            session.setAttribute("errorMessage", "A parameter value required for updating was missing");
        }
        return forwardToJsp;
    }

}
