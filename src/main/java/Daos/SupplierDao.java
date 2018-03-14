/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Supplier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ruzinskastomas
 */
public class SupplierDao extends Dao{

    public SupplierDao(String databaseName) {
        super(databaseName);
    }
       public ArrayList<Supplier> AllSuppliers() {
        ArrayList<Supplier> suppliers = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = getConnection();

            String query = "SELECT * FROM suppliers";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Supplier s = new Supplier();

                s.setId(rs.getInt("supplier_id"));
                s.setSupplier_name(rs.getString("supplier_name"));

                suppliers.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
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
        return suppliers;
    }
}
