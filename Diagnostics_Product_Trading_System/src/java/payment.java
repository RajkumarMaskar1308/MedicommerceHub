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
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author prath
 */
public class payment extends HttpServlet {

Connection cn = null;
    Statement st = null;
  
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
          PrintWriter out= resp.getWriter(); 
          HttpSession session = req.getSession();
          
                            String user_id="";
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
                            String paymentmode = "";
                            
                                
                              user_id = req.getParameter("user_id");
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
                              paymentmode = req.getParameter("pay");
        
         
        String card_no = req.getParameter("card_no");
        String expiretion_date = req.getParameter("expiretion_date");
        String cv_code = req.getParameter("cv_code");
        String card_owner = req.getParameter("card_owner"); 
        
        Date date=new Date();
        SimpleDateFormat df=new SimpleDateFormat("yyyy/MM/dd");
        String order_date=df.format(date);
        
        Calendar c = Calendar.getInstance(); 
        c.add(Calendar.DATE, 7);  // number of days to add
        String delivery_date = df.format(c.getTime());  // dt is now the new date
        
        
        
        
        out.println(user_id);
        out.println(card_no);
        out.println(expiretion_date);
        out.println(cv_code);
        out.println(card_owner);  
        out.println(paymentmode);
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(product_id);
        
         
        
        if(event.equals("Pay Now"))
         { 
                 if(user_id.equals(""))
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
                         if(paymentmode.equals("Scan Payment"))
                         {
                             card_no = "0";
                             cv_code = "0";
                         }
                         
                         
                     
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/diagnostics_products_trading_system","root","root");
                        st=cn.createStatement();
                        String sql="select * from add_product where product_id='"+product_id.toString()+"'  ";
                        ResultSet rs=st.executeQuery(sql);

                        if(rs.next())
                        {
                            String currentqty = rs.getString("quantity").toString(); 

                            long currentqty1=Long.parseLong(currentqty);
                            long placedqty1=Long.parseLong(quantity);

                            long totalqty= currentqty1-placedqty1; 

                            String str = String.valueOf(totalqty); 

                            String update=db.update("update add_product set quantity='"+str.toString()+"'  where product_id='"+product_id.toString()+"'  ");

                            out.println(update);
                             
                           
                        }
                        
                      
                    
                    }
                    catch(Exception ex)
                    {

                    }      
                         
                         
                     String insert=db.Insert("insert into payment_detail(user_id,card_no,expiretion_date,cv_code,card_owner,order_date,paymentmode)values('"+user_id+"','"+card_no+"','"+expiretion_date+"','"+cv_code+"','"+card_owner+"','"+order_date+"','"+paymentmode+"' )");
                     out.println(insert);
                     
                     String delete = db.delete("delete from cart where user_id = '"+user_id+"'");
                     
                     String insert1 = db.Insert("insert into orders(user_id, product_id,order_date, delivery_date, product_name, image, qauntity, total_amount, dstatus) values ('"+user_id+"', '"+product_id+"' ,'"+order_date+"', '"+delivery_date+"','"+product_name+"','"+image+"','"+quantity+"','"+total+"','Pending')");
                     out.println(insert1);
                     
                     
                     
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Payment Successful.. Order Confirmed');");
                     out.println("location='user/history.jsp';");
                     out.println("</script>");
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