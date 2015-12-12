//User logged in - let him/her send message

import java.io.*;
import java.net.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddContactServlet extends HttpServlet
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
			String contactName = request.getParameter("hiddenUser");
			
			//////////////////////////////////////////////
			// Send Messages for the user who logged in
			//////////////////////////////////////////////
			out.println("<HTML>");
      		out.println("<HEAD>");
      		out.println("<TITLE>Add to Contact List</TITLE>");
      		out.println("</HEAD>");
      		out.println("<BODY>");

      		out.println("<h2><font face='Verdana, Arial, Helvetica, sans-serif'>Add Contact Form</font></h2>");
      		out.println("<form name='addContactForm' method='post' action='addContactProcess'>");
      		out.println("<input type='hidden' name='hiddenUser' value='" + contactName + "'>");

      		out.println("<table width='610' border='1' bgcolor='#EFEFEF' cellpadding='2' cellspacing='0' bordercolor='#EFEFEF' bordercolorlight='#EFEFEF' bordercolordark='#CCCCCC'>");
	      		out.println("<tr nowrap>");
		      		out.println("<td align='left' width='29%' height='2' valign='baseline' bgcolor='#EFEFEF'>");
			      		out.println("<div align='left'><b><font size='2' face='Verdana, Arial, Helvetica, sans-serif'>Contact to be Added</font></b></div>");
		      		out.println("</td>");
	
		      		out.println("<td width='71%' height='2' valign='baseline'>");
			      		out.println("<b>" + contactName + "</b>");
		      		out.println("</td>");
	      		out.println("</tr>");
	
	      		out.println("<tr nowrap>");
		      		out.println("<td align='left' width='29%' height='82' valign='top' bgcolor='#EFEFEF'>");
			      		out.println("<b><font face='Verdana, Arial, Helvetica, sans-serif' size='2'>Comments:&nbsp;</font></b>");
		      		out.println("</td>");
		      		out.println("<td width='71%' height='82' valign='top' bgcolor='#FFFFFF'>");
			      		out.println("<textarea name='message' cols='58' rows='7' wrap='VIRTUAL'></textarea>");
			      		out.println("<br><font size='2'>Enter up to 4000 characters. HTML cannot be displayed.</font>");
		      		out.println("</td>");
	      		out.println("</tr>");
      		out.println("</table>");
      		
      		out.println("<p><input type='submit' value='Add contact'>&nbsp;&nbsp;&nbsp;&nbsp;");
         		out.println("<input type='reset' value='Clear form'>");
      		out.println("</p>");

      		out.println("</form>");
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
