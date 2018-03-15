<%-- 
    Document   : updateP
    Created on : 15-Mar-2018, 10:01:27
    Author     : D00185666
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
!DOCTYPE html>
<html lang="en">
    <head>
        <title>Fishmoley Store</title>
        <%@include file="includes/styleandscripts.jsp" %>
    </head>
    <body>

        <div class="jumbotron">
            <div class="container text-center">
                <h1>Fish Moley Store</h1>      
            </div>
        </div>
<%@include file="includes/nav.jsp" %>
     <p>Update Product</p>
            <form action="FrontController" method="post">
                <table>
                     <tr>
                        <td> Product id  : </td><td> <input name="product_id" size=30 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Product name  : </td><td> <input name="product_name" size=30 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> product price  : </td><td> <input name="product_price" size=15 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Product details  : </td><td> <input name="product_details" size=30 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Category id  : </td><td> <input name="category_id" size=30 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> supplier id  : </td><td> <input name="supplier_id" size=30 type="text" /> </td> 
                    </tr>
                </table>
                <input type="submit" value="Update" />
                <!-- Include a hidden field to identify what the user wants to do -->
                <input type="hidden" name ="action" value="update" />
            </form>
