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
        <title>Cart</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="..\css\user\cart.css" type="text/css">
        
        
        
        
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
                     <div class="title"> Shopping Bag </div>
                     
                     <%
                            Connection cn=null;
                            Statement st=null; 

                            HttpSession session1 = request.getSession();
                            int var = 0;
                                                        
                            try
                            {
                                double totalamount=0;
                                String total1="";
                                
                                Class.forName("com.mysql.jdbc.Driver");
                                cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
                                st=cn.createStatement();
                                String sql="select * from cart where user_id= '"+session.getAttribute("user_id").toString() +"' ";

                                ResultSet rs=st.executeQuery(sql);

                                while(rs.next())
                                {
                                    String cart_id = rs.getString("cart_id");
                                    String user_id = rs.getString("user_id");
                                    String product_id =rs.getString("product_id");   
                                    String product_name =rs.getString("product_name");
                                    String manufacturer =rs.getString("manufacturer");
                                    String manufactured_date = rs.getString("manufactured_date");
                                    String type = rs.getString("type");
                                    String product_category = rs.getString("product_category");
                                    String expire_date =rs.getString("expire_date");   
                                    String mrp =rs.getString("mrp");
                                    String gst =rs.getString("gst");
                                    String offer_price = rs.getString("offer_price");
                                    String image = rs.getString("image"); 
                                    String total = rs.getString("total");
                                    String quantity = rs.getString("quantity");
                                    
                                    
                                    totalamount += Double.parseDouble(total);
                                   
                                    session.setAttribute("user_id",user_id);
                                    var++;
                                    
                                    
                     %>
                     
                     <form name="cart" action="../cart" method="post">
                         <form name="cart1" action="../cart1" method="post">
                         <div class="item">
                             <div class="row" style="width: 100%;">
                                 <div class="col-sm-1"> <div class="buttons"><button type="submit" name="submit" value="remove" style=" border: none; background-color: white;"><img style="height: 20px; width: 20px;" src="../images/remove.png"></button></div> </div>
                                <div class="col-sm-2">
                                    <div class="image">
                                        <img src="../images/<%=image%>" style=" margin-top:1%;  height: 90px;  width: 90px;" alt="" />
                                        <input type="hidden" name="image" value="<%=image%>">
                                        <input type="hidden" name="cart_id" value="<%=cart_id%>">
                                        <input type="hidden" name="user_id" value="<%=user_id%>">
                                        <input type="hidden" name="product_id" value="<%=product_id%>">
                                        <input type="hidden" name="manufacturer" value="<%=manufacturer%>">
                                        <input type="hidden" name="manufactured_date" value="<%=manufactured_date%>">
                                        <input type="hidden" name="product_name" value="<%=product_name%>">                                        
                                        <input type="hidden" name="type" value="<%=type%>">
                                        <input type="hidden" name="expire_date" value="<%=expire_date%>">
                                        <input type="hidden" name="mrp" value="<%=mrp%>">
                                        <input type="hidden" name="gst" value="<%=gst%>">
                                        <input type="hidden" name="total" value="<%=total%>">
                                        <input type="hidden" name="totalamount1" value="<%=totalamount%>">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="description">
                                        <span><%=product_name%></span>          <input type="hidden" name="product_name" value="<%=product_name%>">
                                        <span><%=product_category%></span>      <input type="hidden" name="product_category" value="<%=product_category%>"> 
                                    </div>
                                </div>
                                <div class="col-sm-1">
                                    <div class="quantity"> 
                                        <span>Quantity</span> 
                                        <input type="text" name="quantity" value="<%=quantity%>" min="0" id="quantity"  >    
                                    </div>
                                </div>
                                 
                                 <div class="col-sm-1" style="margin-left: 30px;">
                                     
                                      <span>MRP RS </span>   
                                       
                                      <input disabled="true"  type="text" id="total1" name="total1" value="<%=mrp%>" style="border: none; text-decoration: line-through;  ">  
                                      <input type="hidden" id="total" name="mrp" value="<%=mrp%>">
                                      <span>Offer Price</span> 
                                      <input disabled="true"  type="text" id="total1" name="total1" value="<%=offer_price%>" style="border: none;"> 
                                      <input type="hidden" id="total" name="offer_price" value="<%=offer_price%>">
                                </div>
                                
                                
                                <div class="col-sm-1" style="margin-left: 30px;">
                                    <br>
                                     <span>Total </span>   
                                     <input disabled="true"  type="text" id="total1" name="total1" value="<%=total%>" style=" border: none;"> 
                                     <input type="hidden" id="total" name="total" value="<%=total1%>">
                                </div>
                                 <div class="col-sm-2" style="margin-left: 30px;">
                                    <button class="button" type="submit" name="submit" value="Order Now" >Order Now</button>
                                </div> 
                             
                            </div>
                        </div>
                      
                     
                     <%
                            }
                            
                                
                            if(var==0)
                            {
                      %>
                      <div class="item">
                          <center><h4>Your shopping cart is empty...! Please add some products. <a href="product_select.jsp">Click to Add</a></h4></center>
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
