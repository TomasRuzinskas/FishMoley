<%-- 
    Document   : specificproduct
    Created on : 14-Mar-2018, 23:23:53
    Author     : ruzinskastomas
--%>



<%@page import="Dtos.Product"%>
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
                String prodcode = request.getParameter("product_id");
                Product product = products.SpecificProducts(prodcode);
                String productname = product.getProduct_name();
                double productprice = product.getProduct_price();
                String productdetails = product.getProduct_details();
            %>
            <div class="form-group">
                <label class="control-label col-sm-2" for="email">Product Name:</label>
                <div class="col-sm-15">
                    <%=productname%>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="email">Product Price:</label>
                <div class="col-sm-15">
                    <%=productprice%>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="email">Product Details:</label>
                <div class="col-sm-10">
                    <%=productdetails%>
                </div>
            </div>
            
            

            <%
                }

            %>

    </body>


</html>