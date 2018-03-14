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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author d00186050
 */
public class RegisterCommand implements Command {

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        String Username = request.getParameter("usernameRegister");
        String Password = request.getParameter("passwordRegister1");
        String Password2 = request.getParameter("passwordRegister2");
        String Email = request.getParameter("emailRegister");
//              ^                 # start-of-string
//(?=.*[0-9])   # a digit must occur at least once
//(?=.*[a-z])   # a lower case letter must occur at least once
//(?=.*[A-Z])   # an upper case letter must occur at least once
//(?=.*[@#$%^&+=]) # a special character must occur at least once
//(?=\S+$)      # no whitespace allowed in the entire string
//.{8,}         # anything, at least eight places though
//$             # end-of-string
//(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$)
        Pattern pwdPattern = Pattern.compile("^[A-Z0-9._%-].{8,}$");
        Pattern emailPattern = Pattern.compile("^(.+)@(.+)$");
        Matcher emailMatcher = emailPattern.matcher(Email);
        Matcher pwdMatcher = pwdPattern.matcher(Password);
        Matcher pwd2Matcher = pwdPattern.matcher(Password2);
        if(pwdMatcher.find() != false && pwd2Matcher.find() != false) {
            if (emailMatcher.find() != false) {
        String Phone = request.getParameter("phoneRegister");
        if (Username != null || Password != null || Password2 != null) {
            try {
                UserDao userdao = new UserDao("fishmoley");
                String HashedPassword = userdao.hashPassword(Password);
                String HashedPassword2 = userdao.hashPassword(Password2);
                int Result = userdao.registerUser(Username, HashedPassword, HashedPassword2, Email, Phone);

                if (Result == 1) {
                    User u = new User(Username, Password);
                    HttpSession session = request.getSession();

                    session.setAttribute("login_status", "Successfully registered!");
                    forwardToJsp = "login.jsp";
                } else if (Result == -1) {
                    HttpSession session = request.getSession();

                    session.setAttribute("register_status", "Username already taken!");
                    forwardToJsp = "register.jsp";
                } else if (Result == -2) {
                    HttpSession session = request.getSession();

                    session.setAttribute("register_status", "Passwords not the same!");
                    forwardToJsp = "register.jsp";
                }
            } catch (NumberFormatException e) {
                forwardToJsp = "error.jsp";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Not logged in");
            } catch (NoSuchAlgorithmException ex) {
                forwardToJsp = "error.jsp";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "No such algorithim found!");
            }
        }
        }
            else {
                                HttpSession session = request.getSession();

                    session.setAttribute("register_status", "Email invalid!");
                    forwardToJsp = "register.jsp";
                
            }
        }
        else {
                                HttpSession session = request.getSession();

                    session.setAttribute("register_status", "Passwords invalid or no the same!");
                    forwardToJsp = "register.jsp";
        }

        return forwardToJsp;
    }
}
