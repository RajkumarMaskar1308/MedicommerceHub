<%-- 
    Document   : address_details
    Created on : 7 Jan, 2023, 8:13:05 PM
    Author     : prath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Address Details</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="..\css\user\address_details.css" type="text/css">
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
        <br><br><br>
        
        <form name="address_details" action="../address_details" method="post">
        <div class="maindiv">
             <div class="row">
                <div class="col-sm-6">
                    <input type="hidden" name="user_id" value="<%=session.getAttribute("user_id")%>">
                    <input class="textbox" type="text" name="company_name"  placeholder="Company Name" value="<%=session.getAttribute("company_name")%>">
                    <br>
                    <input class="textbox" type="text" name="first_name" placeholder="First Name" value="<%=session.getAttribute("first_name")%>">
                    <br>
                    <input class="textbox" type="text" name="address_line1" placeholder="Address Line1" value="<%=session.getAttribute("address_line1")%>">
                    <br>
                    <input class="textbox" type="text" name="city" placeholder="City" value="<%=session.getAttribute("city")%>">
                    <br>
                    <input class="textbox" type="text" name="pincode" placeholder="Pin-code"value="<%=session.getAttribute("pincode")%>">
                    <br>
                     
                    <br>
                    
                </div>
                <div class="col-sm-6">
                    <input class="textbox" type="text" name="email" placeholder="Email" value="<%=session.getAttribute("email")%>">
                    <br>
                    <input class="textbox" type="text" name="last_name" placeholder="Last Name" value="<%=session.getAttribute("last_name")%>">
                    <br>
                    <input class="textbox" type="text" name="address_line2" placeholder="Address Line2" value="<%=session.getAttribute("address_line2")%>">
                    <br>
                     
                    <select id="select" class="textbox" type="text" name="state" value="<%=session.getAttribute("state")%>">
                        <option value="">State</option>
                        <option value="Andaman and Nikobar Iceland">Andaman and Nikobar Iceland</option>
                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                        <option value="Assam">Assam</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Chandigarh">Chandigarh</option>
                        <option value="Chhattisgarh">Chhattisgarh</option>
                        <option value="Dard and Nagar Haveli">Dard and Nagar Haveli</option>
                        <option value="Daman and Diu">Daman and Diu</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Haryana">Haryana</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Karnataka">Karnataka</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Lakshadweep">Lakshadweep</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Manipur">Manipur</option>
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Mizoram">Mizoram</option>
                        <option value="Nagaland">Nagaland</option>
                        <option value="Odisha">Odisha</option>
                        <option value="Puducherry">Puducherry</option>
                        <option value="Punjab">Punjab</option>
                        <option value="Rajastan">Rajastan</option>
                        <option value="Sikkim">Sikkim</option>
                        <option value="Tamil Nadu">Tamil Nadu</option>
                        <option value="Telengana">Telengana</option>
                        <option value="Tripura">Tripura</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Uttarakhand">Uttarakhand</option>
                        <option value="West Bengal">West Bengal</option>
                        
                    </select>
                   
                    <br>
                    <input class="textbox" type="text" name="contact" placeholder="Contact No" value="<%=session.getAttribute("contact")%>">
                    <br>
                     
                    <br>
                    
                </div>
            
                <div style="width: 100%;">
                    <input  type="hidden" name="product_id"   value="<%=session.getAttribute("product_id")%>">
                    <input  type="hidden" name="product_name" value="<%=session.getAttribute("product_name")%>"> 
                    <input  type="hidden" name="manufacturer" value="<%=session.getAttribute("manufacturer")%>">
                    <input  type="hidden" name="manufactured_date" value="<%=session.getAttribute("manufactured_date")%>">
                    <input  type="hidden" name="type" value="<%=session.getAttribute("type")%>">
                    <input  type="hidden" name="product_category" value="<%=session.getAttribute("product_category")%>">
                    <input  type="hidden" name="expire_date" value="<%=session.getAttribute("expire_date")%>"> 
                    <input  type="hidden" name="mrp" value="<%=session.getAttribute("mrp")%>">
                    <input  type="hidden" name="gst" value="<%=session.getAttribute("gst")%>">
                    <input  type="hidden" name="offer_price" value="<%=session.getAttribute("offer_price")%>">
                    <input  type="hidden" name="total" value="<%=session.getAttribute("total")%>">
                    <input  type="hidden" name="quantity" value="<%=session.getAttribute("quantity")%>">
                    <input  type="hidden" name="image" value="<%=session.getAttribute("image")%>">

                    
                    <button class="button" type="submit" name="submit" value="Pay Now"><b>Submit</b></button>
                    
                    
                </div>
                <br><br>
                
            </div>
             
        </div>
        
            
      </form>
    </body>
</html>
