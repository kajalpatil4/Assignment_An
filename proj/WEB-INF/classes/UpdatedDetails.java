//User logged in - Update details

import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class UpdatedDetails extends HttpServlet
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
      out.println("<TITLE>User Details Updated</TITLE>");
      out.println("</HEAD>");
      out.println("<BODY>");
      out.println("<CENTER>");
      
      	 String FileLocation="";
      	 /* I think the user does not need to change his/her birthdate - doesnt make sense to me - Yusuf
         int DOB_month=0;
         int DOB_day=0;
         int DOB_year=0;
         */
         String Email="";
         String Country="";
         String State="";
         String City="";
         String PostalCode="";
         String AboutMe1="";
         String StudiesEmphasis="";
         String RelocateFlag="";
         String Headline="";
         String Occupation="";
         String OccupationDescription="";
         String GrewUpIn="";
         String ZodiacSign="";
         String Languages="";
         String RelationshipType="";
         String MaritalStatus="";
         String HairColor="";
         String IncomeLevel="";
         String EducationLevel="";
         String BodyType="";
         String AppearanceImportance="";
         String Religion="";
         String EyeColor="";
         String Ethnicity="";
         String PoliticalOrientation="";
         String IntelligenceImportance="";
         String SmokingHabits="";
         String ActivityLevel="";
         String Custody="";
         String DrinkingHabits="";
         String MoreChildrenFlag="";
         String AboutMe2="";
         String PersonalityTrait="";
         String LeisureActivity="";
         String PerfectMatchEssay="";
         String Cuisine="";
         String Music="";
         String Reading="";
         String PerfectFirstDateEssay="";
         String EntertainmentLocation="";
         String PhysicalActivity="";
         String IdealRelationshipEssay="";
         String LearnFromThePastEssay="";
         
      Connection con = null;
      Statement stmt = null;

      try
      {
      		/* I think the user does not need to change his/her birthdate - doesnt make sense to me - Yusuf
            DOB_month = Integer.parseInt( request.getParameter("DOBmonth") );
            DOB_day = Integer.parseInt( request.getParameter("DOBday") );
            DOB_year = Integer.parseInt( request.getParameter("DOByear") );
            */
            FileLocation           = StringUtil.fixSqlFieldValue( request.getParameter("FileLocation") );
            Email                  = StringUtil.fixSqlFieldValue( request.getParameter("Email") );
            Country                = StringUtil.fixSqlFieldValue( request.getParameter("Country") );
            State                  = StringUtil.fixSqlFieldValue( request.getParameter("State") );
            City                   = StringUtil.fixSqlFieldValue( request.getParameter("City") );
            PostalCode             = StringUtil.fixSqlFieldValue( request.getParameter("PostalCode") );
            AboutMe1               = StringUtil.fixSqlFieldValue( request.getParameter("AboutMe1") );
            StudiesEmphasis        = StringUtil.fixSqlFieldValue( request.getParameter("StudiesEmphasis") );
            RelocateFlag           = StringUtil.fixSqlFieldValue( request.getParameter("RelocateFlag") );
            Headline               = StringUtil.fixSqlFieldValue( request.getParameter("Headline") );
            Occupation             = StringUtil.fixSqlFieldValue( request.getParameter("Occupation") );
            OccupationDescription  = StringUtil.fixSqlFieldValue( request.getParameter("OccupationDescription") );
            GrewUpIn               = StringUtil.fixSqlFieldValue( request.getParameter("GrewUpIn") );
            ZodiacSign             = StringUtil.fixSqlFieldValue( request.getParameter("ZodiacSign") );
            Languages              = StringUtil.fixSqlFieldValue( request.getParameter("Languages") );
            RelationshipType       = StringUtil.fixSqlFieldValue( request.getParameter("RelationshipType") );
            MaritalStatus          = StringUtil.fixSqlFieldValue( request.getParameter("MaritalStatus") );
            HairColor              = StringUtil.fixSqlFieldValue( request.getParameter("HairColor") );
            IncomeLevel            = StringUtil.fixSqlFieldValue( request.getParameter("IncomeLevel") );
            EducationLevel         = StringUtil.fixSqlFieldValue( request.getParameter("EducationLevel") );
            BodyType               = StringUtil.fixSqlFieldValue( request.getParameter("BodyType") );
            AppearanceImportance   = StringUtil.fixSqlFieldValue( request.getParameter("AppearanceImportance") );
            Religion               = StringUtil.fixSqlFieldValue( request.getParameter("Religion") );
            EyeColor               = StringUtil.fixSqlFieldValue( request.getParameter("EyeColor") );
            Ethnicity              = StringUtil.fixSqlFieldValue( request.getParameter("Ethnicity") );
            PoliticalOrientation   = StringUtil.fixSqlFieldValue( request.getParameter("PoliticalOrientation") );
            IntelligenceImportance = StringUtil.fixSqlFieldValue( request.getParameter("IntelligenceImportance") );
            SmokingHabits          = StringUtil.fixSqlFieldValue( request.getParameter("SmokingHabits") );
            ActivityLevel          = StringUtil.fixSqlFieldValue( request.getParameter("ActivityLevel") );
            Custody                = StringUtil.fixSqlFieldValue( request.getParameter("Custody") );
            DrinkingHabits         = StringUtil.fixSqlFieldValue( request.getParameter("DrinkingHabits") );
            MoreChildrenFlag       = StringUtil.fixSqlFieldValue( request.getParameter("MoreChildrenFlag") );
            AboutMe2               = StringUtil.fixSqlFieldValue( request.getParameter("AboutMe2") );
            PersonalityTrait       = StringUtil.fixSqlFieldValue( request.getParameter("PersonalityTrait") );
            LeisureActivity        = StringUtil.fixSqlFieldValue( request.getParameter("LeisureActivity") );
            PerfectMatchEssay      = StringUtil.fixSqlFieldValue( request.getParameter("PerfectMatchEssay") );
            Cuisine                = StringUtil.fixSqlFieldValue( request.getParameter("Cuisine") );
            Music                  = StringUtil.fixSqlFieldValue( request.getParameter("Music") );
            Reading                = StringUtil.fixSqlFieldValue( request.getParameter("Reading") );
            PerfectFirstDateEssay  = StringUtil.fixSqlFieldValue( request.getParameter("PerfectFirstDateEssay") );
            EntertainmentLocation  = StringUtil.fixSqlFieldValue( request.getParameter("EntertainmentLocation") );
            PhysicalActivity       = StringUtil.fixSqlFieldValue( request.getParameter("PhysicalActivity") );
            IdealRelationshipEssay = StringUtil.fixSqlFieldValue( request.getParameter("IdealRelationshipEssay") );
            LearnFromThePastEssay  = StringUtil.fixSqlFieldValue( request.getParameter("LearnFromThePastEssay") );
            
            if ( FileLocation == null || (FileLocation.trim()).equals("") )
               FileLocation = "images/nopicture.jpg";
         
         Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");
         
         stmt = con.createStatement();
         
         stmt.executeUpdate("UPDATE userstable SET FileLocation='" + FileLocation + "', Email='" + Email + "', Country='" + Country + "', State='" + State + "', City='" + City + "', PostalCode='" + PostalCode + "', AboutMe1='" + AboutMe1 + "', StudiesEmphasis='" + StudiesEmphasis + "', RelocateFlag='" + RelocateFlag + "', Headline='" + Headline + "', Occupation='" + Occupation + "', OccupationDescription='" + OccupationDescription + "', GrewUpIn='" + GrewUpIn + "', ZodiacSign='" + ZodiacSign + "', Languages='" + Languages + "', RelationshipType='" + RelationshipType + "', MaritalStatus='" + MaritalStatus + "', HairColor='" + HairColor + "', IncomeLevel='" + IncomeLevel + "', EducationLevel='" + EducationLevel + "', BodyType='" + BodyType + "', AppearanceImportance='" + AppearanceImportance + "', Religion='" + Religion + "', EyeColor='" + EyeColor + "', Ethnicity='" + Ethnicity + "', PoliticalOrientation='" + PoliticalOrientation + "', IntelligenceImportance='" + IntelligenceImportance + "', SmokingHabits='" + SmokingHabits + "', ActivityLevel='" + ActivityLevel + "', Custody='" + Custody + "', DrinkingHabits='" + DrinkingHabits + "', MoreChildrenFlag='" + MoreChildrenFlag + "', AboutMe2='" + AboutMe2 + "', PersonalityTrait='" + PersonalityTrait + "', LeisureActivity='" + LeisureActivity + "', PerfectMatchEssay='" + PerfectMatchEssay + "', Cuisine='" + Cuisine + "', Music='" + Music + "', Reading='" + Reading + "', PerfectFirstDateEssay='" + PerfectFirstDateEssay + "', EntertainmentLocation='" + EntertainmentLocation + "', PhysicalActivity='" + PhysicalActivity + "', IdealRelationshipEssay='" + IdealRelationshipEssay + "', LearnFromThePastEssay='" + LearnFromThePastEssay + "' WHERE UserName='" + userName + "'");
               
         out.println("<H2>Your profile has been updated successfully.</H2>");
      	 out.println("<H2><a href='loggedin'>Click Here</a> to go back</H2>");
      }
      catch (Exception e) 
      {
         out.println("ERROR - Could not update your profile.<P>");
         
         out.println("The error message was");
         out.println("<PRE>");
         out.println(e.getMessage());
         out.println("</PRE>");
      }
      finally
      {
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
