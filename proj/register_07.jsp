<%@ page session="false" %>
<%@ page import="java.sql.*" %>

<html>
<head>
	<title>CSE220 Final Project</title>
	<META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=windows-1252">
	<script language="JavaScript" src="javascript/matchnet.js"></script>
	<script language="JavaScript" src="javascript/region3.js"></script>
	<script language="JavaScript" src="im/im.js"></script>
	<link rel="stylesheet" type="text/css" href="lib/css/as.css">
	<link rel="stylesheet" type="text/css" href="lib/css/common.css">

</head>
<body marginheight=0 marginwidth=0 topmargin=0 leftmargin=0 text="#000000" bgcolor="#ffffff"  >

<%
   try
   {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      System.out.println("JDBC driver loaded");
   }
   catch (ClassNotFoundException e)
   {
      System.out.println(e.toString());
   }

   String userName = request.getParameter( "UserName" );
   String password = request.getParameter( "Password" );
   int dobMonth = Integer.parseInt(request.getParameter( "BirthDate_day" ));
   int dobDay = Integer.parseInt(request.getParameter( "BirthDate_day" ));
   int dobYear = Integer.parseInt(request.getParameter( "BirthDate_year" ));
   int age = 2003 - dobYear;
   String lastLogin = (new java.util.Date()).toString();
   String email = request.getParameter( "Email" );
   String gender = request.getParameter( "GenderID" );
   String seekingGender = request.getParameter( "SeekingGenderID" );
   String country = request.getParameter( "CountryRegionID" );
   String state = request.getParameter( "State" );
   String city = request.getParameter( "City" );
   String zip = request.getParameter( "PostalCode" );
   String aboutMe1 = request.getParameter( "AboutMe1" );
   String pictureURL = request.getParameter( "TFileID" );

   if ( pictureURL == null || (pictureURL.trim()).equals("") )
      pictureURL = "images/nopicture.jpg";

   String height = request.getParameter( "Height" );
   int intHeight = Integer.parseInt(height);

   String weight = request.getParameter( "Weight" );
   int intWeight = Integer.parseInt(weight) / 1000;   //convert grams to kg

   String study = request.getParameter( "StudiesEmphasis" );
   String relocate = request.getParameter( "RelocateFlag" );
   String headline = request.getParameter( "Headline" );
   String occupation = request.getParameter( "IndustryType" );
   String occupationDescription = request.getParameter( "OccupationDescription" );
   String grewUpIn = request.getParameter( "GrewUpIn" );
   String zodiacSign = request.getParameter( "Zodiac" );
   String languages = request.getParameter( "Languages" );
   String relationType = request.getParameter( "RelationshipType" );
   String maritalStatus = request.getParameter( "MaritalStatus" );
   String hairColor = request.getParameter( "HairColor" );
   String income = request.getParameter( "IncomeLevel" );
   String education = request.getParameter( "EducationLevel" );
   String bodyType = request.getParameter( "BodyType" );
   String appearanceImportance = request.getParameter( "AppearanceImportance" );
   String religion = request.getParameter( "Religion" );
   String eyes = request.getParameter( "EyeColor" );
   String ethnicity = request.getParameter( "Ethnicity" );
   String politics = request.getParameter( "PoliticalOrientation" );
   String intelligenceImportance = request.getParameter( "IntelligenceImportance" );
   String smoking = request.getParameter( "SmokingHabits" );
   String activity = request.getParameter( "ActivityLevel" );
   String hasChildren = request.getParameter( "Custody" );
   String drinking = request.getParameter( "DrinkingHabits" );
   String wantsChildren = request.getParameter( "MoreChildrenFlag" );
   String aboutMe2 = request.getParameter( "AboutMe2" );
   String personalityTrait = request.getParameter( "PersonalityTrait" );
   String leisure = request.getParameter( "LeisureActivity" );
   String aboutMatch = request.getParameter( "PerfectMatchEssay" );
   String cuisineTypes = request.getParameter( "Cuisine" );
   String musicTypes = request.getParameter( "Music" );
   String readingWhat = request.getParameter( "Reading" );
   String firstDate = request.getParameter( "PerfectFirstDateEssay" );

   String[] entertainmentArray = request.getParameterValues("EntertainmentLocation");
   String entertainmentLocation = "";

   for (int i=0; i < entertainmentArray.length; i++)
      entertainmentLocation += entertainmentArray[i] + ", ";


   String[] phyActivityArray = request.getParameterValues("PhysicalActivity");
   String phyActivity = "";

   for (int i=0; i < phyActivityArray.length; i++)
      phyActivity += phyActivityArray[i] + ", ";

   String idealRelationship = request.getParameter( "IdealRelationshipEssay" );

   String learnFromThePast = request.getParameter( "LearnFromThePastEssay" );

   String sql = "INSERT INTO userstable(UserName, UserPassword, DOBmonth, DOBday, DOByear, age, lastLoginDate, Email, Gender, SeekingGender, Country, State, City, PostalCode, AboutMe1, FileLocation, Height, Weight, StudiesEmphasis, RelocateFlag, Headline, Occupation, OccupationDescription, GrewUpIn, ZodiacSign, Languages, RelationshipType, MaritalStatus, HairColor, IncomeLevel, EducationLevel, BodyType, AppearanceImportance, Religion, EyeColor, Ethnicity, PoliticalOrientation, IntelligenceImportance, SmokingHabits, ActivityLevel, Custody, DrinkingHabits, MoreChildrenFlag, AboutMe2, PersonalityTrait, LeisureActivity, PerfectMatchEssay, Cuisine, Music, Reading, PerfectFirstDateEssay, EntertainmentLocation, PhysicalActivity, IdealRelationshipEssay, LearnFromThePastEssay) VALUES('" + userName + "', '" + password + "', " + dobMonth + ", " + dobDay + ", " + dobYear + ", " + age + ", '" + lastLogin + "', '" + email + "', '" + gender + "', '" + seekingGender + "', '" + country +"', '" + state + "', '" + city + "', '" + zip + "', '" + aboutMe1 + "', '" + pictureURL + "', " + intHeight + "," + intWeight + ", '" + study + "', '" + relocate + "', '" + headline + "', '" + occupation + "','" + occupationDescription + "', '" + grewUpIn + "', '" + zodiacSign + "', '" + languages + "', '" + relationType + "', '" + maritalStatus + "', '" + hairColor + "', '" + income + "', '" + education + "', '" + bodyType + "', '" + appearanceImportance + "', '" + religion + "', '" + eyes + "', '" + ethnicity + "', '" + politics + "', '" + intelligenceImportance + "', '" + smoking + "', '" + activity + "', '" + hasChildren + "', '" + drinking + "', '" + wantsChildren + "', '" + aboutMe2 + "', '" + personalityTrait + "', '" + leisure + "', '" + aboutMatch + "', '" + cuisineTypes + "', '" + musicTypes + "', '" + readingWhat + "', '" + firstDate + "', '" + entertainmentLocation + "', '" + phyActivity + "', '" + idealRelationship + "', '" + learnFromThePast + "')";
  
   try
   {
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");

      Statement s = con.createStatement();
      
      s.executeUpdate(sql);

      s.close();

     con.close();
   }
   catch (SQLException e)
   {
         out.println("<H2>ERROR: </H2>");
         out.println(e.getMessage());
   }
   catch (Exception e)
   {
         out.println("<H2>ERROR: </H2>");
         out.println(e.getMessage());
   }
