<%-- 
    Document   : allProducts
    Created on : 08-Mar-2018, 12:38:49
    Author     : d00186050
--%>


<%@page import="Daos.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/styleandscripts.jsp" %>
        <title>Products</title>
    </head>
    <body>
        <div class="jumbotron">
            <div class="container text-center">
                <h1>Fish Moley Store</h1>      
            </div>
        </div>

        <%@include file="includes/nav.jsp" %>
        <div>         

            <%
                ProductDao products = new ProductDao("fishmoley");
                int productid = 0;
                String productname = null;
                int i = 0;
                while (i < products.AllProducts().size()) {
                    productid = products.AllProducts().get(i).getProduct_id();
                    productname = products.AllProducts().get(i).getProduct_name();
                    i++;
                    
            %>
            <div class="form-group">
                <label class="control-label col-sm-2" for="email">Product Name:</label>
                <div class="col-sm-15">
                    <a href="specificproduct.jsp?product_id=<%=productid%>"><%=productname%></a><br>
                </div>
            </div>

            <%
                }

            %>

    </body>


</html>

