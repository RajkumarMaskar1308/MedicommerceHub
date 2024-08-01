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
public class history extends HttpServlet {

    Connection cn = null;
    Statement st = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        
        String order_id = req.getParameter("order_id");
        String product_id = req.getParameter("product_id");
        
         
        
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(event);
        
        if(event.equals("Cancel Order"))
        {
            String update = db.update("update orders set dstatus='Cancelled' where order_id = '"+order_id+"'"  );
            
            out.println(update);
            resp.sendRedirect("user/history.jsp");
        
        }
        
        
        
        if(event.equals("Order Again"))
        {
            session.setAttribute("product_id", product_id);
            resp.sendRedirect("user/product_information.jsp");
        
        }
        
         
        
        
    }
    
    
    
    
}