%>

<%
out.println("<script language=\"javascript\">");
out.println("alert(\"Your profile has been created successfully!\");");
out.println("</script>");
			
out.println("<a href='index.html'>Click Here</a> to go to the main page to log in.<br><br>");
out.println("Or Click on the button to exit<FORM><INPUT onClick=\"javascipt:window.close()\" TYPE=\"BUTTON\" VALUE=\"Close Browser\" TITLE=\"Click here to close window\" NAME=\"CloseWindow\" STYLE=\"font-family:Verdana, Arial, Helvetica; font-size:smaller; font-weight:bold\"></FORM>");
%>

<br><table cellpadding="0" cellspacing="0" >
   <tr>
      <td colspan="3"></td>
   </tr>

   <tr>
      <td><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=15 height=1></td>
      <td>
         <table width="600" cellpadding="0" cellspacing="0">
            <tr>
               <td colspan="3">&nbsp;</td>
            </tr>

            <tr>
               <td colspan="3" bgcolor="#D0CFC4"></td>
            </tr>

            <tr>
               <td width="350" bgColor="#D0CFC4">
                  <table cellpadding="0" width="350" cellspacing="0" >
                     <tr>
                        <td align="center"><img src='<%= pictureURL %>'></td>
                     </tr>

                     <tr>
                        <td align="center"></td>
                     </tr>
                  </table>
               </td>
               
               <td bgColor="#F8F8F2"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=5 height=5></td>
               <td height="100%" bgColor="#F8F8F2">
                  <table height="100%" cellpadding="0" cellspacing="0" >
                     <tr>
                        <td class="stdbold" valign="top" align="left"><span style="{color: #962a2a}"><%= userName %></span></td>
                     </tr>

                     <tr>
                        <td colspan="2"><%= maritalStatus %>&nbsp;<%= gender %> seeking <%= seekingGender %><BR>was born in <%= dobYear %><br>from <%= city %>, <%= state %>, <%= country %></td>
			<td bgcolor="#FFF1DB" align="right"></td>
		     </tr>

                     <tr>
                        <td colspan="2"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=5 height=5></td>
                     </tr>

                     <tr>
                        <td class="bold" colspan="2"><span style="{color: #962a2a}">About Me</span></td>
                     </tr>

                     <tr>
                        <td colspan="2" height="1" bgcolor="#D0CFC4"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=1></td>
                     </tr>

                     <tr>
                        <td colspan="2">
                           <table width="100%" cellpadding="0" cellspacing="0" ><%= aboutMe1 %><a href="#aboutme">more</a>
                              <tr>
                                 <td class="default"></td>
                              </tr>
                           </table>
	                </td>
                     </tr>

                     <tr>
                        <td colspan="2"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=5 height=10></td>
                     </tr>
                     
                     <tr>
                        <td class="bold" colspan="2">&nbsp;</td>
                     </tr>
                     
                     <tr>
                        <td colspan="2" height="1" bgcolor="#D0CFC4"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=1></td>
                     </tr>

                     <tr>
                        <td colspan="2">
                           <table align="left" cellpadding="0" cellspacing="0" >
                              <tr>
                                 <td valign="top" width="70" align="left">&nbsp;</td>
                                 <td valign="top" width="70" align="left">&nbsp;</td>
                                 <td valign="top" width="70" align="left">&nbsp;</td>
                              </tr>
                           </table>
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>

            <tr>
               <td bgcolor="white" colspan="3"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=3></td>
            </tr>

            <tr>
               <td bgcolor="#D0CFC4" colspan="3"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=1></td>
            </tr>

            <tr>
               <td bgcolor="#D0CFC4" colspan="3"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=1></td>
            </tr>

            <tr>
               <td colspan="3" align="left" border="0" valign="middle">&nbsp;</td>
            </tr>
         </table>

         <table cellpadding="0" cellspacing="0" >
            <tr>
               <td width="100%" valign="top">
                  <table border="0" cellpadding="0" cellspacing="0" >
                     <tr>
                        <td class="stdBold">
                           <table cols="2" width="600" border="0" cellpadding="0" cellspacing="0" >
                              <tr>
                                 <td class="stdBold">
                                    <table width="100%" cellpadding="0" cellspacing="0" >
                                       <tr>
                                          <td class="bold"><span style="{color: #962a2a}">About Me</span></td>
                                          <td align="right">&nbsp;</td>
                                       </tr>

                                       <tr>
                                          <td height="1" colspan="2" bgcolor="#D0CFC4"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=1></td>
                                       </tr>

                                       <tr>
                                          <td colspan="2">
                                             <table bgcolor="#F8F8F2" width="100%" border="0" cellpadding="0" cellspacing="0" >
                                                <tr>
                                                   <td><a name="aboutme"></a><%= aboutMe2 %></td>
                                                </tr>
                                             </table>
                                          </td>
                                       </tr>
                                    </table>
                                 </td>
                              </tr>

                              <tr>
                                 <td class="stdBold"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=10>
                                    <table width="100%" cellpadding="0" cellspacing="0" >
                                       <tr>
                                          <td class="bold"><span style="{color: #962a2a}">Personal Info</span></td>
                                          <td align="right">&nbsp;</td>
                                       </tr>

                                       <tr>
                                          <td height="1" colspan="2" bgcolor="#D0CFC4"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=1></td>
                                       </tr>
                
                                       <tr>
                                          <td colspan="2">
                                             <table bgcolor="#F8F8F2" width="100%" border="0" cellpadding="0" cellspacing="0" >
                                                <tr>
                                                   <td class="std">Username:</td>
                                                   <td width="100%"><%= userName %></td>
                                                </tr>

                                                <tr>
                                                   <td class="std">Gender:</td>
                                                   <td><%= gender %> seeking <%= seekingGender %></td>
                                                </tr>

                                                <tr>
                                                   <td class="std">From:</td>
                                                   <td><%= city %>, <%= state %>, <%= country %></td>
                                                </tr>

                                                <tr>
                                                   <td class="std">Age:</td>
                                                   <td><%= age %></td>
                                                </tr>
                                             </table>
                                          </td>
                                       </tr>
                                    </table>
                                 </td>
                              </tr>

                              <tr>
                                 <td class="stdBold"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=10>
                                    <table width="100%" cellpadding="0" cellspacing="0" >
                                       <tr>
                                          <td class="bold"><span style="{color: #962a2a}">Basics</span></td>
                                          <td align="right">&nbsp;</td>
                                       </tr>

                                       <tr>
                                          <td height="1" colspan="2" bgcolor="#D0CFC4"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=1></td>
                                       </tr>

                                       <tr>
                                          <td colspan="2"></td>
                                       </tr>

                                       <tr>
                                          <td width=100% colspan="2" align="left">
                                             <table bgcolor="#F8F8F2" cols="2" width="100%" border="0" cellpadding="0" cellspacing="0" >
                                                <tr>
                                                   <td valign="top">
                                                      <table cols="2" cellpadding="0" cellspacing="0" width="237" >
                                                         <tr>
                                                            <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Hair:</span></td>
                                                            <td valign="top" width="108"><%= hairColor %></td>
                                                         </tr>
               
                                                         <tr>
                                                            <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Eyes:</span></td>
                                                            <td valign="top" width="108"><%= eyes %></td>
                                                         </tr>

