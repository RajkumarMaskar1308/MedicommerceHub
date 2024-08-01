<%-- 
    Document   : add_product
    Created on : 6 Jan, 2023, 10:20:06 PM
    Author     : prath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="..\css\admin\add_product.css" type="text/css">
        
        
        <script>
            function fun()
            {
                var result = document.getElementById('file1').value;
                
                document.getElementById("total1").src = result; 
              
            }
        </script>
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
        
        
        <br> 
        
        <form name="admin_index" action="../add_product" method="post" enctype="multipart/form-data">
        <div class="maindiv">
            <div class="row">
                <div class="col-sm-3" style="margin-top: 10%;">
                  <br>
                       
                </div>
                
                <div class="col-sm-8">
                  
                <div class="row" style="margin-top: 5%;">
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%;">Product Name</h3> 
                        <input class="textbox" type="text" name="product_name" placeholder="Product Name"> 

                    </div> 
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px; margin-left: 5%;">Company Name</h3> 
                        <input class="textbox" type="text" name="manufacturer" placeholder="Company Name"> 
                    </div>  
                    <div class="col-sm-4">   
                        <h3 class="h" style="font-size: 15px; margin-left: 5%;">Manufactured Date</h3> 
                        <input class="textbox" type="date" name="manufactured_date" > 
                    </div>
               </div>
              
               
               <div class="row" style="margin-top: 5%;">
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px;">Pack Size</h3> 
                        <input class="textbox" type="text" name="type" placeholder="Pack Size"> 

                    </div> 
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px;">Quantity </h3> 
                        <input class="textbox" type="text" name="quantity" placeholder="Quantity"> 
                    </div> 
                    <div class="col-sm-4">   
                        <h3 class="h" style="font-size: 15px;">Expiry Date</h3> 
                        <input class="textbox" type="date" name="expire_date" > 
                    </div>
               </div>
               
                <div class="row" style="margin-top: 5%;">
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px;">Product Price</h3> 
                        <input class="textbox" type="text" name="mrp" placeholder="Product Price"> 

                    </div> 
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px;">GST %</h3> 
                        <input class="textbox" type="text" name="gst" placeholder="GST %"> 
                    </div>
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:15px;">Offer Price</h3> 
                        <input class="textbox" type="text" name="offer_price" placeholder="Offer Price"> 
                    </div>
                    
               </div>
                   
               <div class="row" style="margin-top: 5%;">
                   
                   <div class="col-sm-4">
                        <h3  class="h" style="font-size:15px;">Add Image:</h3> 
                        <input type="file" id="file1" name="image" class="textbox" style="width: 100%; margin-left:12%;" onclick="fun();">
                    </div>
                    <div class="col-sm-4">
                        <br><br>
                        <button class="button1" type="submit" name="submit" value="Add">Add</button>
                    </div> 
                      
               </div>  
                     
            </div>
             
                    
 
                
            </div>
            
            <br><br>
        </div>
        </form>
    </body>
</html>
