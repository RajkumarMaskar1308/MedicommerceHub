/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author prath
 */
public class user_signup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out= resp.getWriter(); 
        
        String company_name = req.getParameter("company_name");
        String first_name = req.getParameter("first_name");
        String address_line1 = req.getParameter("address_line1");
        String city = req.getParameter("city"); 
        String pincode = req.getParameter("pincode");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String last_name = req.getParameter("last_name");
        String address_line2 = req.getParameter("address_line2");  
        String state = req.getParameter("state");
        String contact_no = req.getParameter("contact_no");
        String cpassword = req.getParameter("cpassword"); 
        
        String district = req.getParameter("district");
        String gstno = req.getParameter("gstno");
        String accountno = req.getParameter("accountno");
        String taluka = req.getParameter("taluka");
        String bank_name= req.getParameter("bank_name");
        String ifsc = req.getParameter("ifsc");
        
        out.println(company_name);
        out.println(first_name);
        out.println(address_line1);
        out.println(city);
        out.println(pincode);
        out.println(password);
        out.println(email); 
        out.println(last_name);
        out.println(address_line2);
        out.println(state);
        out.println(contact_no);
        out.println(cpassword);
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(event);
        
        if(event.equals("Back"))
        {
            resp.sendRedirect("index.jsp");
        }
        
        if(event.equals("submit"))
         {
              
             if(password.equals(cpassword))
             {
                 if(company_name.equals("")||first_name.equals("")||address_line1.equals("") || city.equals("")|| pincode.equals("")||password.equals("")||email.equals("")||last_name.equals("") || address_line2.equals("") || state.equals("")|| contact_no.equals("")||cpassword.equals("")       )
                 {
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Some fields are Empty !');");
                     out.println("location='user_signup.jsp';");
                     out.println("</script>");

                 } 
                 else
                 {
                     String insert=db.Insert("insert into user_signup(company_name,first_name,address_line1,city,district,pincode,gstno,accountno,password,email,last_name,address_line2,state,taluka,contact_no,bank_name,ifsc,cpassword)values('"+company_name+"','"+first_name+"','"+address_line1+"','"+city+"','"+district+"','"+pincode+"','"+gstno+"','"+accountno+"','"+password+"','"+email+"','"+last_name+"','"+address_line2+"','"+state+"','"+taluka+"','"+contact_no+"','"+bank_name+"','"+ifsc+"','"+cpassword+"')");
                     out.println(insert);
                     resp.sendRedirect("user_login.jsp");
                                         
                 }
             }
             else
             {     
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Password and Confirm password are not matching !');");
                     out.println("location='user_signup.jsp';");
                     out.println("</script>");
             
             }   
         
         }
        
         
    }
    
}