
<%@page import="java.util.ArrayList"%>
<%@page import="Dtos.Product"%>
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results of Update</title>
    </head>
    <body>
        <%
            // Get the result from the session (how many customers were updated)
            Object resultValue = session.getAttribute("numUpdated");
            // If we have a result value to use, then display it
            if (resultValue != null)
            {
                // Cast it to a number
                Integer result = (Integer) resultValue;
        %> 
        <!-- display the number of customers updated -->
        There were <%=result%> Products updated in the database.
        <br>
        <%
            // Check if there were customers updated. If so, get the list of Customers and display them
            if (result > 0)
            {
                // Get the list of updated customers
                ArrayList<Product> updatedProducts = (ArrayList<Product>) session.getAttribute("updatedProducts");
                // If there is a list of updated customers to use
                if (updatedProducts != null)
                {
                    // Deal with displaying
        %>
        <table>
            <tr>
                <th>Product Name</th>
                <th>Product price</th>
                <th>Product details</th>
                <th>Category Id</th>
                <th>Supplier Id</th>
            </tr>
            <%
                for (Product p : updatedProducts)
                {
            %>
            <!-- Create a row for this customer -->
            <tr>
                <!-- Create a cell for each component of this customer's information and fill it with 
                     data in this product's object -->
                <td><%=p.getProduct_name()%></td>
                <td><%=p.getProduct_price()%></td>
                <td><%=p.getProduct_details()%></td>
                <td><%=p.getCategory_id()%></td>
                <td><%=p.getSupplier_id()%></td>
            </tr>
            <%
                    }
                    // We have finished with the list of updated customers list 
                    // so now we can remove the value from the session
                    session.removeAttribute("updatedProducts");
                }
            %>
        </table>

        <%
            }
            // We have finished with the numUpdated value 
            // so now we can remove the value from the session
            session.removeAttribute("numUpdated");
        } else
        {
        %>
        No customer update information found.
        <%
            }
        %>
        
        <div><a href="index.jsp">Back to index</a></div>
    </body>
</html>
