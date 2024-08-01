<%-- 
    Document   : user_signup
    Created on : 5 Jan, 2023, 10:04:27 PM
    Author     : prath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Signup</title>
        <link rel="stylesheet" href="css\bootstrap.css" type="text/css">
        <link rel="stylesheet" href="css\user_signup.css" type="text/css">
        <script src="css/validation.js"></script>
        <script>
            function showpass()
            {
                var mode1 = document.getElementById('passid1').type;
                var mode2 = document.getElementById('passid2').type;
                
                if(mode1==='password' || mode1==='password')
                    {
                        document.getElementById('passid1').type='text';
                        document.getElementById('passid2').type='text';
                    }
                    else if(mode1==='text' || mode2==='text')
                        {
                            document.getElementById('passid1').type='password';
                            document.getElementById('passid2').type='password';
                        }
            }
        </script>
        
        
    </head>
    <body>
        
        <form name="user_signup" action="user_signup" method="post">  
            
         <div class="header_div">
            <img class="image_class" src="images/indexlogo.png">
            <button class="header_button" type="submit" name="submit" value="Back"><b>Back</b></button>
        </div>
             
             
        <div class="maindiv">
            <div class="logo1">
                <div class="imglogo">
                    <img src="images/signup_logo.png" style=" margin-left: 42%;  margin-top:3%;  height: 20%;  width: 15%;">
                </div>
            </div>            
            <div class="logo1"></div>
            
             
            <div class="row">
                <div class="col-sm-6">
                    <input class="textbox" type="text" name="company_name" placeholder="Lab Name" onkeypress="return isString(event);">
                    <br>
                    <input class="textbox" type="text" name="first_name" placeholder="First Name" onkeypress="return isString(event);">
                    <br>
                    <input class="textbox" type="text" name="address_line1" placeholder="Address Line1" onkeypress="return isAlphanumric(event);">
                    <br>
                    <input class="textbox" type="text" name="city" placeholder="City" onkeypress="return isString(event);">
                    <br>
                    <input class="textbox" type="text" name="district" placeholder="District" onkeypress="return isString(event);">
                    <br>
                    <input class="textbox" type="text" name="pincode" placeholder="Zip-code" onkeypress="return isNumber(event);">
                    <br>
                    <input class="textbox" type="text" name="gst" placeholder="GST Number" >
                    <br>
                    <input class="textbox" type="text" name="accountno" placeholder="Account Number" onkeypress="return isNumber(event);">
                    <br>
                    <input class="textbox" type="password" name="password" placeholder="Password" id="passid1">
                     
                    <br>
                    
                    
                </div>
                <div class="col-sm-6">
                    <input class="textbox" type="text" name="email" placeholder="Email">
                    <br>
                    <input class="textbox" type="text" name="last_name" placeholder="Last Name" onkeypress="return isString(event);">
                    <br>
                    <input class="textbox" type="text" name="address_line2" placeholder="Address Line2" onkeypress="return isAlphanumric(event);">
                    <br>
                     
                    <select  class="textbox"  name="state">
                        <option value="State">State</option>
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
                    <input class="textbox" type="text" name="taluka" placeholder="Taluka" onkeypress="return isString(event);">
                    <br>
                    <input class="textbox" type="text" name="contact_no" placeholder="Contact No" onkeypress="return isContactno(event);">
                    <br>
                    <input class="textbox" type="text" name="bankname" placeholder="Bank Name" onkeypress="return isString(event);">
                    <br>
                    <input class="textbox" type="text" name="ifsc" placeholder="IFSC Code" >
                    <br>
                    <input class="textbox" type="password" name="cpassword" placeholder="Confirm Password" id="passid2">
                    <br>
                    <input type="checkbox"  onclick="showpass();" style="margin: 10px 0 0 35px;">
                    <label   style="font-size: 12px; ">show password</label>
                    <br>
                    
                    
                </div>
            
                <div style="width: 100%;">
                    <button class="button" type="submit" name="submit" value="submit"><b>Register</b></button>
                    <lable style="padding-top: 7%; padding-right: 7%; float: right; "> Already have an account? <span> <a href="admin_login.jsp">Sign in</a><span>  
                    </lable>
                </div>
              
                <br><br>
               
                
            </div>
           
        </div>
            
        </form>
        
        
    </body>
</html>
