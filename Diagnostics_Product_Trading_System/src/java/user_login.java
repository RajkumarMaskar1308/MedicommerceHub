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
public class user_login extends HttpServlet {

   Connection cn=null;
   Statement st=null; 
    
   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out= resp.getWriter();
        
        String email = req.getParameter("email");
        String password = req.getParameter("password"); 
        
        out.println(email);
        out.println(password);
        
        Database db=new Database();
        String result=db.Connectdb();
        
        
        String event= req.getParameter("submit");
        
        if(event.equals("Back"))
        {
            resp.sendRedirect("index.jsp");
        }
        
        if(event.equals("submit"))
         {
              if(email.equals("")||password.equals(""))
             {
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Some fields are Empty !');");
                     out.println("location='user_login.jsp';");
                     out.println("</script>");
             }
             else
             {
                 try
                 {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
                    st=cn.createStatement();
                    String sql="select * from user_signup where email='"+email.toString()+"' and password='"+password.toString()+"'";
                    ResultSet rs=st.executeQuery(sql);
                    
                    if(rs.next())
                    {
                        
                        HttpSession session=req.getSession();
                        
                        session.setAttribute("user_id", rs.getString("user_id"));
                        session.setAttribute("company_name", rs.getString("company_name"));
                        session.setAttribute("email", rs.getString("email"));
                        session.setAttribute("first_name", rs.getString("first_name"));
                        session.setAttribute("last_name", rs.getString("last_name"));
                        session.setAttribute("address_line1", rs.getString("address_line1"));
                        session.setAttribute("address_line2", rs.getString("address_line2"));
                        session.setAttribute("city", rs.getString("city"));
                        session.setAttribute("state", rs.getString("state"));
                        session.setAttribute("pincode", rs.getString("pincode"));
                        out.println(result);
                        session.setAttribute("contact", rs.getString("accountno"));
                        session.setAttribute("password", rs.getString("password")); 
                         
                          
                        resp.sendRedirect("user/product_select.jsp");
                    }
                    else
                    {
                        resp.setContentType("text/html"); 
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Login Failed !');");
                        out.println("location='user_login.jsp';");
                        out.println("</script>");
                    }
                }
                catch(Exception ex)
                {
                        resp.setContentType("text/html"); 
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('"+ex.toString()+"');");
                        out.println("location='user_login.jsp';");
                        out.println("</script>");
                }
             }
         }
        
        
        
        
        
    }
    
}