<%@ page session="false" %>
<%@ page import="java.sql.*" %>


<%
		
		/*try
		{
*/
			//////////////////////////////////////////////
			// Display Messages for the user who logged in
			//////////////////////////////////////////////
			out.println("<HTML>");
                        out.println("<HEAD>");
                        out.println("<TITLE>User Details Updated</TITLE>");
                        out.println("</HEAD>");
                        out.println("<BODY>");
                        out.println("<CENTER>");
      
                      //Connection con = null;
                      //Statement stmt = null;
                    
                    String Country="";  
                    String userName = "yusuf";
                    String FileLocation="";
                    int UserID=0;
  int DBmonth=0;
//String DOBmonth="";
                     int DBday=0;
                     int DByear=0;
                     int age=0;
                     String Email="";
                    
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
                      String test="t";

                      //try
                      //{
						/*
						Class.forName("com.mysql.jdbc.Driver").newInstance();
                         con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");
                         stmt = con.createStatement();

						*/
                            FileLocation = request.getParameter("FileLocation");
                            //UserID = Integer.parseInt( request.getParameter("UserID") );
                            DBmonth = Integer.parseInt( request.getParameter("DOBmonth") );
                            DBday = Integer.parseInt( request.getParameter("DOBday") );
                            DByear = Integer.parseInt( request.getParameter("DOByear") );
                            //age = Integer.parseInt( request.getParameter("age") );
                            Email = request.getParameter("Email");
                            Country = request.getParameter("Country");
                            
                            test = request.getParameter("Country");
                            
                            State = request.getParameter("State");
                            City = request.getParameter("City");
                            PostalCode = request.getParameter("PostalCode");
                            AboutMe1 = request.getParameter("AboutMe1");
                            StudiesEmphasis = request.getParameter("StudiesEmphasis");
                            RelocateFlag = request.getParameter("RelocateFlag");
                            Headline = request.getParameter("Headline");
                            Occupation = request.getParameter("Occupation");
                            OccupationDescription = request.getParameter("OccupationDescription");
                            GrewUpIn = request.getParameter("GrewUpIn");
                            ZodiacSign = request.getParameter("ZodiacSign");
                            Languages = request.getParameter("Languages");
                            RelationshipType = request.getParameter("RelationshipType");
                            MaritalStatus = request.getParameter("MaritalStatus");
                            HairColor = request.getParameter("HairColor");
                            IncomeLevel = request.getParameter("IncomeLevel");
                            EducationLevel = request.getParameter("EducationLevel");
                            BodyType = request.getParameter("BodyType");
                            AppearanceImportance = request.getParameter("AppearanceImportance");
                            Religion = request.getParameter("Religion");
                            EyeColor = request.getParameter("EyeColor");
                            Ethnicity = request.getParameter("Ethnicity");
                            PoliticalOrientation = request.getParameter("PoliticalOrientation");
                            IntelligenceImportance = request.getParameter("IntelligenceImportance");
                            SmokingHabits = request.getParameter("SmokingHabits");
                            ActivityLevel = request.getParameter("ActivityLevel");
                            Custody = request.getParameter("Custody");
                            DrinkingHabits = request.getParameter("DrinkingHabits");
                            MoreChildrenFlag = request.getParameter("MoreChildrenFlag");
                            AboutMe2 = request.getParameter("AboutMe2");
                            PersonalityTrait = request.getParameter("PersonalityTrait");
                            LeisureActivity = request.getParameter("LeisureActivity");
                            PerfectMatchEssay = request.getParameter("PerfectMatchEssay");
                            Cuisine = request.getParameter("Cuisine");
                            Music = request.getParameter("Music");
                            Reading = request.getParameter("Reading");
                            PerfectFirstDateEssay = request.getParameter("PerfectFirstDateEssay");
                            EntertainmentLocation = request.getParameter("EntertainmentLocation");
                            PhysicalActivity = request.getParameter("PhysicalActivity");
                            IdealRelationshipEssay = request.getParameter("IdealRelationshipEssay");
                            LearnFromThePastEssay = request.getParameter("LearnFromThePastEssay");

