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
public class order_information extends HttpServlet {

    
    Connection cn = null;
    Statement st = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        
        String order_id = req.getParameter("order_id");
        String delivery_date = req.getParameter("delivery_date");
        String dstatus = req.getParameter("dstatus");
        
         
        
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(event);
        
        
        
        
        if(event.equals("submitdata"))
        {
            
            String update=db.update("update orders set delivery_date='"+delivery_date.toString()+"' , dstatus='"+dstatus+"' where order_id='"+order_id.toString()+"' ");
            out.println(update);
            resp.sendRedirect("admin/orders_received.jsp");
        
        }
         
        
         
        
        
    }
    
    
    
    
}