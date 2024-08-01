/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author prath
 */
public class customer_history extends HttpServlet {

     Connection cn=null;
    Statement st=null;
    
    private String getFileName(final Part part) 
    {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) 
        {
                if (content.trim().startsWith("filename")) 
                {
                    return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
                }
        }
    return null;
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out= resp.getWriter();
        
        HttpSession session=req.getSession();
        
        String user_id = req.getParameter("user_id");
        
        
        out.println(user_id); 
         
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(event);
        
       
        
        if(event.equals("Delete"))
         {
              try 
              {
             
                     String delete = db.delete("delete from user_signup where user_id='"+user_id+"'");
                     out.println(delete);
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('User Removed Successfully');");
                     out.println("location='admin/customer_history.jsp';");
                     out.println("</script>");
                     
              } 
              catch(Exception ex)
                {
                            resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('"+ex.toString()+"');");
                            out.println("location='admin/customer_history.jsp';");
                            out.println("</script>");
                }
         }
         
    }
    
}