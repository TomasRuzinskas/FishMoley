<%-- 
    Document   : Register
    Created on : 08-Feb-2018, 08:49:01
    Author     : d00186050
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>New to the site? Register:</h1>
        <form action="FrontController" method="post">
            <h2>Username:</h2>
            <br>
            <input type="text" name="usernameRegister" required>
            <br>
            <h2>Password:</h2>
            <br>
            <input type="password" name="passwordRegister1" required>
            <br>
            <h2>Re-type Password:</h2>
            <br>
            <input type="password" name="passwordRegister2" required>
            <br>
            <h2>Email:</h2>
            <br>
            <input type="text" name="emailRegister" required>
            <br>
            <h2>Phone:</h2>
            <br>
            <input type="text" name="phoneRegister" required>
            <br>
            <input type="submit" value="Register!" />
            <input type="hidden" name="action" value="register"/>
        </form>
        <%
            Object obj = session.getAttribute("register_status");
            String registerstatus = (String) obj;
            if (registerstatus != null) {
                %>
                <%=registerstatus%>
                <%
            }
        %>
    </body>
    <a href="index.jsp">Home</a>
</html>