<tr>
   <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Height:</span></td>
   <td valign="top" width="108"><%= height %> cm</td>
</tr>

<tr>
   <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Weight:</span></td>
   <td valign="top" width="108"><% double wght = Double.parseDouble(weight) / 1000; %><%= wght %> kg</td>
</tr>

<tr>
   <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Body Style:</span></td>
   <td valign="top" width="108"><%= bodyType %></td>
</tr>

<tr>
   <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Activity Level:</span></td>
   <td valign="top" width="108"><%= activity %></td>
</tr>

<tr>
   <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Smoking:</span></td>
   <td valign="top" width="108"><%= smoking %></td>
</tr>

<tr>
   <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Drinking:</span></td>
   <td valign="top" width="108"><%= drinking %></td>
</tr>

<tr>
   <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Marital Status:</span></td>
   <td valign="top" width="108"><%= maritalStatus %></td>
</tr>

<tr>
   <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Children:</span></td>
   <td valign="top" width="108"><%= hasChildren %></td>
</tr>

<tr>
   <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Zodiac Sign:</span></td>
   <td valign="top" width="108"><%= zodiacSign %></td>
</tr>

<tr>
   <td valign="top" class="default" width="129"><span style="{color: #962a2a}">Languages I speak:</span></td>
   <td valign="top" width="108"><%= languages %></td>
