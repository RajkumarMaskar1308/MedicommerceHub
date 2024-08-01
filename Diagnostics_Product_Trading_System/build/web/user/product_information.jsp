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
        <title>Product Information</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="..\css\user\product_information.css" type="text/css">
        
        <script type="text/javascript">
             function sum() 
             {
                var price = document.getElementById('offer_price').value;
                var gst = document.getElementById('gst').value;
                var qty = document.getElementById('quantity').value;
                var result = (parseInt(price) * parseInt(qty));
                var gstprice = result + ((result*gst)/100);
                
                if(!isNaN(result))
                {
                    document.getElementById("total1").value = gstprice;
                    document.getElementById("total").value = gstprice;
                }
             }

        </script>
    </head>
    
    <body>
        
        <form name="logout_button" action="../logout_button" method="post">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="header_div">
                <img class="image_class" src="../images/indexlogo.png">

                <div class="container-fluid" style="float:right; margin-top: 10px; border: none;">  
                    <ul class="nav navbar-nav" style="color: #072791!important;">
                        <li class=""  ><a href="product_select.jsp" style="color: #072791!important;">Home</a></li>
                        <li><a href="cart.jsp" style="color: #072791!important;">Cart</a></li>
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
         <form name="product_information" action="../product_information" method="post">
             
             <%
                    Connection cn=null;
                    Statement st=null; 
                    
                            String product_id="";
                            String product_name="";
                            String manufacturer="";
                            String manufactured_date="";
                            String type="";
                            String product_category="";
                            String expire_date="";   
                            String mrp="";
                            String gst="";
                            String offer_price="";
                            String image="";
                            String total1="";
                            String currentqty = "";
                                
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
                        st=cn.createStatement();
                        String sql="select * from add_product where product_id ='"+session.getAttribute("product_id") +"'  ";
       
                        ResultSet rs=st.executeQuery(sql);
                        
                            
                         
                        while(rs.next())
                        {
                              product_id =rs.getString("product_id");   
                              product_name =rs.getString("product_name");
                              manufacturer =rs.getString("manufacturer");
                              manufactured_date = rs.getString("manufactured_date");
                              type = rs.getString("type");
                              product_category = rs.getString("product_category");
                              expire_date =rs.getString("expire_date");   
                              mrp =rs.getString("mrp");
                              gst =rs.getString("gst");
                              offer_price = rs.getString("offer_price");
                              image = rs.getString("image"); 
                             

                         }
                     %>
             
            <div class="row">
                <div class="col-sm-3" style="margin-top: 10%;">
                  <div class="imglogo">
                      <img src="../images/<%=image%>" style=" margin-left:12%;  margin-top:3%;  height:80%;  width: 70%;">
                      <input class=" " type="hidden" name="image" value="<%=image%>">
                      <input class=" " type="hidden" name="product_id" value="<%=product_id%>">
                  </div> <br>
                  <h3  style="font-size:20px; margin-left:12%; ">Quantity :</h3> 
                  <input type="number" id="quantity" name="quantity" min="0" class="textbox" style="width: 50%; margin-left:12%;" onclick="sum();">     
                </div>
                 
                <div class="col-sm-8">
                  
                <div class="row" style=" margin-top: 3%;">
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Product Name</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=product_name%></h1>
                        <input class=" " type="hidden" name="product_name" value="<%=product_name%>"> 
                    </div>
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Manufacturer</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=manufacturer%></h1>
                        <input class=" " type="hidden" name="manufacturer" value="<%=manufacturer%>"> 

                    </div> 
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Manufactured Date</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=manufactured_date%></h1>
                        <input class=" " type="hidden" name="manufactured_date" value="<%=manufactured_date%>"> 
                    </div>  
                    
               </div>
              
               
               <div class="row" style=" margin-top: 3%;">
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Product Type</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=type%></h1>
                        <input class=" " type="hidden" name="type" value="<%=type%>"> 
                    </div>
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Category</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=product_category%></h1>
                        <input class=" " type="hidden" name="product_category" value="<%=product_category%>"> 

                    </div> 
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Expiry Date</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=expire_date%></h1>
                        <input class=" " type="hidden" name="expire_date" value="<%=expire_date%>"> 
                    </div>  
                    
               </div>
               
                <div class="row" style=" margin-top: 3%;">
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">MRP RS</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=mrp%></h1>
                        <input class=" " id="mrp" type="hidden" name="mrp" value="<%=mrp%>"> 
                    </div>
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">GST</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=gst%>%</h1>
                        <input class=" " id="gst" type="hidden" name="gst" value="<%=gst%>"> 

                    </div> 
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Offer Price</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"><%=offer_price%></h1>
                        <input class=" " id="offer_price" type="hidden" name="offer_price" value="<%=offer_price%>"> 
                    </div>  
                    
               </div>
                    
               <div class="row" style=" margin-top: 3%;">
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%; opacity: 0.6;">Total</h3> 
                        <h1  style="font-size:20px; margin-left: 5%;"></h1>
                        <input disabled="true" type="text" id="total1" name="total1" value="0" style="font-size:25px; margin-left: 5%; border: none;">
                        <input type="hidden" id="total" name="total" value="<%=total1%>">
                    </div>
                      
               </div>
                   
               <div class="row" style="margin-top: 3%;">
                    <div class="col-sm-4">
                        <button class="button1" type="submit" name="submit" value="AddToCard">Add To Cart</button>
                    </div>  
               </div>  
                     
            </div>
             
                    
 
                
            </div>
                  
                  <%
                    }catch(Exception ex)
                     {
                         out.println(ex.toString());
                     }
             %>
                  
                   
            
            <br><br>
            
         </form>
        </div>   
          
         
        
        
        
    </body>
</html>
