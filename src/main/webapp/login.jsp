
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<!DOCTYPE html>
<html>
    <head>
<%@include file="includes/styleandscripts.jsp" %>
        <title>Login</title>
    </head>
    <body>
        <div class="jumbotron">
            <div class="container text-center">
                <h1>Fish Moley Store</h1>      
            </div>
        </div>

        <%@include file="includes/nav.jsp" %>
        <div>         

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

                <div class="container">
                    <h2>Login</h2>
                    <form class="form-horizontal" action="FrontController" method="post">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Username:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="username" placeholder="Enter username" name="usernameLogin" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="pwd">Password:</label>
                            <div class="col-sm-10">          
                                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="passwordLogin" required>
                            </div>
                        </div> 

                        <div class="form-group">  
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Submit</button>
                                <input type="hidden" name="action" value="login"/>
                            </div>
                        </div>
                    </form>
                    <a href="#">Forgot Password?</a>
                </div>

                </form>
            </div>
            <%
                // Get the error message variable out of the session
                Object msg = session.getAttribute("loggedin_status");
                // Cast it to a String so we can use it
                String loggedin = (String) msg;
                // Display the message
                if (loggedin != null) {
            %> 

            <div> <%=loggedin%> </div>

            <% }%>

    </body>


</html>
