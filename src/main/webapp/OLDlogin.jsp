<%@page import="java.util.ArrayList"%>
<%@page import="Dtos.User"%>
<%@page import="Daos.UserDao"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login!</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
                    UserDao userdao = new UserDao("fishmoley");
        // Get all customers from the database
        ArrayList<User> users = userdao.getAllUsers();
            // If there is a customer list to use in the session (and it's not empty)
            // Carrying out this check avoids the page breaking when the session times out
            
            if (users != null && !users.isEmpty())
            {
                for (User u: users) { %>
                <%=u.getUsername()%>
               <% }
            }
        %>
        <h1>Login:</h1>
        <form action="FrontController" method="post">
            <h2>Username:</h2> 
            <br>
            <input type="text" name="usernameLogin" required>
            <br>
            <h2>Password:</h2>
            <br>
            <input type="password" name="passwordLogin" required>
            <br>
            <input type="submit" value="Login!" />
            <input type="hidden" name="action" value="login"/>
        </form>
        <a href="index.jsp">Home</a>
    </body>
</html>
