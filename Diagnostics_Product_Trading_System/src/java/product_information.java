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
public class product_information extends HttpServlet {

    Connection cn=null;
    Statement st=null;
    long availqty = 0;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out= resp.getWriter();
        HttpSession session = req.getSession();
        
        String user_id = session.getAttribute("user_id").toString();
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
        out.println(image); 
        out.println(quantity);
        out.println(total); 
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(event);
        
        if(event.equals("Back"))
        {
            resp.sendRedirect("index.jsp");
        }
        
        if(event.equals("AddToCard"))
         {
              
             
                 if(user_id.equals("") || product_id.equals("") || product_name.equals("")||manufacturer.equals("")||manufactured_date.equals("")||type.equals("")||product_category.equals("")||expire_date.equals("")||mrp.equals("")||gst.equals("")|| offer_price.equals("")||image.equals("")||quantity.equals("")||total.equals(""))
                 {
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Some fields are Empty !');");
                     out.println("location='user/product_information.jsp';");
                     out.println("</script>");

                 } 
                 else
                 {
                     
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
                        st=cn.createStatement();
                        String sql2="select * from add_product where product_id='"+product_id.toString()+"' ";
                        ResultSet rs2=st.executeQuery(sql2);

                        if(rs2.next())
                        {
                            availqty = Long.parseLong(rs2.getString("quantity").toString());  
                        } 
                    }
                    catch(Exception ex)
                    {

                    }
                     
                     
                     if(Integer.parseInt(quantity)>0 && availqty>=Integer.parseInt(quantity))
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
                         
                       
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
                        st=cn.createStatement();
                        String sql="select * from cart where user_id='"+user_id.toString()+"' and product_name='"+product_name.toString()+"'  ";
                        ResultSet rs=st.executeQuery(sql);

                        if(rs.next())
                        {
                            String qty = rs.getString("quantity").toString();
                            String ttl = rs.getString("total").toString();

                            long var_qty1=Long.parseLong(qty);
                            long var_ttl1=Long.parseLong(ttl);

                            long var_qty2=Long.parseLong(quantity)+var_qty1;
                            long var_ttl2=Long.parseLong(total)+var_ttl1;

                            String str = String.valueOf(var_qty2);
                            String str1 = String.valueOf(var_ttl2);

                            String update=db.update("update cart set quantity='"+str.toString()+"' , total='"+str1+"' where user_id='"+user_id.toString()+"' and product_name='"+product_name.toString()+"' ");

                            out.println(update);
                            out.println(str);
                            out.println(str1);
                            resp.sendRedirect("user/product_select.jsp");
                        }
                        else
                        {
                           String insert=db.Insert("insert into cart(user_id,product_id,product_name,manufacturer,manufactured_date,type,product_category,expire_date,mrp,gst,offer_price,image,quantity,total)values('"+user_id+"','"+product_id+"','"+product_name+"','"+manufacturer+"','"+manufactured_date+"','"+type+"','"+product_category+"','"+expire_date+"','"+mrp+"','"+gst+"','"+offer_price+"','"+image+"','"+quantity+"','"+total+"')");
                           out.println(insert);
                           resp.sendRedirect("user/product_select.jsp");
                        }  
                      
                    
                    }
                    catch(Exception ex)
                    {

                    }     
                         
                       
                     }
                     else
                     {
                        resp.setContentType("text/html");
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Quantity should not be 0 or Quantity not available');");
                        out.println("location='user/product_information.jsp';");
                        out.println("</script>");
                     }
                 
                                          
                                         
                 }
          } 
         
         }
        
         
}