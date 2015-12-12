//User logged in - show him/her messages and allow to make a search

import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class ViewContactServlet extends HttpServlet
{
	public static final String PREFIX = "session.login";
	public static final String ACCOUNT = PREFIX + ".account";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(true);
		
		try
		{
			Object accountObject = session.getValue(ACCOUNT);
			
			// If no account object was put in the session, or
			// if one exists but it is not a hashtable, then
			// redirect the user to the original login page
			
			if (accountObject == null)
				throw new RuntimeException("You need to log in to use this service!");
				
			if (!(accountObject instanceof Hashtable))
				throw new RuntimeException("You need to log in to use this service!");
				
			Hashtable account = (Hashtable) accountObject;
			
			String userName = (String) account.get("name");
			
			//////////////////////////////////////////////
			// Display Messages for the user who logged in
			//////////////////////////////////////////////
			out.println("<HTML>");
      out.println("<HEAD>");
      out.println("<TITLE>Contacts for " + userName + "</TITLE>");
      out.println("</HEAD>");
      out.println("<BODY BGCOLOR='#EFEFEF'>");
      out.println("<H3>Welcome " + userName + "</H3>");
            
      out.println("<CENTER>");
      
      Connection con = null;
      Statement stmt = null;
      ResultSet rs = null;
      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");
         
         stmt = con.createStatement();
         rs = stmt.executeQuery("SELECT * FROM contacts WHERE userName='" + userName + "' ORDER BY contactID");
               
         out.println("<form name='deleteContactsForm' method='post' action='deleteContact'>");
         
         out.println("<TABLE BGCOLOR='#EFEFFF' CELLPADDING='2' CELLSPACING='4' BORDER='1'>");
         out.println("<TR BGCOLOR='#D6DFFF'>");
         out.println("<TD ALIGN='center'><B>Contact ID</B></TD>");
         out.println("<TD ALIGN='center'><B>Contact Name</B></TD>");
         out.println("<TD ALIGN='center'><B>Comment</B></TD>");
         out.println("<TD ALIGN='center'><B>Date</B></TD>");
         out.println("<TD ALIGN='center'><B>Delete Contacts</B></TD>");
         out.println("</TR>");
         
         int nRows = 0;
         while (rs.next()) {
            nRows++;
            String messageID = rs.getString("contactID");
            String fromUser = rs.getString("contactName");
            String message = rs.getString("comments");
            String messageDate = rs.getString("dateAdded");
            
            out.println("<TR>");
            out.println("<TD>" + messageID + "</TD>");
            out.println("<TD>" + fromUser + "</TD>");
            out.println("<TD>" + message + "</TD>");
            out.println("<TD>" + messageDate + "</TD>");
            out.println("<TD><input type='checkbox' name='msgList' value='" + messageID + "'> Delete</TD>");
            out.println("</TR>");
         }
         
         out.println("<TR>");
         out.println("<TD COLSPAN='6' ALIGN='center'><input type='submit' value='Delete Selected Contacts'></TD>");
         out.println("</TR>");
         
         out.println("</TABLE>");
         out.println("</FORM>");         
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
		catch (RuntimeException e)
		{
			out.println("<script language=\"javascript\">");
			out.println("alert(\"You need to log in to use this service!\");");
			out.println("</script>");
			
			out.println("<a href='index.html'>Click Here</a> to go to the main page.<br><br>");
			
			out.println("Or Click on the button to exit<FORM><INPUT onClick=\"javascipt:window.close()\" TYPE=\"BUTTON\" VALUE=\"Close Browser\" TITLE=\"Click here to close window\" NAME=\"CloseWindow\" STYLE=\"font-family:Verdana, Arial, Helvetica; font-size:smaller; font-weight:bold\"></FORM>");
			
			log(e.getMessage());
			return;
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}
}
