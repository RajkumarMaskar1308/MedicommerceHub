<%-- 
    Document   : user_login
    Created on : 5 Jan, 2023, 10:36:41 PM
    Author     : prath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="css\user_login.css" type="text/css">
    </head>
    <body>
        
        <form name="user_login" action="user_login" method="post">  
            
         <div class="header_div">
            <img class="image_class" src="images/indexlogo.png">
            <button class="header_button" type="submit" name="submit" value="Back"><b>Back</b></button>
        </div>
        
        <div class="maindiv">
            <div class="logo1">
                <div class="imglogo">
                    <img src="images/signup_logo.png" style=" margin-left: 42%;  margin-top:3%;  height: 20%;  width: 15%;">
                </div>
            </div>            
            <div class="logo1"></div>
            
                      
            <div class="row">
                 
                <input class="textbox" type="text" placeholder="Email" name="email">
                    <br>
                    <input class="textbox" type="password" placeholder="Password" name="password">
                    <br>
                     
                    <div>
                        <button class="button" type="submit" name="submit" value="submit"><b>Login</b></button>
                    </div>
                    <br>
                    
                    <div class="col-sm-6"><a class="acnchor" href="user_forgot_password.jsp">Forgot your password</a></div>
                    <div class="col-sm-6">
                         
                         <a class="acnchor1" href="user_signup.jsp"> Signup as User</a>
                    </div>
                                         
                    
                     <div class="space"></div>
             </div>
            
        </div>
        </form>
        
        
    </body>
</html>
