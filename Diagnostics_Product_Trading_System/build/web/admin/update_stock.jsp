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
         
        <style><%@include file="..\css\admin\update_stock.css"%></style>
       
        
        
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
        
        
        <form name="update_stock" action="../update_stock" method="post"> 
        <div class="maindiv">
            <br>
            <div class="col-sm-6" >
                     <div class="row">
                         <div class="col-sm-1"></div>
                         <div class="col-sm-3"><h5 class="h"><b>Product ID :</b> </h5></div>
                        <div class="col-sm-5"><input class="textbox" type="text" name="product_id" placeholder="Enter ID here"></div>
                     </div>
                    
                    
                    <div class="row">
                         <div class="col-sm-1"></div>
                         <div class="col-sm-3"><h3 class="h"><b>Product Name :</b></h3></div>
                        <div class="col-sm-5"><input class="textbox" type="text" name="product_name" placeholder="Enter Product Name"></div>
                     </div>
                    
                    
                    <div class="row">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-3"><h3 class="h"><b>Quantity</b></h3></div>
                        <div class="col-sm-5"><input class="textbox" type="text" name="quantity" placeholder="Enter Quantity"></div>
                     </div>
                    
                    </div>
                    
              <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-3"><input class="buttonclass" type="submit"  name="submit" value="Delete"></div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-3"><input  class="buttonclass"  type="submit"name="submit" value="Update"></div>
                   </div>
                    
                    
                    
                 </div>
        </div>
            
 <div id="wrapper" style="height: 100%; width: 90%;">
  <h1></h1>
   
  <table id="keywords" cellspacing="0" cellpadding="0" style="width: 100%;">
    <thead>
      <tr>
        <th><span><b>Product ID</b></span></th>
        <th><span><b>Product Name</b></span></th> 
        <th><span><b>Manufactured Date</b></span></th> 
        <th><span><b>Quantity</b></span></th>
        <th><span><b>Expiry Date</b></span></th>
        <th><span><b>MRP</b></span></th>
        <th><span><b>GST</b></span></th>
        <th><span><b>Offer Price</b></span></th> 
        
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
                                String sql="select * from add_product";

                                ResultSet rs=st.executeQuery(sql);

                                while(rs.next())
                                {
                                    String product_id = rs.getString("product_id"); 
                                    String product_name =rs.getString("product_name");   
                                    String manufactured_date =rs.getString("manufactured_date");
                                    String product_category =rs.getString("product_category");
                                    String expire_date = rs.getString("expire_date");
                                    String mrp = rs.getString("mrp");
                                    String gst = rs.getString("gst");
                                    String offer_price = rs.getString("offer_price");
                                    String quantity = rs.getString("quantity");

      %>  
        
        
      <tr>
        <td><%=product_id%></td>
        <td><%=product_name%></td>
        <td><%=manufactured_date%></td>
        <td><%=quantity%></td>
        <td><%=expire_date%></td>
        <td><%=mrp%></td>
        <td><%=gst%></td>
        <td><%=offer_price%></td>
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

         
        </form>
        
    </body>
</html>
