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

/**
 *
 * @author prath
 */
public class update_stock extends HttpServlet {

    Connection cn = null;
    Statement st = null;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out= resp.getWriter(); 
        
        String product_id = req.getParameter("product_id");
        String product_name = req.getParameter("product_name");
        String quantity = req.getParameter("quantity");
        
        out.println(product_id);
        out.println(product_name);
        out.println(quantity);
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(event);
        
        
        if(event.equals("Delete"))
        {
           if(product_id.equals(""))
           {
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Please Enter Product ID to delete the product');");
                     out.println("location='user_signup.jsp';");
                     out.println("</script>");
                     
           }
           else
           {
                     
               try
               {
                   String delete = db.delete("delete from add_product where product_id='"+product_id+"'");
                   out.println(delete);
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Product Deleted Susseccfully');");
                     out.println("location='admin/update_stock.jsp';");
                     out.println("</script>");
                     
                    
               }
               catch(Exception ex)
               {
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('"+ex.toString()+"');");
                     out.println("location='user_signup.jsp';");
                     out.println("</script>");
               }
           }
        }
        
        
        if(event.equals("Update"))
        {
           if(product_id.equals("") && product_name.equals(""))
           {
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Please Enter Product ID or Product Name to update  the product');");
                     out.println("location='user_signup.jsp';");
                     out.println("</script>");
                     
           }
           else
           {
                     
               try
               {
                   String update = db.update("update add_product set  quantity='"+quantity+"' where product_id='"+product_id+"' || product_name='"+product_name+"' ");
                   out.println(update);
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Product Updated Susseccfully');");
                     out.println("location='admin/update_stock.jsp';");
                     out.println("</script>");
                     
                    
               }
               catch(Exception ex)
               {
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('"+ex.toString()+"');");
                     out.println("location='user_signup.jsp';");
                     out.println("</script>");
               }
           }
        }
    }
    
}