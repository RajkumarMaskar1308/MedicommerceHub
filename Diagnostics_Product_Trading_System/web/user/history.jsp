<%-- 
    Document   : cart
    Created on : 7 Jan, 2023, 7:07:34 PM
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
        <title>History</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="..\css\user\cart.css" type="text/css">
         <link rel="stylesheet" href="..\css\user\history.css" type="text/css">
        
        
        
        
    </head>
    <body>
        
        <form name="logout_button" action="../logout_button" method="post">
        
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="header_div">
                <img class="image_class" src="../images/indexlogo.png">

                <div class="container-fluid" style="float:right; margin-top: 10px; border: none;">  
                    <ul class="nav navbar-nav" style="color: #072791!important;">
                        <li class=""  ><a href="product_select.jsp" style="color: #072791!important;">Home</a></li>
                        <li><a href="cart.jsp" style="color: #072791!important;">cart</a></li>
                        <li><a href="history.jsp" style="color: #072791!important;" >History</a></li> 
                        <li><a href="profile.jsp" style="color: #072791!important;">Profile</a></li>
                        <li><button class="header_button" type="submit" name="submit" value="Logout"><b>Logout</b></button></li>
                    </ul>     
                </div>     
            </div>
        </nav>
        </form>
            <br>
           
         
         <div class="maindiv">
            <div class="row">
                <div class="shopping-cart">
                     <div class="title"> My Orders </div>
                     
                     <%
                            Connection cn=null;
                            Statement st=null; 

                            HttpSession session1 = request.getSession();
                                                        
                            try
                            {
                                double totalamount=0;
                                String total1="";
                                
                                Class.forName("com.mysql.jdbc.Driver");
                                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
                                st=cn.createStatement();
                                String sql="select * from orders where user_id='"+session.getAttribute("user_id") +"' ";

                                ResultSet rs=st.executeQuery(sql);

                                while(rs.next())
                                {
                                    String order_id = rs.getString("order_id");
                                    String user_id = rs.getString("user_id");
                                    String product_id =rs.getString("product_id");   
                                    String product_name =rs.getString("product_name"); 
                                    String image = rs.getString("image"); 
                                    String total = rs.getString("total_amount");
                                    String quantity = rs.getString("qauntity");
                                    String order_date = rs.getString("order_date");
                                    String  delivery_date = rs.getString("delivery_date");
                                    String dstatus = rs.getString("dstatus");
                                    String total_amount = rs.getString("total_amount");                                  
                                   
                                    session.setAttribute("user_id",user_id);
                                    
                                    
                     %>
                     
                     <form name="history" action="../history" method="post">
                         
                         <div class="item">
                             <div class="row" style="width: 100%;">
                                
                                <div class="col-sm-2">
                                    <div class="image">
                                        <img src="../images/<%=image%>" style=" margin-top:1%;  height: 90px;  width: 90px;" alt="" />
                                        <input type="hidden" name="order_id" value="<%=order_id%>">
                                        <input type="hidden" name="product_id" value="<%=product_id%>">
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="description">
                                        <span><%=product_name%></span>          <input type="hidden" name="product_name" value="<%=product_name%>">
                                         
                                         
                                    </div>
                                </div>
                                <div class="col-sm-1">
                                    
                                    <div style="margin-top: 10px;"> Quantity
                                        <input type="text" name="quantity" value="<%=quantity%>" min="0" id="quantity" style=" border: none;" >    
                                    </div>
                                </div>
                                <div class="col-sm-1">
                                     <div  style="margin-top: 10px;">Order Date  
                                     <input disabled="true"  type="text" id="total1" name="order_date" value="<%=order_date%>" style="border: none;"></div> 
                                      
                                </div>
                                     <div class="col-sm-2">
                                     <div  style="margin-top: 10px; margin-left: 30px;">Delivery Date  
                                     <input disabled="true"  type="text" id="total1" name="delivery_date" value="<%=delivery_date%>" style="border: none;"></div> 
                                      
                                </div>
                                <div class="col-sm-1">
                                     <div  style="margin-top: 10px;">Total  
                                     <input disabled="true"  type="text" id="total1" name="status" value="<%=total_amount%>" style="border: none;"></div> 
                                      
                                </div>
                                     
                                     <div class="col-sm-1">
                                     <div  style="margin-top: 10px;">Status  
                                     <input disabled="true"  type="text" id="total1" name="status" value="<%=dstatus%>" style="border: none;"></div> 
                                      
                                </div>
                                 <div class="col-sm-2">
                                     <%
                                          if(! dstatus.equals("Delivered") && ! dstatus.equals("Cancelled"))
                                          {
                                     %>
                                      <button class="button" type="submit" name="submit" value="Cancel Order" >Cancel Order</button>
                                     <%
                                          }
                                          else
                                          {
                                      %>
                                      <button style="background-color: orange;" class="button1"   type="submit" name="submit" value="Order Again" >Order Again</button>
                                     <%   
                                          }
                                      %>
                                </div>
                             
                            </div>
                        </div>
                      
                     
                     <%
                            }
                               
                    %>
                     
                     
                     
                        
                    
                          
                    </form>
                                
                                <%
                                
                             }catch(Exception ex)
                             {
                             out.println(ex.toString());
                             } 
%>
   
        </div>  
                    
                
            </div>
              
        </div>   
          
         
               
        
    </body>
</html>
