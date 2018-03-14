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
        throw new UnsupportedOperationException("Not supported yet.");
        
    }
    
}
