<jsp:useBean id="theBean" scope="session" class="com.brainysoftware.web.FileUploadBean" />

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

<body marginheight=0 marginwidth=0 topmargin=0 leftmargin=0 text="#000000" bgcolor="#ffffff">

<%
  theBean.setSavePath("C:\\tomcat8\\webapps\\proj\\images\\");

  theBean.doUpload(request);
  theBean.save();

  out.println("Filename:" + theBean.getFilename());
  out.println("<BR>Content Type:" + theBean.getContentType());
  out.println("<BR>Author:" + theBean.getFieldValue("UserName"));
  out.println("<BR>Company:" + theBean.getFieldValue("Password"));
  out.println("<BR>Comment:" + theBean.getFieldValue("Email"));

   String userName      = theBean.getFieldValue( "UserName" );
   String password      = theBean.getFieldValue( "Password" );
   String dobMonth      = theBean.getFieldValue( "BirthDate_month" );
   String dobDay        = theBean.getFieldValue( "BirthDate_day" );
   String dobYear       = theBean.getFieldValue( "BirthDate_year" );
   String email         = theBean.getFieldValue( "Email" );
   String gender        = theBean.getFieldValue( "GenderID" );
   String seekingGender = theBean.getFieldValue( "SeekingGenderID" );
   String country       = theBean.getFieldValue( "CountryRegionID" );
   String state         = theBean.getFieldValue( "State" );
   String city          = theBean.getFieldValue( "City" );
   String zip           = theBean.getFieldValue( "PostalCode" );
   String aboutMe       = theBean.getFieldValue( "AboutMe" );
   String picturePath = "";//   = theBean.getFieldValue( "TFileID" );
%>

</center>
</body>
</html>