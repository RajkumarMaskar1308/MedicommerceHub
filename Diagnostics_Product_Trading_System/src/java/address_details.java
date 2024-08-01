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
public class address_details extends HttpServlet {

    Connection cn = null;
    Statement st = null;
  
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
          PrintWriter out= resp.getWriter(); 
          HttpSession session = req.getSession();
        
           
        String user_id = req.getParameter("user_id");
        String company_name = req.getParameter("company_name");
        String first_name = req.getParameter("first_name");
        String address_line1 = req.getParameter("address_line1");
        String city = req.getParameter("city"); 
        String pincode = req.getParameter("pincode"); 
        String email = req.getParameter("email");
        String last_name = req.getParameter("last_name");
        String address_line2 = req.getParameter("address_line2");  
        String state = req.getParameter("state");
        String contact_no = req.getParameter("contact"); 
        
                            String product_id="";
                            String product_name="";
                            String manufacturer="";
                            String manufactured_date="";
                            String type="";
                            String product_category="";
                            String expire_date="";   
                            String mrp="";
                            String gst="";
                            String offer_price="";
                            String image="";
                            String quantity="";
                            String total="";
                            
                            
                              product_id =req.getParameter("product_id");   
                              product_name =req.getParameter("product_name");
                              manufacturer =req.getParameter("manufacturer");
                              manufactured_date = req.getParameter("manufactured_date");
                              type = req.getParameter("type");
                              product_category = req.getParameter("product_category");
                              expire_date =req.getParameter("expire_date");   
                              mrp =req.getParameter("mrp");
                              gst =req.getParameter("gst");
                              offer_price = req.getParameter("offer_price");
                              image = req.getParameter("image"); 
                              quantity=req.getParameter("quantity");
                              total=req.getParameter("total");
        
        out.println(company_name);
        out.println(first_name);
        out.println(address_line1);
        out.println(city);
        out.println(pincode); 
        out.println(email); 
        out.println(last_name);
        out.println(address_line2);
        out.println(state);
        out.println(contact_no); 
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(event);
        
         
        
        if(event.equals("Pay Now"))
         { 
                 if(company_name.equals("")||first_name.equals("")||address_line1.equals("") || city.equals("")|| pincode.equals("")||email.equals("")||last_name.equals("") || address_line2.equals("") || state.equals("")|| contact_no.equals("")||user_id.equals("")       )
                 {
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Some fields are Empty !');");
                     out.println("location='user/address_details.jsp';");
                     out.println("</script>");

                 } 
                 else
                 {
                     try
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
                     
                     
                     String insert=db.Insert("insert into address_details(user_id,company_name,first_name,address_line1,city,pincode,email,last_name,address_line2,state,contact,confirm_password)values('"+user_id+"','"+company_name+"','"+first_name+"','"+address_line1+"','"+city+"','"+pincode+"','"+email+"','"+last_name+"','"+address_line2+"','"+state+"','"+contact_no+"')");
                     out.println(insert);
                     resp.sendRedirect("user/payment.jsp");
                     }
                     catch(Exception ex)
                     {
                         resp.setContentType("text/html");
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('"+ex.toString()+"');");
                            out.println("location=user/'address_details.jsp';");
                            out.println("</script>");
                     }
                                         
                 }
               
         
         }
        
         
    }
    
}