</tr>

</table>
</td>

<td valign="top">
<table cellpadding="0" cellspacing="0" >
<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">Ethnicity:</span></td>
   <td valign="top"><%= ethnicity %></td>
</tr>

<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">Religion:</span></td>
   <td valign="top"><%= religion %></td>
</tr>

<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">Grew up in:</span></td>
   <td valign="top"><%= grewUpIn %></td>
</tr>

<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">Education:</span></td>
   <td valign="top"><%= education %></td>
</tr>

<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">Education Emphasis:</span></td>
   <td valign="top"><%= study %></td>
</tr>

<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">Politics:</span></td>
   <td valign="top"><%= politics %></td>
</tr>

<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">Occupation:</span></td>
   <td valign="top"><%= occupation %></td>
</tr>

<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">Annual Income:</span></td>
   <td valign="top"><%= income %></td>
</tr>

<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">Rate appearance:</span></td>
   <td valign="top"><%= appearanceImportance %></td>
</tr>

<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">Rate intelligence:</span></td>
   <td valign="top"><%= intelligenceImportance %></td>
</tr>

<tr>
   <td class="std">Relocate:</td>
   <td><%= relocate %></td>
</tr>
</table>
</td>
</tr>

<tr>
<td colspan="3"></td>
</tr>

<tr><td colspan="3">

<table cellpadding="0" cellspacing="0" width="550" >
<tr>
   <td valign="top" class="default" width="159"><span style="{color: #962a2a}">Occupation Description:</span></td>
   <td valign="top" width="391"><%= occupationDescription %></td>
</tr>

<tr>
   <td valign="top" class="default" width="159"><span style="{color: #962a2a}">Seeking:</span></td>
   <td valign="top" width="391"><%= relationType %></td>
