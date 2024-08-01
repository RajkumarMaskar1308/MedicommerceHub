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
import javax.ws.rs.core.Response;

/**
 *
 * @author prath
 */
public class index extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out= resp.getWriter();
        
        String event= req.getParameter("submit");
        
        if(event.equals("Admin"))
        {
            resp.sendRedirect("admin_login.jsp");
        }
        
        if(event.equals("User"))
        {
            resp.sendRedirect("user_login.jsp");
        }
        
        
        
        
        
    }

    
    
    
    
}