<%-- 
    Document   : loginform
    Created on : 2 Δεκ 2014, 11:02:00 πμ
    Author     : Nikos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    </head>
    <body>
        <h1>Business login</h1>
        <form name="LoginForm" action="management.xhtml" method="POST">
        <table border="0">
           <tbody>
                <tr>
                    <td>Username:</td>
                    <td> <input type="text" name="username" value="" /> </td> <br />
                </tr>
                <tr>
                    <td>Password:</td>
                    <td> <input type="password" name="password" value="" /></td> <br />
                </tr>
                <tr>
                    <td> <input type="submit" align="center" name="submitbutton" value="Login" /></td>
                </tr>
            </tbody>
            </form>
            
            
            
            
            
        </table>
        
        
        
        
        
        
        
    </body>
</html>
