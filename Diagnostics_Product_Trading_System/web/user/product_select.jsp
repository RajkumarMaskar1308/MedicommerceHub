<%-- 
    Document   : product_select
    Created on : 7 Jan, 2023, 12:27:11 PM
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
        <link rel="stylesheet" href="..\css\user\product_select.css" type="text/css">
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
            <div class="row">
                
                <%
    Connection cn=null;
    Statement st=null;    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
        st=cn.createStatement();
        String sql="select * from add_product";
       
        ResultSet rs=st.executeQuery(sql);
    
        while(rs.next())
        {
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
            String quantity = rs.getString("quantity");
    %>
            <form name="product_select" action="../product_select" method="post">
                 <div class="col-sm-2" style="margin-left: 5%; margin-top: 2%; ">
                    <div class="product_div">  
                        <button class="image_div" type="submit" name="submit" value="submit"><img class="image_div1" name="image" src="../images/<%=image%>"></button>
                        <br><br>
                        <label class="product_lable">Product ID : <%=product_id%></label> <input type="hidden" name="product_id" value="<%=product_id%>">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="product_lable">Quantity :  <%=quantity%></label> <input type="hidden" name="manufacturer" value="<%=quantity%>"> <br> 
                        
                        <label class="product_lable"><%=product_name%></label> <input type="hidden" name="product_name" value="<%=product_name%>"> <br>
                        
                        <label class="product_lable">Pack Size : <%=type%></label> <input type="hidden" name="type" value="<%=type%>"> <br>
                        <label class="price_lable">Company : <%=manufacturer%></label> <input type="hidden" name="product_category" value="<%=manufacturer%>"> <br>
                        <label class="price_lable">MRP :  <s><%=mrp%> </s></label> <input type="hidden" name="mrp" value="<%=mrp%>"><br>
                        <label class="product_lable">offer price : <%=offer_price%> </label> <input type="hidden" name="offer_price" value="<%=offer_price%>"> <br>
                    </div>
                 </div>
            </form>
    
     <%
        }
        }catch(Exception ex)
                       {
        out.println(ex.toString());
        }   
    
     %>   
                
                 
                
                
             
            </div> 
        </div>
        
        
        
    </body>
</html>
