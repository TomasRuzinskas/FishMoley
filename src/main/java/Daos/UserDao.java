/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.User;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author d00186050
 */
public class UserDao extends Dao {

    public UserDao(String Database) {
        super(Database);
    }

    public String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256"); // MD2, MD5, SHA-1, SHA-224, SHA-256, SHA-384, SHA-512
        md.update(password.getBytes());
        byte[] b = md.digest();
        StringBuffer sb = new StringBuffer();
        for (byte b1 : b) {
            sb.append(Integer.toHexString(b1 & 0xff).toString());
        }
        return sb.toString();
    }

    public ArrayList<User> getAllUsers() {
        ArrayList<User> customers = new ArrayList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Get a connection to the database
            conn = getConnection();

            // Set up the SQL and compile it for the database
            String query = "Select * from users";
            ps = conn.prepareStatement(query);

            //Run query and get results
            rs = ps.executeQuery();

            // Load next result from resultset and process it
            while (rs.next()) {
                User u = new User();

                u.setUsername(rs.getString("username"));

                customers.add(u);
            }
        } catch (SQLException e) {
            System.out.println("An exception occurred in the getAllCustomers(): " + e.getMessage());
        } finally {
            // Close resultset
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("An exception occurred when closing the ResultSet of the getAllCustomers(): " + e.getMessage());
            }
            // Close prepared statement
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println("An exception occurred when closing the PreparedStatement of the getAllCustomers(): " + e.getMessage());
            }
            // Close connection
            freeConnection(conn);
        }
        return customers;
    }

    public int Login(String username, String password) {
        ArrayList<User> users = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int loggedin = 0;
        try {
            conn = getConnection();

            String query = "SELECT * FROM users";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();

                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("user_password"));
                u.setAdmin_status(rs.getInt("admin_status"));

                users.add(u);
            }
            User logginin = new User(username, password);
            for (int i = 0; i < users.size(); i++) {
                if (users.get(i).equals(logginin)) {
                    if (users.get(i).getAdmin_status() == 1) {
                        loggedin = 2;
                    } else {
                        loggedin = 1;
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("An error occured when logging in");
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println("An error occured when logging in");
            }
            freeConnection(conn);
        }
        return loggedin;
    }

    public int registerUser(String username, String password, String password2, String email, String phone) {
        ArrayList<User> users = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String usernamefromquery = "";
        int registered = 0;
        int rowsAffected = 0;
        try {
            conn = getConnection();
            String query = "SELECT * FROM users WHERE username = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                usernamefromquery = rs.getString("username");
            }
            if (!username.equals(usernamefromquery)) {
                if (password.equals(password2)) {
                    String query2 = "INSERT INTO users(user_id, username, user_password, user_email, user_phone, admin_status) VALUES (NULL,?,?,?,?,0)";
                    ps = conn.prepareStatement(query2);
                    ps.setString(1, username);
                    ps.setString(2, password);
                    ps.setString(3, email);
                    ps.setString(4, phone);
                    rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        registered = 1;
                    }
                } else {
                    registered = -2;
                }
            } else {
                registered = -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("An exception occurred when closing the ResultSet of the getAllCustomers(): " + e.getMessage());
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println("An exception occurred when closing the PreparedStatement of the getAllCustomers(): " + e.getMessage());
            }
            freeConnection(conn);
        }
        return registered;
    }

    public User findEmailByUsername(String uname) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;
        
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM users WHERE username = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            rs = ps.executeQuery();
            
            if(rs.next()){
                String username = rs.getString("username");
                String userEmail = rs.getString("user_email");
                int userPhone = rs.getInt("user_phone");
                u = new User(username,userEmail);
            }
        }
        catch (SQLException e) { 
        
            System.err.println("\tA problem occurred during the findEmailByUsername method:");
            System.err.println("\t"+e.getMessage());
        }
        finally {
            try {
                if (rs != null) 
                {
                    rs.close();
                }
                if (ps != null) 
                {
                    ps.close();
                }
                if (con != null) 
                {
                    freeConnection(con);
                }
            } 
              catch (SQLException e) 
            {
                System.err.println("A problem occurred when closing down the findEmailByUsername method:\n" + e.getMessage());
            }
        }

        return u;
    }
    public User findPhoneByUsername(String uname) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = new User();
        
        try {
            con = this.getConnection();
            
            String query = "SELECT * FROM users WHERE username = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            rs = ps.executeQuery();
            
            if(rs.next()){
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("user_email"));
                u.setPhone(rs.getString("user_phone"));
                
            }
        }
        catch (SQLException e) { 
        
            System.err.println("\tA problem occurred during the findPhoneByUsername method:");
            System.err.println("\t"+e.getMessage());
        }
        finally {
            try {
                if (rs != null) 
                {
                    rs.close();
                }
                if (ps != null) 
                {
                    ps.close();
                }
                if (con != null) 
                {
                    freeConnection(con);
                }
            } 
              catch (SQLException e) 
            {
                System.err.println("A problem occurred when closing down the findPhoneByUser method:\n" + e.getMessage());
            }
        }

        return u;
    }
}
