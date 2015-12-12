import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class UserMessages extends HttpServlet
{
   /**
   * Handles a GET request
   * @param request the servlet request object
   * @param response the servlet response object
   * @exception ServletException if a servlet exception occurs
   * @exception IOException if an I/O exception occurs
   */
   public void doGet(
         HttpServletRequest request,
         HttpServletResponse response)
      throws ServletException, IOException
   {
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();

      out.println("<HTML>");
      out.println("<HEAD>");
      out.println("<TITLE>User Messages</TITLE>");
      out.println("</HEAD>");
      out.println("<BODY>");
      out.println("<CENTER>");
      
      Connection con = null;
      Statement stmt = null;
      ResultSet rs = null;
      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");
         
         stmt = con.createStatement();
         rs = stmt.executeQuery("SELECT * FROM messages WHERE userName='Yusuf' ORDER BY messageID");
               
         out.println("<TABLE CELLPADDING='5' CELLSPACING='5' BORDER='1'>");
         out.println("<TR BGCOLOR='cyan'>");
         out.println("<TD><B>Message ID</B></TD>");
         out.println("<TD><B>From</B></TD>");
         out.println("<TD><B>Message</B></TD>");
         out.println("<TD><B>Date</B></TD>");
         out.println("</TR>");
         
         int nRows = 0;
         while (rs.next()) {
            nRows++;
            String messageID = rs.getString("messageID");
            String fromUser = rs.getString("fromUser");
            String message = rs.getString("message");
            String messageDate = rs.getString("messageDate");
            
            out.println("<TR>");
            out.println("<TD>" + messageID + "</TD>");
            out.println("<TD>" + fromUser + "</TD>");
            out.println("<TD>" + message + "</TD>");
            out.println("<TD>" + messageDate + "</TD>");
            out.println("</TR>");
         }
         
         out.println("</TABLE>");
         
         out.println("<P>You have " + nRows + " messages.<P>");
      }
      catch (Exception e) {
         out.println
         ("Could not connect to the users database.<P>");
         out.println("The error message was");
         out.println("<PRE>");
         out.println(e.getMessage());
         out.println("</PRE>");
      }
      finally {
         if (rs != null) {
            try { rs.close(); }
            catch (SQLException ignore) {}
         }
         if (stmt != null) {
            try { stmt.close(); }
            catch (SQLException ignore) {}
         }
         if (con != null) {
            try { con.close(); }
            catch (SQLException ignore) {}
         }
      }

	  out.println("</CENTER>");
      out.println("</BODY>");
      out.println("</HTML>");
   }

   /**
   * Handles a POST request
   * @param request the servlet request object
   * @param response the servlet response object
   * @exception ServletException if a servlet exception occurs
   * @exception IOException if an I/O exception occurs
   */
   public void doPost(
         HttpServletRequest request,
         HttpServletResponse response)
      throws ServletException, IOException
   {
      doGet(request, response);
   }
}
