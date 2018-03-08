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
}
