/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.UserDao;
import Dtos.User;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author d00186050
 */
public class LoginCommand implements Command{
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        String username = request.getParameter("usernameLogin");
        String password = request.getParameter("passwordLogin");
        
        if(username != null || password != null) {
            try {
                UserDao userdao = new UserDao("fishmoley");
                String hashedPassword = userdao.hashPassword(password);
                int Result = userdao.Login(username,hashedPassword);
                User Details = userdao.findEmailByUsername(username);
                
                if(Result == 1) {
                    User u = new User(username, password);
                   
                    HttpSession session = request.getSession();
                    
                    session.setAttribute("loggedin_status", "Ordinary User " + u.getUsername());
                    session.setAttribute("user_email", "Email: " + Details.getEmail());
                    session.setAttribute("login_num", 1);
                    forwardToJsp = "loggedin.jsp";
                }
                else if(Result == 2) {
                    User u = new User(username, password);
                    HttpSession session = request.getSession();
                    
                    session.setAttribute("loggedin_status", " Admin" + u.getUsername());
                    session.setAttribute("login_num", 2);
                    forwardToJsp = "loggedin.jsp";
                }
                else {
                    HttpSession session = request.getSession();
                    
                    session.setAttribute("loggedin_status", "Username or password wrong!");
                    forwardToJsp = "login.jsp";
                }
            }
            catch (NumberFormatException e) {
                forwardToJsp = "error.jsp";
                
                HttpSession session = request.getSession();
                
                session.setAttribute("errorMessage", "Not logged in");
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(LoginCommand.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return forwardToJsp;
    }
}
