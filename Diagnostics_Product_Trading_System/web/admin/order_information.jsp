<%-- 
    Document   : product_information
    Created on : 7 Jan, 2023, 1:37:58 PM
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
        <title>Order Information</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="..\css\user\product_information.css" type="text/css">
        
        
    </head>
    
    <body>
        
        <form name="logout_button" action="../logout_button" method="post">
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
         
             
             <%
                    Connection cn=null;
                    Statement st=null; 
                    
                            String order_id = "";
                            String user_id = "";
                            String product_id="";
                            String image="";
                            String product_name="";
                            String order_date="";
                            String delivery_date="";
                            String qauntity = "";
                            String total_amount ="";
                            String dstatus="";  
                                
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
                        st=cn.createStatement();
                        String sql="select * from orders where order_id ='"+session.getAttribute("order_id") +"'  ";
       
                        ResultSet rs=st.executeQuery(sql);
                        
                            
                         
                        while(rs.next())
                        {
                              order_id =rs.getString("order_id");   
                              user_id =rs.getString("user_id");
                              product_id =rs.getString("product_id");
                              image = rs.getString("image");
                              product_name = rs.getString("product_name");
                              order_date = rs.getString("order_date");
                              delivery_date =rs.getString("delivery_date");   
                              qauntity =rs.getString("qauntity");
                              total_amount =rs.getString("total_amount");
                              dstatus = rs.getString("dstatus");  

                         }
                     %>
             <form name="order_information" action="../order_information" method="post">
            <div class="row">
                <div class="col-sm-3" style="margin-top: 10%;">
                  <div class="imglogo">
                      <img src="../images/<%=image%>" style=" margin-left:12%;  margin-top:3%;  height:80%;  width: 70%;">
                      <input class=" " type="hidden" name="image" value="<%=image%>">
                      <input class=" " type="hidden" name="order_id" value="<%=order_id%>">
                  </div> <br>
                      
                </div>
                 
                <div class="col-sm-8">
                  
                <div class="row" style=" margin-top: 3%;">
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Order ID</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=order_id%></h1>
                        <input class=" " type="hidden" name="product_name" value="<%=order_id%>"> 
                    </div>
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Customer ID</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=user_id%></h1>
                        <input class=" " type="hidden" name="manufacturer" value="<%=user_id%>"> 

                    </div> 
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Product ID</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=product_id%></h1>
                        <input class=" " type="hidden" name="manufactured_date" value="<%=product_id%>"> 
                    </div>  
                    
               </div>
              
               
               <div class="row" style=" margin-top: 3%;">
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Product Name</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=product_name%></h1>
                        <input class=" " type="hidden" name="type" value="<%=product_name%>"> 
                    </div>
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Quantity</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=qauntity%></h1>
                        <input class=" " type="hidden" name="product_category" value="<%=qauntity%>"> 

                    </div> 
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Total Amount</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=total_amount%></h1>
                        <input class=" " type="hidden" name="expire_date" value="<%=total_amount%>"> 
                    </div>  
                    
               </div>
               
                <div class="row" style=" margin-top: 3%;">
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Order Date</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=order_date%></h1>
                        <input class=" " id="mrp" type="hidden" name="mrp" value="<%=order_date%>"> 
                    </div>
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Delivery Date</h3>  
                        <input style="height: 40px; width: 150px; margin-left: 10px; border: none;" id="gst" type="date" name="delivery_date" value="<%=delivery_date%>"> 

                    </div> 
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Status</h3>  
                        <select name="dstatus" style="height: 40px; width: 150px; margin-left: 10px; border: none;" >
                            <option>Pending</option>
                            <option>Confirmed</option>
                            <option>Dispatched</option>
                            <option>Delivered</option>
                        </select>
                         
                    </div>  
                    
               </div>
                    
<!--               <div class="row" style=" margin-top: 3%;">
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Total</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"></h1>
                        <input disabled="true" type="text" id="total1" name="total1" value="0" style="font-size:25px; margin-left: 5%; border: none;">
                        <input type="hidden" id="total" name="total" value="">
                    </div>
                      
               </div>-->
                   
               <div class="row" style="margin-top: 3%;">
                    <div class="col-sm-4">
                        <button class="button1" type="submit" name="submit" value="submitdata">Submit Data</button>
                    </div>  
               </div>  
                     
            </div>
             
                    
 
                
            </div>
                         </form>
                  
                  <%
                    }catch(Exception ex)
                     {
                         out.println(ex.toString());
                     }
             %>
                  
                   
            
            <br><br>
            
        
        </div>   
          
         
        
        
        
    </body>
</html>