</tr>

<tr>
   <td valign="top" class="default" width="159"><span style="{color: #962a2a}">Headline:</span></td>
   <td valign="top" width="391"><%= headline %></td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>

<tr>
<td class="stdBold"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=10>
<table width="100%" cellpadding="0" cellspacing="0" >
<tr>
   <td class="bold"><span style="{color: #962a2a}">Personality</span></td>
   <td align="right">&nbsp;</td>
</tr>

<tr>
<td height="1" colspan="2" bgcolor="#D0CFC4"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=1></td>
</tr>

<tr>
   <td colspan="2"></td>
</tr>

<tr>
   <td colspan="2" align="left"><table bgcolor="#F8F8F2" width="100%" border="0" cellpadding="0" cellspacing="0" ><tr><td valign="top" class="default"><span style="{color: #962a2a}">My personality traits:</span></td>
   <td valign="top"><%= personalityTrait %></td>
</tr>

<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">My favorite activities:</span></td>
   <td valign="top"><%= leisure %></td>
</tr>

<tr>
   <td valign="top" class="default"><span style="{color: #962a2a}">About the one I'm looking for:</span></td>
   <td valign="top"><%= aboutMatch %></td>
</tr>

</table>
</td>
</tr>
</table>
</td>
</tr>

<tr>
<td><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=10>
<table width="100%" cellpadding="0" cellspacing="0" >
<tr>
   <td class="bold"><span style="{color: #962a2a}">Interests</span></td>
   <td align="right">&nbsp;</td>
</tr>

<tr>
   <td height="1" colspan="2" bgcolor="#D0CFC4"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=1></td>
</tr>

<tr>
   <td colspan="2"></td>
</tr>

<tr>
   <td colspan="2" align="left">
<table bgcolor="#F8F8F2" width="600" border="0" cellpadding="0" cellspacing="0" >
<tr>
   <td valign="top" class="default" width="146"><span style="{color: #962a2a}">My favorite cuisines:</span></td>
   <td valign="top" width="454"><%= cuisineTypes %></td>
</tr>

<tr>
   <td valign="top" class="default" width="146"><span style="{color: #962a2a}">My favorite music:</span></td>
   <td valign="top" width="454"><%= musicTypes %></td>
</tr>

<tr>
   <td valign="top" class="default" width="146"><span style="{color: #962a2a}">I like to read:</span></td>
   <td valign="top" width="454"><%= readingWhat %></td>
</tr>

<tr>
   <td valign="top" class="default" width="146"><span style="{color: #962a2a}">My idea of the perfect first date:</span></td>
   <td valign="top" width="454"><%= firstDate %></td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>

<tr>
<td><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=10>

<table width="100%" cellpadding="0" cellspacing="0" >
<tr>
   <td class="bold"><span style="{color: #962a2a}">Leisure and Physical Activities</span></td>
   <td align="right"><a href="#top" class="stdSmall"><img src="images/btn_top.gif" width="16" height="15" border="0" alt="top"></a>&nbsp;</td>
</tr>

<tr>
   <td height="1" colspan="2" bgcolor="#D0CFC4"><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=1 height=1></td>
</tr>

<tr>
   <td colspan="2"></td>
</tr>

<tr>
   <td colspan="2" align="left">

<table bgcolor="#F8F8F2" width="600" border="0" cellpadding="0" cellspacing="0" >
<tr>
   <td valign="top" class="default" width="144"><span style="{color: #962a2a}">I like going out to:</span></td>
   <td valign="top" width="456"><%= entertainmentLocation %></td>
</tr>

<tr>
   <td valign="top" class="default" width="144"><span style="{color: #962a2a}">My favorite physical activities:</span></td>
   <td valign="top" width="456"><%= phyActivity %></td>
</tr>

<tr>
   <td valign="top" class="default" width="144"><span style="{color: #962a2a}">My perception of an ideal relationship:</span></td>
   <td valign="top" width="456"><%= idealRelationship %></td>
</tr>

<tr>
   <td valign="top" class="default" width="144"><span style="{color: #962a2a}">What I've learned from my past relationships:</span></td>
   <td valign="top" width="456"><%= learnFromThePast %></td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table><br>
<a href="javascript:window.close();" class="stdSmall"><img src="images/btn_close.gif" border="0" align="right"></a></td>
</tr>
</table>
</td>
<td><img src="images/trans.gif" hspace=0 vspace=0 border=0 width=15 height=1></td>
</tr></table></td>
</tr>
</table>
</body>
</html>