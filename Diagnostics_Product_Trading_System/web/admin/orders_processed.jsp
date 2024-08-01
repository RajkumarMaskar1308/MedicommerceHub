<%-- 
    Document   : orders_processed
    Created on : 4 Feb, 2023, 7:35:50 PM
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="..\css\admin\customer.css" type="text/css">
        <style><%@include file="..\css\admin\customer_history.css"%></style>
    </head>
    <body>
        <form name="admin_index" action="../admin_index" method="post">
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
        <br>    
        
        <div class="maindiv">
            
            <div id="wrapper" style="height: 100%; width: 100%;">
  <h1></h1>
  
  <table id="keywords" cellspacing="0" cellpadding="0" style="width: 100%;" >
    <thead>
      <tr>
        <th><span><b>Order ID</b></span></th>
        <th><span><b>Customer ID</b></span></th>
        <th><span><b>Product ID</b></span></th>
        <th><span><b>Product Name</b></span></th>
        <th><span><b>Order Date</b></span></th>
        <th><span><b>Delivery Date</b></span></th>
        <th><span><b>Quantity</b></span></th>
        <th><span><b>Total</b></span></th>
        <th><span><b>Status</b></span></th>
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
                                String sql="select * from orders where dstatus='Confirmed' || dstatus='Dispatched' ";

                                ResultSet rs=st.executeQuery(sql);

                                while(rs.next())
                                {
                                    String order_id = rs.getString("order_id"); 
                                    String user_id =rs.getString("user_id");   
                                    String product_id =rs.getString("product_id");
                                    String product_name =rs.getString("product_name");
                                    String order_date = rs.getString("order_date");
                                    String delivery_date = rs.getString("delivery_date");
                                    String qauntity = rs.getString("qauntity");
                                    String total_amount = rs.getString("total_amount");
                                    String dstatus = rs.getString("dstatus");

      %>  
        
        
      <tr>
    <form name="orders_processed" action="../orders_processed" method="post">
        <td><%=order_id%></td> <input type="hidden" name="order_id" value="<%=order_id%>">
        <td><%=user_id%></td>
        <td><%=product_id%></td>
        <td><%=product_name%></td>
        <td><%=order_date%></td>
        <td><%=delivery_date%></td>
        <td><%=qauntity%></td>
        <td><%=total_amount%></td>
        <td><%=dstatus%></td>
        <td><input class="buttonclass" style="width: 120px;" type="submit" name="submit" value="Change Status"></td>
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
        
        
        </form>
    </body>
</html>
