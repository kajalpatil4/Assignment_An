<%@ page session="false" %>
<%@ page import="java.sql.*" %>
<%
  try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    System.out.println("JDBC driver loaded");
  }
  catch (ClassNotFoundException e) {
    System.out.println(e.toString());
  }
%>

<%

  java.util.Date messageDate = new java.util.Date();
  String sql = "INSERT INTO messages(userName, fromUser, message, messageDate) VALUES('Yusuf', 'Ayse', 'Call Me', '" + messageDate + "');";
  try
{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/contacts?user=kareena&password=kapoor");

    Statement s = con.createStatement();
    s.executeQuery(sql);

    s.close();
    con.close();
  }
  catch (SQLException e) {
  }
  catch (Exception e) {
  }
%>
