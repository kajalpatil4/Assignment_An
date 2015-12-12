//User logged in - lookup by number

import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class QuickSearchServlet extends HttpServlet
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
      
      String gender1 = request.getParameter("SeekingGenderID");
      String gender2 = request.getParameter("GenderID");
      int ageMin;
      String age1 = request.getParameter("MinAge");
      int ageMax;
      String age2 = request.getParameter("MaxAge");
      String country = request.getParameter("CountryRegionID");
      String state = request.getParameter("stateName");
      String city = request.getParameter("cityName");
      
		///////////////////////////////////////////////////////////////////////
		//if agemin and age max NOT specified, set agemin=0 and age max=100  //
		//or I could have changed the query not to include between selection //
		///////////////////////////////////////////////////////////////////////

		if ( age1 == null || (age1.trim()).equals("") )
			ageMin = 0;
		else
			ageMin = Integer.parseInt(age1);
		
		if ( age2 == null || (age2.trim()).equals("") )
			ageMax = 100;
		else
			ageMax = Integer.parseInt(age2);
		///////////////////////////////////////////////////////////////////////
		
      out.println("<HTML>");
      out.println("<HEAD>");
      out.println("<TITLE>Searching for member: lookupName</TITLE>");
      out.println("</HEAD>");
      out.println("<BODY BGCOLOR='#EFEFEF'>");
      out.println("<H3><u>Searching for Members between the ages of " + ageMin + " and " + ageMax + "</u></H3>");
      out.println("<CENTER>");
      
      try {
         	Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");
         
         stmt = con.createStatement();
         
         ///////////////////////////////////////////////////////////////////////////////////////
         rs = stmt.executeQuery("SELECT * FROM userstable WHERE (age BETWEEN " + ageMin + " AND " + ageMax + ") AND (Gender='" + gender1 + "' AND SeekingGender='" + gender2 + "') AND (Country='" + country + "' AND State='" + state + "' AND City='" + city + "')");
         
         out.println("<TABLE BGCOLOR='#EFEFFF' CELLPADDING='2' CELLSPACING='4' BORDER='1'>");
         out.println("<TR BGCOLOR='#D6DFFF'>");
         out.println("<TD ALIGN='center'><B>Picture</B></TD>");
         out.println("<TD ALIGN='center'><B>User Name</B></TD>");
         out.println("<TD ALIGN='center'><B>Gender</B></TD>");
         out.println("<TD ALIGN='center'><B>City / State</B></TD>");
         out.println("<TD ALIGN='center'><B>Country</B></TD>");
         out.println("<TD ALIGN='center'><B>About User</B></TD>");
         out.println("<TD ALIGN='center'><B>User Profile</B></TD>");
         out.println("</TR>");
         
         while (rs.next()) {
            String picture = rs.getString("FileLocation");
            String user = rs.getString("UserName");
            String aboutUser = rs.getString("AboutMe1");
            String gender = rs.getString("Gender");
            
            
            out.println("<TR>");
            out.println("<TD><img src='" + picture + "'</TD>");
            out.println("<TD>" + user + "</TD>");
            out.println("<TD>" + gender + "</TD>");
            out.println("<TD>" + city + " / " + state + "</TD>");
            out.println("<TD>" + country + "</TD>");
            
            out.println("<TD>" + aboutUser + "</TD>");
            out.println("<TD><A href='details.jsp?type=2&data=" + user + "'><IMG SRC='images/detail.jpg'></A></TD>");
            out.println("</TR>");
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