/*
                         stmt.executeUpdate("UPDATE userstable SET FileLocation='" + FileLocation + "', DOBmonth=" + DOBmonth + ", DOBday=" + DOBday + ", DOByear=" + DOByear + ", Email='" + Email + "', Country='" + Country + "', State='" + State + "', City='" + City + "', PostalCode='" + PostalCode + "', AboutMe1='" + AboutMe1 + "', StudiesEmphasis='" + StudiesEmphasis + "', RelocateFlag='" + RelocateFlag + "', Headline='" + Headline + "', Occupation='" + Occupation + "', OccupationDescription='" + OccupationDescription + "', GrewUpIn='" + GrewUpIn + "', ZodiacSign='" + ZodiacSign + "', Languages='" + Languages + "', RelationshipType='" + RelationshipType + "', MaritalStatus='" + MaritalStatus + "', HairColor='" + HairColor + "', IncomeLevel='" + IncomeLevel + "', EducationLevel='" + EducationLevel + "', BodyType='" + BodyType + "', AppearanceImportance='" + AppearanceImportance + "', Religion='" + Religion + "', EyeColor='" + EyeColor + "', Ethnicity='" + Ethnicity + "', PoliticalOrientation='" + PoliticalOrientation + "', 	IntelligenceImportance='" + IntelligenceImportance + "', SmokingHabits='" + SmokingHabits + "', ActivityLevel='" + ActivityLevel + "', Custody='" + Custody + "', DrinkingHabits='" + DrinkingHabits + "', MoreChildrenFlag='" + MoreChildrenFlag + "', AboutMe2='" + AboutMe2 + "', PersonalityTrait='" + PersonalityTrait + "', LeisureActivity='" + LeisureActivity + "', PerfectMatchEssay='" + PerfectMatchEssay + "', Cuisine='" + Cuisine + "', Music='" + Music + "', Reading='" + Reading + "', PerfectFirstDateEssay='" + PerfectFirstDateEssay + "', EntertainmentLocation='" + EntertainmentLocation + "', PhysicalActivity='" + PhysicalActivity + "', IdealRelationshipEssay='" + IdealRelationshipEssay + "', LearnFromThePastEssay='" + LearnFromThePastEssay + "' WHERE UserName='" + userName + "'");

                         out.println("<H2>Your profile has been updated successfully.</H2>");
                         out.println("<H2><a href='loggedin'>Click Here</a> to go back</H2>");
                      }
                      catch (Exception e)
                      {
                         out.println("ERROR - Could not update your profile.<P>");

                         ////////////////////////////////////
*/
                         out.println("<H1>1</H1>");
                           out.println("<p>test: " + test);
                         out.println("<p>FileLocation: " + FileLocation);
                         out.println("<p>UserID: " + UserID);
                         //out.println("<p>DOBmonth: " + DOBmonth);
out.println("<p>DOBmonth: " + DBmonth);
                         out.println("<p>DOBday: " + DBday);
                         out.println("<p>DOByear: " + DByear);
                         out.println("<p>age: " + age);
                         out.println("<p>Email: " + Email);
                         out.println("<p>Country: " + Country);
                         out.println("<p>State: " + State);
                         out.println("<p>City: " + City);
                         out.println("<p>PostalCode: " + PostalCode);
                         out.println("<p>AboutMe1: " + AboutMe1);
                         out.println("<p>StudiesEmphasis: " + StudiesEmphasis);
                         out.println("<p>RelocateFlag: " + RelocateFlag);
                         out.println("<p>Headline: " + Headline);
                         out.println("<p>Occupation: " + Occupation);
                         out.println("<p>OccupationDescription: " + OccupationDescription);
                         out.println("<p>GrewUpIn: " + GrewUpIn);
                         out.println("<p>ZodiacSign: " + ZodiacSign);
                         out.println("<p>Languages: " + Languages);
                         out.println("<p>RelationshipType: " + RelationshipType);
                         out.println("<p>MaritalStatus: " + MaritalStatus);
                         out.println("<p>HairColor: " + HairColor);
                         out.println("<p>IncomeLevel: " + IncomeLevel);
                         out.println("<p>EducationLevel: " + EducationLevel);
                         out.println("<p>BodyType" + BodyType);
                         out.println("<p>AppearanceImportance: " + AppearanceImportance);
                         out.println("<p>Religion: " + Religion);
                         out.println("<p>EyeColor: " + EyeColor);
                         out.println("<p>Ethnicity: " + Ethnicity);
                         out.println("<p>PoliticalOrientation: " + PoliticalOrientation);
                         out.println("<p>IntelligenceImportance: " + IntelligenceImportance);
                         out.println("<p>SmokingHabits: " + SmokingHabits);
                         out.println("<p>ActivityLevel: " + ActivityLevel);
                         out.println("<p>Custody: " + Custody);
                         out.println("<p>DrinkingHabits: " + DrinkingHabits);
                         out.println("<p>MoreChildrenFlag: " + MoreChildrenFlag);
                         out.println("<p>AboutMe2: " + AboutMe2);
                         out.println("<p>PersonalityTrait: " + PersonalityTrait);
                         out.println("<p>LeisureActivity: " + LeisureActivity);
                         out.println("<p>PerfectMatchEssay: " + PerfectMatchEssay);
                         out.println("<p>Cuisine: " + Cuisine);
                         out.println("<p>Music: " + Music);
                         out.println("<p>Reading: " + Reading);
                         out.println("<p>PerfectFirstDateEssay: " + PerfectFirstDateEssay);
                         out.println("<p>EntertainmentLocation: " + EntertainmentLocation);
                         out.println("<p>PhysicalActivity: " + PhysicalActivity);
                         out.println("<p>IdealRelationshipEssay: " + IdealRelationshipEssay);
                         out.println("<p>LearnFromThePastEssay: " + LearnFromThePastEssay);

                         ////////////////////////////////////
/*
                         out.println("The error message was");
                         out.println("<PRE>");
                         out.println(e.getMessage());
                         out.println("</PRE>");
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
*/	
%>