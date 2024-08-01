<%-- 
    Document   : profile
    Created on : 16 Jan, 2023, 10:35:59 PM
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
        <title>Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="..\css\user\profile.css" type="text/css">
        
        <script type="text/javascript">
             function fun() 
             {
                 var myvar1 = document.getElementById('mytextbox1').className; 
                 
                 if(myvar1 === 'textbox'  )
                 {
                     document.getElementById('mytextbox1').classList.add("textbox1");
                     document.getElementById('mytextbox1').classList.remove("textbox");
                     document.getElementById('mytextbox1').disabled=false;
                     document.getElementById('mytextbox2').classList.add("textbox1");
                     document.getElementById('mytextbox2').classList.remove("textbox");
                     document.getElementById('mytextbox2').disabled=false;
                     document.getElementById('mytextbox3').classList.add("textbox1");
                     document.getElementById('mytextbox3').classList.remove("textbox");
                     document.getElementById('mytextbox3').disabled=false;
                     document.getElementById('mytextbox4').classList.add("textbox1");
                     document.getElementById('mytextbox4').classList.remove("textbox");
                     document.getElementById('mytextbox4').disabled=false;
                     document.getElementById('mytextbox5').classList.add("textbox1");
                     document.getElementById('mytextbox5').classList.remove("textbox");
                     document.getElementById('mytextbox5').disabled=false;
                     document.getElementById('mytextbox6').classList.add("textbox1");
                     document.getElementById('mytextbox6').classList.remove("textbox");
                     document.getElementById('mytextbox6').disabled=false;
                     document.getElementById('mytextbox7').classList.add("textbox1");
                     document.getElementById('mytextbox7').classList.remove("textbox");
                     document.getElementById('mytextbox7').disabled=false;
                     document.getElementById('mytextbox8').classList.add("textbox1");
                     document.getElementById('mytextbox8').classList.remove("textbox");
                     document.getElementById('mytextbox8').disabled=false;
                     document.getElementById('mytextbox9').classList.add("textbox1");
                     document.getElementById('mytextbox9').classList.remove("textbox");
                     document.getElementById('mytextbox9').disabled=false;
                     document.getElementById('mytextbox10').classList.add("textbox1");
                     document.getElementById('mytextbox10').classList.remove("textbox");
                     document.getElementById('mytextbox10').disabled=false;
                 }
                 else
                 {
                     document.getElementById('mytextbox1').classList.add("textbox");
                     document.getElementById('mytextbox1').classList.remove("textbox1");
                     document.getElementById('mytextbox1').disabled=true;
                     document.getElementById('mytextbox2').classList.add("textbox");
                     document.getElementById('mytextbox2').classList.remove("textbox1");
                     document.getElementById('mytextbox2').disabled=true;
                     document.getElementById('mytextbox3').classList.add("textbox");
                     document.getElementById('mytextbox3').classList.remove("textbox1");
                     document.getElementById('mytextbox3').disabled=true;
                     document.getElementById('mytextbox4').classList.add("textbox");
                     document.getElementById('mytextbox4').classList.remove("textbox1");
                     document.getElementById('mytextbox4').disabled=true;
                     document.getElementById('mytextbox5').classList.add("textbox");
                     document.getElementById('mytextbox5').classList.remove("textbox1");
                     document.getElementById('mytextbox5').disabled=true;
                     document.getElementById('mytextbox6').classList.add("textbox");
                     document.getElementById('mytextbox6').classList.remove("textbox1");
                     document.getElementById('mytextbox6').disabled=true;
                     document.getElementById('mytextbox7').classList.add("textbox");
                     document.getElementById('mytextbox7').classList.remove("textbox1");
                     document.getElementById('mytextbox7').disabled=true;
                     document.getElementById('mytextbox8').classList.add("textbox");
                     document.getElementById('mytextbox8').classList.remove("textbox1");
                     document.getElementById('mytextbox8').disabled=true;
                     document.getElementById('mytextbox9').classList.add("textbox");
                     document.getElementById('mytextbox9').classList.remove("textbox1");
                     document.getElementById('mytextbox9').disabled=true;
                     document.getElementById('mytextbox10').classList.add("textbox");
                     document.getElementById('mytextbox10').classList.remove("textbox1");
                     document.getElementById('mytextbox10').disabled=true;
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
         <form name="profile" action="../profile" method="post">
             
             <%
                    Connection cn=null;
                    Statement st=null; 
                    
                            String user_id="";
                            String company_name="";
                            String email="";
                            String first_name="";
                            String last_name="";
                            String address_line1="";
                            String address_line2="";   
                            String city="";
                            String state="";
                            String pincode="";
                            String contact=""; 
                            String photo ="";
                            String password="";
                            String username="";
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
                        st=cn.createStatement();
                        String sql="select * from user_signup where user_id ='"+session.getAttribute("user_id") +"'  ";
       
                        ResultSet rs=st.executeQuery(sql);
                        
                            
                         
                        while(rs.next())
                        {
                            
                              user_id =rs.getString("user_id");   
                              company_name =rs.getString("company_name");
                              email =rs.getString("email");
                              first_name = rs.getString("first_name");
                              last_name = rs.getString("last_name");
                              address_line1 = rs.getString("address_line1");
                              address_line2 =rs.getString("address_line2");   
                              city =rs.getString("city");
                              state =rs.getString("state");
                              pincode = rs.getString("pincode");
                              contact = rs.getString("contact_no");
                              photo = rs.getString("contact_no");
                              password = rs.getString("password");
                         }
                     %>
             
            <div class="row">
                <div class="col-sm-3" style="margin-top: 10%;">
                  <div class="imglogo">
                      <img src="../images/<%=photo%>" style=" margin-left:12%;  margin-top:3%;  height:200px;  width: 200px; border-radius: 50%;">
                      <br><br>
                      
                      <center><label>Hii... <%=first_name%></label></center>
                      
                      <input class=" " type="hidden" name="image" value="<%=photo%>">
                      <input class=" " type="hidden" name="user_id" value="<%=user_id%>">
                  </div> <br><br>
                  <input type="file" style="margin-left: 30px;" name="photo1"   >
                  <button name="submit" value="Upload Photo" class="uploadphoto">Upload Photo</button>
                      
                </div>
                 
                <div class="col-sm-8">
                    <div class="row" style="margin-top: 5%;">
                        <h4>My Personal Details <span style="float:right;">Customer ID : <%=user_id%></span></h4>
                        <hr>
                    </div>
                <div class="row" >
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:12px; margin-left: 5%; opacity: 0.6;">Email ID</h3> 
                        <input id="mytextbox1" type="text" name="email" class="textbox" value="<%=email%>" disabled="true"> 
                         
                    </div>
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:12px; margin-left: 5%; opacity: 0.6;">Contact</h3> 
                        <input id="mytextbox2" type="text" name="contact" class="textbox" value="<%=contact%>" disabled="true"> 
                        

                    </div> 
                      
                    
               </div>
                          
                        
               <div class="row"  >
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:12px; margin-left: 5%; opacity: 0.6;">First Name</h3> 
                        <input id="mytextbox3" type="text" name="first_name" class="textbox" value="<%=first_name%>" disabled="true">
                          
                    </div>
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:12px; margin-left: 5%; opacity: 0.6;">Last Name</h3> 
                        <input id="mytextbox4" type="text" name="last_name" class="textbox" value="<%=last_name%>" disabled="true"> 

                    </div> 
                     
               </div>
                    
                <div class="row" style="margin-top: 5%;">
                        <h4>My Address Details </h4>
                        <hr>
               </div>
                         
               
                <div class="row"  >
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:12px; margin-left: 5%; opacity: 0.6;">Address Line 1</h3> 
                        <input id="mytextbox5" type="text" name="address_line1" class="textbox" value="<%=address_line1%>" disabled="true"> 
                    </div>
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:12px; margin-left: 5%; opacity: 0.6;">Address Line 2</h3> 
                        <input id="mytextbox6" name="address_line2" type="text" class="textbox" value="<%=address_line2%>" disabled="true"> 
                    </div>
                    
               </div>
                        
              <div class="row"  >
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:12px; margin-left: 5%; opacity: 0.6;">City</h3> 
                        <input id="mytextbox7" name="city" type="text" class="textbox" value="<%=city%>" disabled="true"> 
                    </div>
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:12px; margin-left: 5%; opacity: 0.6;">State</h3> 
                        <input id="mytextbox8" name="state" type="text" class="textbox" value="<%=state%>" disabled="true"> 

                    </div>
                        <div class="col-sm-4">
                        <h3 class="h" style="font-size:12px; margin-left: 5%; opacity: 0.6;">Pincode</h3> 
                        <input id="mytextbox9" name="pincode" type="text" class="textbox" value="<%=pincode%>" disabled="true"> 

                    </div>
                    
               </div>
                        
                        <div class="row" style="margin-top: 5%;">
                        <h4>Password Details </h4>
                        <hr>
               </div>
                         
               
                <div class="row"  >
                    <div class="col-sm-4">
                        <h3 class="h" style="font-size:12px; margin-left: 5%; opacity: 0.6;">Password</h3> 
                        <input name="password" type="text" id="mytextbox10" class="textbox" value="<%=password%>" disabled="true"> 
                    </div>
                    <div class="col-sm-4">
                        <div class="row" style="margin-top: 5%;">
                            <label  style="color:#072791!important; margin-left: 5%; cursor: pointer;" onclick="fun();" >Edit Profile</label>
                            <button class="button1" type="submit" name="submit" value="Update Profile">Update Profile</button>
                            
                         </div>
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
