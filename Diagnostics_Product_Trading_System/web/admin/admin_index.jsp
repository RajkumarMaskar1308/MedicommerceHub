<%-- 
    Document   : index
    Created on : 5 Jan, 2023, 7:54:46 PM
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
        <title>Welcome to Diagnostic's Product Trading</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="..\css\admin\admin_index.css" type="text/css">
        <link rel="stylesheet" href="..\css\font-awesome-4.7.0\css\font-awesome.min.css">
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
         
        <%
                    Connection cn=null;
                    Statement st=null; 
                    
                    String number_of_users =  "";
                    String number_of_products = "";
                    String number_of_payments= "";
                    String number_of_orders="";
                                
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
                        st=cn.createStatement();
                                                
                        String sq = "SELECT COUNT(*) FROM user_signup";
                        ResultSet rs=st.executeQuery(sq);
                        while(rs.next())
                        {                                
                            number_of_users = rs.getString(1);
                        }
                        
                        String sq1 = "SELECT COUNT(*) FROM add_product";
                        ResultSet rs1=st.executeQuery(sq1);
                        while(rs1.next())
                        {                                
                            number_of_products = rs1.getString(1);
                        }
                        
                        String sq2 = "SELECT COUNT(*) FROM payment_detail";
                        ResultSet rs2=st.executeQuery(sq2);
                        while(rs2.next())
                        {                                
                            number_of_payments = rs2.getString(1);
                        }
                        
                        String sq3 = "SELECT COUNT(*) FROM orders where dstatus='Delivered' ";
                        ResultSet rs3=st.executeQuery(sq3);
                        while(rs3.next())
                        {                                
                            number_of_orders = rs3.getString(1);
                        }
                        
                      }
                      catch(Exception ex)
                      {
                      
                      }
                     %>    
            
        <br>    
        
        <div class="row">
            <div class="col-sm-3">
                <div class="datadiv">
                    <br>
                    <center>
                        <i class="fa fa-users" aria-hidden="true" style="font-size: 100px; color: #072791!important;"></i>
                        <br><br>
                        <label><%=number_of_users%></label> <br>
                        <label>Users</label>
                    </center>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="datadiv">
                    <br>
                    <center>
                        <i class="fa fa-stethoscope" aria-hidden="true" style="font-size: 100px; color: #072791!important;"></i>
                        <br><br>
                        <label><%=number_of_products%></label> <br>
                        <label>Products</label>
                    </center>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="datadiv">
                    <br>
                    <center>
                        <i class="fa fa-rupee" aria-hidden="true" style="font-size: 100px; color: #072791!important;"></i>
                        <br><br>
                        <label><%=number_of_payments%></label> <br>
                        <label>Successful Payments</label>
                    </center>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="datadiv">
                    <br>
                    <center>
                        <i class="fa fa-cart-plus" aria-hidden="true" style="font-size: 100px; color: #072791!important;"></i>
                        <br><br>
                        <label><%=number_of_orders%></label> <br>
                        <label>Orders Delivered</label>
                    </center>
                </div>
            </div>
        </div>
        
         
         
        
        </form>
    </body>
</html>
