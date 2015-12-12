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
   int id = 0;
   String memberName = "";

   /* 1 means lookup by member id, 2 means lookup by name*/
   int lookupType = Integer.parseInt(request.getParameter("type"));
   
   if (lookupType == 1)
      id = Integer.parseInt(request.getParameter("data"));

   if (lookupType == 2)
      memberName = request.getParameter("data");


    String userName = "";
   int dobMonth = 0;
   int dobDay = 0;
   int dobYear = 0;
   int age = 0;
   String lastLogin = "";
   String email = "";
   String gender = "";
   String seekingGender = "";
   String country = "";
   String state = "";
   String city = "";
   String zip = "";
   String picture = "";
   String aboutMe1 = "";

   int height = 0;
   int weight = 0;

   String study = "";
   String relocate = "";
   String headline = "";
   String occupation ="";
   String occupationDescription="";
   String grewUpIn="";
   String zodiacSign="";
   String languages="";
   String relationType="";
   String maritalStatus="";
   String hairColor="";
   String income="";
   String education="";
   String bodyType="";
   String appearanceImportance="";
   String religion="";
   String eyes="";
   String ethnicity="";
   String politics="";
   String intelligenceImportance="";
   String smoking="";
   String activity="";
   String hasChildren="";
   String drinking="";
   String wantsChildren="";
   String aboutMe2="";
   String personalityTrait="";
   String leisure="";
   String aboutMatch="";
   String cuisineTypes="";
   String musicTypes="";
   String readingWhat="";
   String firstDate="";
   String entertainmentLocation="";
   String phyActivity="";
   String idealRelationship="";
   String learnFromThePast="";
   String sql="";



   if (lookupType == 1)
      sql = "SELECT * FROM userstable WHERE UserID=" + id;

   if (lookupType == 2)
      sql = "SELECT * FROM userstable WHERE UserName='" + memberName + "'";
  
   try
   {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");
      Statement s = con.createStatement();      
      ResultSet rs = s.executeQuery(sql);

      while (rs.next())
      {
       userName = rs.getString( "UserName" );
       dobMonth = Integer.parseInt(rs.getString( "DOBmonth" ));
       dobDay = Integer.parseInt(rs.getString( "DOBday" ));
       dobYear = Integer.parseInt(rs.getString( "DOByear" ));
       age = 2003 - dobYear;


       lastLogin = rs.getString("lastLoginDate");
     email = rs.getString( "Email" );
          gender = rs.getString( "Gender" );
          seekingGender = rs.getString( "SeekingGender" );
          country = rs.getString( "Country" );
          state = rs.getString( "State" );
          city = rs.getString( "City" );
          zip = rs.getString( "PostalCode" );
  picture = rs.getString("FileLocation");
          aboutMe1 = rs.getString( "AboutMe1" );

       height = Integer.parseInt( rs.getString( "Height" ) );
       weight = Integer.parseInt(rs.getString( "Weight" ));

         study = rs.getString( "StudiesEmphasis" );
          relocate = rs.getString( "RelocateFlag" );
          headline = rs.getString( "Headline" );
          occupation = rs.getString( "Occupation" );
          occupationDescription = rs.getString( "OccupationDescription" );
          grewUpIn = rs.getString( "GrewUpIn" );
          zodiacSign = rs.getString( "ZodiacSign" );
          languages = rs.getString( "Languages" );
          relationType = rs.getString( "RelationshipType" );
          maritalStatus = rs.getString( "MaritalStatus" );
          hairColor = rs.getString( "HairColor" );
          income = rs.getString( "IncomeLevel" );
          education = rs.getString( "EducationLevel" );
          bodyType = rs.getString( "BodyType" );
          appearanceImportance = rs.getString( "AppearanceImportance" );
          religion = rs.getString( "Religion" );
          eyes = rs.getString( "EyeColor" );
          ethnicity = rs.getString( "Ethnicity" );
          politics = rs.getString( "PoliticalOrientation" );
          intelligenceImportance = rs.getString( "IntelligenceImportance" );
          smoking = rs.getString( "SmokingHabits" );
          activity = rs.getString( "ActivityLevel" );
          hasChildren = rs.getString( "Custody" );
          drinking = rs.getString( "DrinkingHabits" );
          wantsChildren = rs.getString( "MoreChildrenFlag" );
          aboutMe2 = rs.getString( "AboutMe2" );
          personalityTrait = rs.getString( "PersonalityTrait" );
          leisure = rs.getString( "LeisureActivity" );
          aboutMatch = rs.getString( "PerfectMatchEssay" );
          cuisineTypes = rs.getString( "Cuisine" );
          musicTypes = rs.getString( "Music" );
          readingWhat = rs.getString( "Reading" );
          firstDate = rs.getString( "PerfectFirstDateEssay" );
          entertainmentLocation = rs.getString("EntertainmentLocation");
          phyActivity = rs.getString("PhysicalActivity");
          idealRelationship = rs.getString( "IdealRelationshipEssay" );
          learnFromThePast = rs.getString( "LearnFromThePastEssay" );

      }

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

<table cellpadding="0" cellspacing="0" >
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
                        <td align="center"><img src='<%= picture %>'></td>
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
                                                   <td> <%= age %></td>
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
   <td valign="top" width="108"><%= weight %> kg</td>
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