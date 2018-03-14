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
import Dtos.Category;
import java.sql.SQLException;

/**
 *
 * @author d00186050
 */
public class ProductDao extends Dao{

    public ProductDao(String databaseName) {
        super(databaseName);
    }
    public ArrayList<Category> AllCategories() {
        ArrayList<Category> categories = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            
            String query = "SELECT * FROM category";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Category c = new Category();
                
                c.setCategory_id(rs.getInt("category_id"));
                c.setCategory_name(rs.getString("category_name"));
                
                categories.add(c);
            }
        }
        catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        finally
        {
            try{
                if(rs != null)
                {
                    rs.close();
                }
            }
            catch(SQLException e)
            {
                System.out.println("An exception occurred when closing the ResultSet of the getAllCustomers(): " + e.getMessage());
            }
            try{
                if(ps != null)
                {
                    ps.close();
                }
            }
            catch(SQLException e)
            {
                System.out.println("An exception occurred when closing the PreparedStatement of the getAllCustomers(): " + e.getMessage());
            }
            freeConnection(conn);
        }
        return categories;
    }
    
     public ArrayList<Product> addProduct(){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Product> products = new ArrayList();
        int added = 0;
        int rowsAffected = 0;
        
        try {
            con = this.getConnection();
            
      ps = con.prepareStatement ("INSERT INTO products(product_id, product_name, product_price, product_details category_id, supplier_id) VALUES (NULL,?,?,?,?,?)" );
      rs = ps.executeQuery() ;
            
            while(rs.next()){
                Product p = new Product();
                p.setString(1, product_name );
                p.setInt(2, product_price);
                p.setProduct_details(rs.getString("product_details"));
                p.setCategory_id(rs.getInt("category_id"));
                p.setSupplier_id(rs.getInt("supplier_id"));
                
                products.add(p);
            }
        }
        catch( SQLException se )
        {
            System.out.println( "SQL Exception occurred: " + se.getMessage() );
            se.printStackTrace();
        }
        catch( Exception e )
        {
            System.out.println("Exception occurred: " + e.getMessage());
            e.printStackTrace();
        }
        finally
        {
            // Close the result set, statement and the connection
            if(rs!= null)
            {
                try
                {
                    rs.close() ;
                } 
                catch (SQLException ex){
                    System.out.println("Exception occurred when attempting to close ResultSet: " + ex.getMessage());
                }
            }
            if(ps != null)
            {
                try{
                    ps.close() ;
                } 
                catch (SQLException ex){
                    System.out.println("Exception occurred when attempting to close the PreparedStatement: " + ex.getMessage());
                }
            }
            if(con != null)
            {
                try{
                    con.close() ;
                } 
                catch (SQLException ex){
                    System.out.println("Exception occurred when attempting to close the Connection: " + ex.getMessage());
                }
            }
        }
        return products;
    }
}
