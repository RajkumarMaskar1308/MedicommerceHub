<%-- 
    Document   : index
    Created on : 5 Jan, 2023, 7:54:46 PM
    Author     : prath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Diagnostic's Product Trading</title>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="css\index.css" type="text/css">
    </head>
       
    
    <body>
        <div class="header_div">
            <img class="image_class" src="images/indexlogo.png"> 
        </div>
        <br>    
        <div class="maindiv">
            <div class="logo1">
                <div class="imglogo">
                    <img src="images/signup_logo.png" style=" margin-left: 42%;  margin-top:3%;  height: 20%;  width: 15%;">
                </div>
                        
            <div class="logo1"></div>
            
            <form name="index" action="index" method="post">          
                <div class="row">
                    <div class="col-sm-6">
                        <button class="button" type="submit" name="submit" value="Admin"><b>Admin</b></button>
                    </div>
                    <div class="col-sm-6"> 
                        <button class="button" type="submit" name="submit" value="User"><b>User</b></button>
                    </div>

                    <div class="space"></div><div class="space"></div>
                 </div>
            </form>
        </div>
        </div>
        
    </body>
</html>
