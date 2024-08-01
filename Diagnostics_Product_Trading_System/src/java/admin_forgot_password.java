/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author prath
 */
public class admin_forgot_password extends HttpServlet {

    
    
   Connection cn=null;
   Statement st=null; 
    
   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out= resp.getWriter();
        
        String email = req.getParameter("email");
        String contact = req.getParameter("contact");
        String password = req.getParameter("password"); 
        
        out.println(email);
        out.println(contact);
        out.println(password);
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        
        if(event.equals("Back"))
        {
            resp.sendRedirect("index.jsp");
        }
        
        if(event.equals("submit"))
         {
              if(email.equals("")||password.equals("") || contact.equals(""))
             {
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Some fields are Empty !');");
                     out.println("location='admin_forgot_password.jsp';");
                     out.println("</script>");
             }
             else
             {
                try
                {
                     String update = db.update("update admin_signup set  password='"+password+"', cpassword='"+password+"' where contact_no='"+contact+"' && email='"+email+"' ");
                     out.println(update);
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Password Updated Susseccfully');");
                     out.println("location='admin_login.jsp';");
                     out.println("</script>");  
                }
                catch(Exception ex)
                {
                        resp.setContentType("text/html"); 
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('"+ex.toString()+"');");
                        out.println("location='admin_forgot_password.jsp';");
                        out.println("</script>");
                }
             }
         }
        
        
        
        
        
    }
    
}