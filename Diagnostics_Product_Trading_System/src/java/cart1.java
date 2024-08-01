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
public class cart1 extends HttpServlet {

    
    Connection cn = null;
    Statement st = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        
        String cart_id = req.getParameter("cart_id");
        String user_id = session.getAttribute("user_id").toString();
        String product_id =  req.getParameter("product_id");   
        String product_name = req.getParameter("product_name");
        String manufacturer = req.getParameter("manufacturer");
        String manufactured_date = req.getParameter("manufactured_date");
        String type = req.getParameter("type");
        String product_category = req.getParameter("product_category");
        String expire_date = req.getParameter("expire_date");   
        String mrp = req.getParameter("mrp");
        String gst = req.getParameter("gst");
        String offer_price = req.getParameter("offer_price");
        String image = req.getParameter("image"); 
        String total = req.getParameter("total1");
        String quantity = req.getParameter("quantity");
        String totalamount = req.getParameter("totalamount");
        
        out.println(cart_id);
        out.println(user_id);
        out.println(product_id);
        out.println(product_name);
        out.println(manufacturer);
        out.println(manufactured_date);
        out.println(type);
        out.println(product_category);
        out.println(expire_date);
        out.println(mrp);
        out.println(gst);
        out.println(offer_price);
        out.println(total);
        out.println(image);
        out.println(quantity);
        out.println(totalamount); 
        
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(event);
        
        if(event.equals("remove"))
        {
            String delete=db.delete("delete from cart where cart_id = '"+cart_id+"'");
            out.println(delete);
            resp.sendRedirect("user/cart.jsp");
        
        }
        
        
        
        if(event.equals("plus"))
        {
            resp.sendRedirect("user/cart.jsp");
        
        }
        
        if(event.equals("minus"))
        {
            resp.sendRedirect("user/cart.jsp");
        
        }
        
        if(event.equals("Place Order"))
        {
                         session.setAttribute("user_id", user_id);
                         session.setAttribute("product_id", product_id);
                         session.setAttribute("product_name", product_name);
                         session.setAttribute("manufacturer", manufacturer);
                         session.setAttribute("manufactured_date", manufactured_date);
                         session.setAttribute("type", type);
                         session.setAttribute("product_category", product_category);
                         session.setAttribute("expire_date", expire_date);
                         session.setAttribute("mrp", mrp);
                         session.setAttribute("gst", gst);
                         session.setAttribute("offer_price", offer_price);
                         session.setAttribute("image", image);
                         session.setAttribute("quantity", quantity);
                         session.setAttribute("total", total); 
                         resp.sendRedirect("user/address_details.jsp");
        
        }
        
        if(event.equals("Back to Shopping"))
        {
                         session.setAttribute("user_id", user_id);
                         session.setAttribute("product_id", product_id);
                         session.setAttribute("product_name", product_name);
                         session.setAttribute("manufacturer", manufacturer);
                         session.setAttribute("manufactured_date", manufactured_date);
                         session.setAttribute("type", type);
                         session.setAttribute("product_category", product_category);
                         session.setAttribute("expire_date", expire_date);
                         session.setAttribute("mrp", mrp);
                         session.setAttribute("gst", gst);
                         session.setAttribute("offer_price", offer_price);
                         session.setAttribute("image", image);
                         session.setAttribute("quantity", quantity);
                         session.setAttribute("total", total); 
                         resp.sendRedirect("user/product_select.jsp");
        
        }
        
        
    }
    
    
    
    
}