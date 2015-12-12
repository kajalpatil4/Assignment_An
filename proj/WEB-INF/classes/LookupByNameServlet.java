//User logged in - lookup by number
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class LookupByNameServlet extends HttpServlet
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
			      
      Connection con = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      String lookupName = request.getParameter("LookupMemberName");
      
      out.println("<HTML>");
      out.println("<HEAD>");
      out.println("<TITLE>Searching for member: lookupName</TITLE>");
      out.println("</HEAD>");
      out.println("<BODY BGCOLOR='#EFEFEF'>");
      out.println("<H3><u>Searching for Member: " + lookupName + "</u></H3>");
      out.println("<CENTER>");
      
      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");
         
         stmt = con.createStatement();
         rs = stmt.executeQuery("SELECT * FROM userstable WHERE UserName='" + lookupName + "'");
         
         out.println("<TABLE BGCOLOR='#EFEFFF' CELLPADDING='2' CELLSPACING='4' BORDER='1'>");
         out.println("<TR BGCOLOR='#D6DFFF'>");
         out.println("<TD ALIGN='center'><B>Picture</B></TD>");
         out.println("<TD ALIGN='center'><B>User Name</B></TD>");
         out.println("<TD ALIGN='center'><B>Gender</B></TD>");
         out.println("<TD ALIGN='center'><B>City / State</B></TD>");
         out.println("<TD ALIGN='center'><B>Country</B></TD>");
         out.println("<TD ALIGN='center'><B>About User</B></TD>");
         out.println("<TD ALIGN='center'><B>User Profile</B></TD>");
         out.println("<TD ALIGN='center'><B>Add to Contact List</B></TD>");
         out.println("</TR>");
         
         int i = 0;
         String formName = "form";
         String buttonName = "button";
         
         while (rs.next()) {
            String picture = rs.getString("FileLocation");
            String user = rs.getString("UserName");
            String city = rs.getString("City");
            String state = rs.getString("State");
            String country = rs.getString("Country");
            String aboutUser = rs.getString("AboutMe1");
            String gender = rs.getString("Gender");
            
            formName += i;
            buttonName += i;
            
            out.println("<form name='" + formName + "' method='post' action='addContact'>");
            out.println("<TR>");
            out.println("<TD><img src='" + picture + "'</TD>");
            out.println("<TD>" + user + "</TD>");
            out.println("<TD>" + gender + "</TD>");
            out.println("<TD>" + city + " / " + state + "</TD>");
            out.println("<TD>" + country + "</TD>");
            
            out.println("<TD>" + aboutUser + "</TD>");
            out.println("<TD><A href='details.jsp?type=2&data=" + lookupName + "'><IMG SRC='images/detail.jpg'></A></TD>");
            out.println("<TD><input type='submit' value='Add to Contact List' name='" + buttonName + "'></TD>");
            out.println("<input type='hidden' value='" + user +"' name='hiddenUser'>");
            out.println("</TR>");
            
            i++;
         }
         out.println("</TABLE>");
      }
      catch (Exception e) {
         out.println("Could not connect to the users database.<P>");
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