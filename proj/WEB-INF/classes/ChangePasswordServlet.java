//change password if the user logged in

import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class ChangePasswordServlet extends HttpServlet
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
			
			String pswd = "";
			String oldPassword = request.getParameter("oldpass");
			String newPassword1 = request.getParameter("newpass1");
			String newPassword2 = request.getParameter("newpass2");
			
			Connection con = null;
      		Statement stmt = null;
      		ResultSet rs = null;
			
			//////////////////////////////////////////////
			// Display Messages for the user who logged in
			//////////////////////////////////////////////
			out.println("<HTML>");
      out.println("<HEAD>");
      out.println("<TITLE>Change password for user: " + userName + "</TITLE>");
      out.println("</HEAD>");
      out.println("<BODY BGCOLOR='#EFEFEF'>");
      
      out.println("<H3>Welcome " + userName + "</H3>");
       
      out.println("<CENTER>");
      
		
      
      try
      {
      	
      	 out.println("<form name='changePasswordForm' method='post'>");
         out.println("<p><table width=600 bgcolor='#FFFFEF' border='1' cellpadding='2' cellspacing='4'>");
         out.println("<tr bgcolor='#EFEFCE'>");
         out.println("   <td colspan='2'><b>Password Change Form</b></td>");
         out.println("</tr>");
         
         out.println("<TR>");
         out.println("<TD><b>Please Enter your old password: </b></TD>");
         out.println("<TD><input type='password' name='oldpass' value=''></TD>");
         out.println("</TR>");
            
         out.println("<TR>");
         out.println("<TD><b>Enter NEW password: </b></TD>");
         out.println("<TD><input type='password' name='newpass1' value=''></TD>");
         out.println("</TR>");
            
         out.println("<TR>");
         out.println("<TD><b>Enter NEW password again: </b></TD>");
         out.println("<TD><input type='password' name='newpass2' value=''></TD>");
         out.println("</TR>");
         
         Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");
         
         stmt = con.createStatement();
         
         rs = stmt.executeQuery("SELECT UserPassword FROM userstable WHERE UserName='" + userName + "'");
         out.println("<TR>");
         out.println("<TD COLSPAN='6' ALIGN='center'><input type='submit' value='Change Password'></TD>");
         out.println("</TR>");
         
         out.println("</TABLE>");
         out.println("</FORM>");
            
         while (rs.next())
         {
             pswd = rs.getString("UserPassword");
         }
         
         if (oldPassword == null)
			throw new RuntimeException("Old password NOT specified");
			
		if (newPassword1 == null)
			throw new RuntimeException("New password NOT specified");
			
		if (newPassword1 == null)
			throw new RuntimeException("New password MUST be entered twice");

		oldPassword = oldPassword.trim();
			
		if (oldPassword.equals(""))
			throw new RuntimeException("Old password CANNOT be blank");
				
		newPassword1 = newPassword1.trim();
			
		if (newPassword1.equals(""))
			throw new RuntimeException("New Password cannot be blank");
			
		newPassword2 = newPassword2.trim();
			
		if (newPassword2.equals(""))
			throw new RuntimeException("New password MUST be entered twice and cannot be blank");
			
		if (! newPassword1.equals(newPassword2))
			throw new RuntimeException("Passwords entered do NOT match");
         
         if (! pswd.equals(oldPassword))
			throw new RuntimeException("Password incorrect - couldnt login to make changes - try again");
			
		stmt.executeUpdate("UPDATE userstable SET UserPassword='" + newPassword1 + "' WHERE UserName='" + userName + "'");
         
         out.println("<H2><U>Password changed successfully.</U></H2>");
         out.println("<H2><a href='loggedin'>Click Here</a> to go back</H2>");
         out.println("<BR><BR>");
      }
      catch (Exception e)
      {
         out.println("<H2><U>Enter fields to update password.</U></H2>");
         out.println("<PRE>");
         out.println(e.getMessage());
         out.println("</PRE>");
      }
      finally
      {
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
			out.println("alert(\"ERROR: " + e .getMessage() + "\");");
			out.println("</script>");
			
			log(e.getMessage());
			return;
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}
}