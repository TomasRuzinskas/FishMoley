
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<!DOCTYPE html>
<html>
    <head>
 <%@include file="includes/styleandscripts.jsp" %>
        <title>Register</title>
    </head>
    <body>
        <div class="jumbotron">
            <div class="container text-center">
                <h1>Fish Moley Store</h1>      
            </div>
        </div>
        <%@include file="includes/nav.jsp" %>
        <div>         

           

                <div class="container">
                    <h2>Register</h2>
                    <form class="form-horizontal" action="FrontController" method="post">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Username:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="fname" placeholder="Enter Username" name="usernameRegister" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Email:</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email" placeholder="Enter email" name="emailRegister" required>
                            </div>
                        </div>
       
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Phone:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="username" placeholder="Enter Phone Number" name="phoneRegister" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="pwd">Password:</label>
                            <div class="col-sm-10">          
                                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="passwordRegister1" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="pwd">Re-enter Password:</label>
                            <div class="col-sm-10">          
                                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="passwordRegister2" required>
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Address line 1:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="address1" placeholder="Enter Address" name="address1Register" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Address line 2(Optional):</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="address2" placeholder="Enter Address" name="address2Register">
                            </div>
                        </div>

                        <div class="form-group">        
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Submit</button>
                                <input type="hidden" name="action" value="register"/>
                            </div>
                        </div>
                    </form>
                </div>
        </div>
         
        <div class="form-group">
            <label class="control-label col-sm-2" for="pwd">                <%
            Object obj = session.getAttribute("register_status");
            String registerstatus = (String) obj;
            if (registerstatus != null) {
                %>
                <%=registerstatus%>
                <%
            }
        %></label>
    </body>


</html>
