/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
public class profile extends HttpServlet {

   Connection cn = null;
    Statement st = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        
        String user_id = req.getParameter("user_id");
        String photo1 = req.getParameter("photo1");
        String email = req.getParameter("email");
        String contact = req.getParameter("contact");
        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");
        String address_line1 = req.getParameter("address_line1");
        String address_line2 = req.getParameter("address_line2");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String pincode = req.getParameter("pincode");
        String password = req.getParameter("password"); 
        
         
        
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(event);
        
        if(event.equals("Upload Photo"))
        {
            String update = db.update("update user_signup set photo='"+photo1+"' where user_id = '"+user_id+"'"  );
            
            out.println(update);
            resp.sendRedirect("user/profile.jsp");
        
        }
        
        
        if(event.equals("Update Profile"))
        {
            String update = db.update("update user_signup set email='"+email+"' , contact='"+contact+"', first_name='"+first_name+"', last_name='"+last_name+"' , address_line1='"+address_line1+"',address_line2='"+address_line2+"', city='"+city+"',state='"+state+"',pincode='"+pincode+"',password='"+password+"' where user_id = '"+user_id+"'"  );
            out.println(update);
            resp.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Profile Updated');");
            out.println("location='user/profile.jsp';");
            out.println("</script>");
            
        
        }
        
        
        
        
         
        
        
    }
    
    
    
    
}