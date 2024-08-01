 <%-- 
    Document   : update_stock
    Created on : 12 Jan, 2023, 10:06:14 PM
    Author     : prath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Stock</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css"> 
       <style><%@include file="..\css\admin\customer_history.css"%></style>
        
        
    </head>
    <body>
        <form name="logout_button" action="../logout_button" method="post" >
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="header_div">
            <img class="image_class" src="../images/indexlogo.png">
            
            <div class="container-fluid" style="float:right; margin-top: 10px; border: none;">
                  
                <ul class="nav navbar-nav" style="color: #072791!important;">
                    <li class=""  ><a href="admin_index.jsp" style="color: #072791!important;">Home</a></li>
                    <li><a href="add_product.jsp" style="color: #072791!important;" >Add Product</a></li>
                    <li><a href="update_stock.jsp" style="color: #072791!important;">View Stock</a></li>
                    <li><a href="orders_received.jsp" style="color: #072791!important;">Orders Received</a></li>
                    <li><a href="orders_processed.jsp" style="color: #072791!important;">Orders Processed</a></li>
                    <li><a href="orders_delivered.jsp" style="color: #072791!important;">Orders Delivered</a></li>
                    <li><a href="customer_history.jsp" style="color: #072791!important;">Customer History</a></li>
                    <li><a href="reports.jsp" style="color: #072791!important;">Reports</a></li>
                    <li><button class="header_button" type="submit" name="submit" value="Logout"><b>Logout</b></button></li>
                </ul>
                
            </div>
            
          </div>
                
        </nav>
       </form>
        
        
        
        <div class="maindiv">
           
          
            <div id="wrapper" style="height: 100%; width: 100%;">
  <h1></h1>
  
  <table id="keywords" cellspacing="0" cellpadding="0" style="width: 100%;" >
    <thead>
      <tr>
        <th><span><b>Customer ID</b></span></th>
        <th><span><b>Email</b></span></th>
        <th><span><b>First Name</b></span></th>
        <th><span><b>Last Name</b></span></th>
        <th><span><b>City</b></span></th>
        <th><span><b>State</b></span></th>
        <th><span><b>Pincode</b></span></th>
        <th><span><b>Contact</b></span></th>
        <th> </th>
      </tr>
    </thead>
    
    <tbody>
        
      <%
            Connection cn = null;
            Statement st = null;
           
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver");
                                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
                                st=cn.createStatement();
                                String sql="select * from user_signup";

                                ResultSet rs=st.executeQuery(sql);

                                while(rs.next())
                                {
                                    String user_id = rs.getString("user_id"); 
                                    String email =rs.getString("email");   
                                    String first_name =rs.getString("first_name");
                                    String last_name =rs.getString("last_name");
                                    String city = rs.getString("city");
                                    String state = rs.getString("state");
                                    String contact = rs.getString("contact_no");
                                    String pincode = rs.getString("pincode");

      %>  
        
        
      <tr>
    <form name="customer_history" action="../customer_history" method="post">
        <td><%=user_id%></td> <input type="hidden" name="user_id" value="<%=user_id%>">
        <td><%=email%></td>
        <td><%=first_name%></td>
        <td><%=last_name%></td>
        <td><%=city%></td>
        <td><%=state%></td>
        <td><%=pincode%></td>
        <td><%=contact%></td>
        <td><input class="buttonclass" type="submit" name="submit" value="Delete"></td>
    </form>
      </tr>
      
      
      <%
      
                                  }
                                   }
                                   catch(Exception ex)
                                     {
                                                               
                                   
                                     }
 
      %>
       
    </tbody>
  </table>
 </div> 

            
                    
        </div> 
        
        
        
    </body>
</html>
