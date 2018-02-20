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
public class RegisterCommand implements Command{
        public String execute(HttpServletRequest request, HttpServletResponse response) {
                String forwardToJsp = "";
                String Username = request.getParameter("usernameRegister");
                String Password = request.getParameter("passwordRegister1");
                String Password2 = request.getParameter("passwordRegister2");
                String Email = request.getParameter("emailRegister");
                String Phone = request.getParameter("phoneRegister");
                
                   if (Username != null || Password != null || Password2 != null) {
                    try {
                        UserDao userdao = new UserDao("fishmoley");
                        String HashedPassword = userdao.hashPassword(Password);
                        String HashedPassword2 = userdao.hashPassword(Password2);
                        int Result = userdao.registerUser(Username, HashedPassword, HashedPassword2,Email,Phone);
                        
                        if(Result == 1) {
                            User u = new User(Username,Password);
                            HttpSession session = request.getSession();
                            
                            session.setAttribute("login_status", "Successfully registered!");
                            forwardToJsp = "login.jsp";
                        }
                        else if(Result == -1) {
                            HttpSession session = request.getSession();
                            
                            session.setAttribute("register_status", "Username already taken!");
                            forwardToJsp = "register.jsp";
                        }
                        else if(Result == -2) {
                            HttpSession session = request.getSession();
                            
                            session.setAttribute("register_status" , "Passwords not the same!");
                            forwardToJsp = "register.jsp";
                        }
                    }
                    catch (NumberFormatException e)
                    {
                        forwardToJsp = "error.jsp";
                        HttpSession session = request.getSession();
                        session.setAttribute("errorMessage", "Not logged in");
                    }
                    catch (NoSuchAlgorithmException ex) {
                        forwardToJsp = "error.jsp";
                        HttpSession session = request.getSession();
                        session.setAttribute("errorMessage", "No such algorithim found!");
                    }
                }
                return forwardToJsp;
        }
}
