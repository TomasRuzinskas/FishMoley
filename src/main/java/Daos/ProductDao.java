/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author d00186050
 */
public class ProductDao extends Dao {

    public ProductDao(String databaseName) {
        super(databaseName);
    }

    public ArrayList<Product> AllProducts() {
        ArrayList<Product> products = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();

            String query = "SELECT * FROM products";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();

                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_price(rs.getDouble("product_price"));
                p.setProduct_details(rs.getString("product_details"));
                p.setCategory_id(rs.getInt("category_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));

                products.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("An exception occurred when closing the ResultSet of the getAllProducts(): " + e.getMessage());
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println("An exception occurred when closing the PreparedStatement of the getAllProducts(): " + e.getMessage());
            }
            freeConnection(conn);
        }
        return products;
    }

    public Product SpecificProducts(String id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Product p = new Product();
        try {
            conn = getConnection();

            String query = "SELECT * FROM products WHERE product_id=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {

                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_price(rs.getDouble("product_price"));
                p.setProduct_details(rs.getString("product_details"));
                p.setCategory_id(rs.getInt("category_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("An exception occurred when closing the ResultSet of the SpecificProduct(): " + e.getMessage());
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println("An exception occurred when closing the PreparedStatement of the SpecificProduct(): " + e.getMessage());
            }
            freeConnection(conn);
        }
        return p;
    }
    //   public int addProductToBasket(int id) {

    //   }
    public int addProduct(int product_id, String product_name, double product_price, String product_details, int category_id, int supplier_id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        // ArrayList<Product> products = new ArrayList();
        int added = 0;
        int rowsAffected = 0;

        try {

            con = this.getConnection();

            String query = ("INSERT INTO products(product_id, product_name, product_price, product_details, category_id, supplier_id) VALUES (?,?,?,?,?,?)");

            ps = con.prepareStatement(query);
            ps.setInt(1, product_id);
            ps.setString(2, product_name);
            ps.setDouble(3, product_price);
            ps.setString(4, product_details);
            ps.setInt(5, category_id);
            ps.setInt(6, supplier_id);
            rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                added = 1;
            } else {
                added = 0;
            }

        } catch (SQLException se) {
            System.out.println("SQL Exception occurred: " + se.getMessage());
            se.printStackTrace();
        } catch (Exception e) {
            System.out.println("Exception occurred: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close the result set, statement and the connection
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    System.out.println("Exception occurred when attempting to close ResultSet: " + ex.getMessage());
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Exception occurred when attempting to close the PreparedStatement: " + ex.getMessage());
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    System.out.println("Exception occurred when attempting to close the Connection: " + ex.getMessage());
                }
            }
        }
        return added;
    }

    public int updateProducts(String product_name, double product_price, String product_details, int category_id, int supplier_id, int product_id) {
        Connection conn = null;
        PreparedStatement ps = null;
        int rowsUpdated = 0;

        try {
            // Get a connection to the database
            conn = this.getConnection();

            // Set up the SQL and compile it for the database
            String query = "update products set product_name =  ? , product_price = ? , product_details =  ? , category_id =  ? , supplier_id =  ? where product_id = ?";
            ps = conn.prepareStatement(query);

            // Fill in the blanks/parameters (?s)
            ps.setString(1, product_name);
            ps.setDouble(2, product_price);
            ps.setString(3, product_details);
            ps.setInt(4, category_id);
            ps.setInt(5, supplier_id);
            ps.setInt(6, product_id);

            // Run SQL on database and get result
            rowsUpdated = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("An exception occurred in the updateProducts(): " + e.getMessage());
        } finally {
            // Close prepared statement
            try {
                ps.close();
            } catch (SQLException e) {
                System.out.println("An exception occurred when closing the PreparedStatement of the updateCustomerCreditLimit(): " + e.getMessage());
            }
            // Close connection
            freeConnection(conn);
        }

        // Return whether or not customers were updated
        return rowsUpdated;
    }

    public ArrayList<Product> getProductsByName(String name) {
        ArrayList<Product> products = new ArrayList();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Get a connection to the database
            conn = getConnection();

            // Set up the SQL and compile it for the database
            String query = "Select * from products where product_name = ?";
            ps = conn.prepareStatement(query);

            // Fill in the blank/parameter (?s)
            ps.setString(1, name);

            //Run query and get results
            rs = ps.executeQuery();

            // Load next result from resultset and process it
            while (rs.next()) {
                Product p = new Product();

                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_price(rs.getInt("product_price"));
                p.setProduct_details(rs.getString("product_details"));
                p.setCategory_id(rs.getInt("category_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));

                products.add(p);
            }
        } catch (SQLException e) {
            System.out.println("An exception occurred in the getCustomersByName(): " + e.getMessage());
        } finally {
            // Close resultset
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("An exception occurred when closing the ResultSet of the getCustomersByName(): " + e.getMessage());
            }
            // Close prepared statement
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println("An exception occurred when closing the PreparedStatement of the getCustomersByName(): " + e.getMessage());
            }
            // Close connection
            freeConnection(conn);
        }

        // Return results
        return products;
    }
}
