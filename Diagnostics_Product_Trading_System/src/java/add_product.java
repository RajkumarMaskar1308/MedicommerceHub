/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author prath
 */

@MultipartConfig(fileSizeThreshold=1024*1024*2, 
maxFileSize=1024*1024*10, 
maxRequestSize=1024*1024*50)


public class add_product extends HttpServlet {
    
    
    Connection cn=null;
    Statement st=null;
    
    private String getFileName(final Part part) 
    {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) 
        {
                if (content.trim().startsWith("filename")) 
                {
                    return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
                }
        }
    return null;
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out= resp.getWriter();
        
        HttpSession session=req.getSession();
        Part filePart = req.getPart("image");
        String product_name = req.getParameter("product_name");
        String manufacturer = req.getParameter("manufacturer");
        String manufactured_date = req.getParameter("manufactured_date");
        String type = req.getParameter("type");  
        String expire_date = req.getParameter("expire_date");
        String mrp = req.getParameter("mrp");
        String gst = req.getParameter("gst");
        String offer_price = req.getParameter("offer_price"); 
        String quantity = req.getParameter("quantity"); 
        String image = req.getParameter("image"); 
        
        out.println(product_name);
        out.println(manufacturer);
        out.println(manufactured_date);
        out.println(type); 
        out.println(expire_date);
        out.println(mrp); 
        out.println(gst);
        out.println(offer_price);
        out.println(image); 
        
          String photo="";
          String path="products";
          
          String path1 = "C:/Diagnostics_Product_Trading_System/web/images/products";
          
          File file=new File(path);
          file.mkdir();
          String fileName = getFileName(filePart);
          
          OutputStream out1 = null;
          InputStream filecontent = null;
            
          try 
          {
              
             
              
            out1 = new FileOutputStream(new File(path1 + File.separator + fileName));
            filecontent = filePart.getInputStream();
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = filecontent.read(bytes)) != -1) 
            {
                out1.write(bytes, 0, read);
                photo=path+"/"+fileName;
            }
                      
        
        Database db=new Database();
        String result=db.Connectdb();
        out.println(result);
        
        String event= req.getParameter("submit");
        out.println(event);
        
        if(event.equals("Logout"))
        {
            resp.sendRedirect("index.jsp");
        }
        
        if(event.equals("Add"))
         {
             
                 if(product_name.equals("")||manufacturer.equals("")||manufactured_date.equals("") || type.equals("") ||expire_date.equals("")||mrp.equals("")||gst.equals("") || offer_price.equals("") || photo.equals("")   )
                 {
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Some fields are Empty !');");
                     out.println("location='admin/add_product.jsp';");
                     out.println("</script>");

                 } 
                 else
                 {
                     String insert=db.Insert("insert into add_product(product_name,manufacturer,manufactured_date,type,expire_date,mrp,gst,offer_price,image,quantity )values('"+product_name+"','"+manufacturer+"','"+manufactured_date+"','"+type+"' ,'"+expire_date+"','"+mrp+"','"+gst+"','"+offer_price+"','"+photo+"','"+quantity+"' )");
                     out.println(insert);
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('Product Added Successfully');");
                     out.println("location='admin/add_product.jsp';");
                     out.println("</script>");
                                         
                 }
                      
         }
        
         }
         catch(Exception e)
         {
                     resp.setContentType("text/html");
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('File upload Error');");
                     out.println("location='admin/add_product.jsp';");
                     out.println("</script>");
         }
    }
    
}