<jsp:useBean id="theBean" scope="page" class="com.brainysoftware.web.FileUploadBean" />

<%
  theBean.setSavePath("C:\\tomcat8\\webapps\\proj\\images\\");

  theBean.doUpload(request);
  theBean.save();

  out.println("Filename:" + theBean.getFilename());
  out.println("<BR>Content Type:" + theBean.getContentType());
  out.println("<BR>Author:" + theBean.getFieldValue("Author"));
  out.println("<BR>Company:" + theBean.getFieldValue("Company"));
  out.println("<BR>Comment:" + theBean.getFieldValue("Comment"));

%>
