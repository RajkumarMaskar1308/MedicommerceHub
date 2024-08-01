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
public class product_select extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      
        PrintWriter out= resp.getWriter();
        HttpSession session=req.getSession();
        
        String user_id = session.getAttribute("user_id").toString();
        String product_id = req.getParameter("product_id");
          
        out.println(product_id); 
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(event);
        
        if(event.equals("Logout"))
        {
            resp.sendRedirect("index.jsp");
        }
        
        if(event.equals("submit"))
         {               
            session.setAttribute("user_id", user_id);
            session.setAttribute("product_id", product_id); 
            resp.sendRedirect("user/product_information.jsp");
         }
           
    }
    
}