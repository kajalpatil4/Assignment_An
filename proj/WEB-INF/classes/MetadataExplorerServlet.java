import java.io.*;
import java.net.*;
import java.lang.reflect.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class MetadataExplorerServlet extends HttpServlet
{
   //Inner class for passing parameters between methods
   class Parameters
   {
      HttpServletRequest request;
      HttpServletResponse response;
      PrintWriter out;
      String driverName;
      String url;
      Connection con;
      DatabaseMetaData md;
      Class mdclass;
      Method method;
   }

   public void doGet( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
      // Create the parameter structure
      // and store the objects we need

      Parameters parms = new Parameters();
      parms.request = request;
      parms.response = response;

      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      parms.out = out;

      // Connect to the database and write the document

      try {

         connect(parms);

         out.println("<HTML>");
         writeHead(parms);
         writeBody(parms);
         out.println("</HTML>");
      }

      // Close the database no matter what

      finally {
         Connection con = parms.con;
         if (con != null) {
            try {
               con.close();
            }
            catch (SQLException ignore) {}
         }
      }
   }

   // Loads the driver and opens a connection to the database
   public void connect(Parameters parms) throws ServletException, IOException
   {
      HttpServletRequest request = parms.request;

      // Get the driver name parameter

      String driverName = "com.mysql.jdbc.Driver";
      
      parms.driverName = driverName;

      // Get the database URL parameter

      String url = "jdbc:mysql://localhost/contacts?user=kareena&password=kapoor";
      
      parms.url = url;

      // Load the driver class

      try {
         Class.forName(driverName);
      }
      catch (ClassNotFoundException e) {
         throw new ServletException
            ("Could not load driver class ["
            + driverName + "]");
      }

      // Connect to the database
      // and get the metadata

      try {
         Connection con = DriverManager.getConnection(url);
         parms.con = con;

         DatabaseMetaData md = con.getMetaData();
         parms.md = md;

         Class mdclass = md.getClass();
         parms.mdclass = mdclass;
      }
      catch (SQLException e) {
         throw new ServletException
            ("Could not connect to ["
            + url + "]"
            + " Error message is ["
            + e.getMessage() + "]");
      }
   }

   //Writes the HEAD section
   
   public void writeHead(Parameters parms)
      throws ServletException, IOException
   {
      PrintWriter out = parms.out;

      out.println("<HEAD>");
      out.println("<TITLE>Metadata Explorer Servlet</TITLE>");
      out.println("</HEAD>");
   }

   // Writes the BODY section
   
   public void writeBody(Parameters parms)
      throws ServletException, IOException
   {
      PrintWriter out = parms.out;
      String driverName = parms.driverName;
      String url = parms.url;

      out.println("<BODY>");
      out.println("<H2>Metadata Explorer Servlet</H2>");
      out.println("<H3>" + driverName + " " + url + "</H3>");

      writeMethodsTable(parms);

      out.println("</BODY>");
   }

   /**
   * Writes the methods table
   */
   public void writeMethodsTable(Parameters parms)
      throws ServletException, IOException
   {
      PrintWriter out = parms.out;
      DatabaseMetaData md = parms.md;
      Class mdclass = parms.mdclass;

      // Get the list of methods.  Select only public
      // methods that take no parameters and return
      // either a boolean, a String, or a ResultSet

      Method[] methods = mdclass.getDeclaredMethods();
      Vector vm = new Vector();
      for (int i = 0; i < methods.length; i++) {
         Method method = methods[i];

         if (!Modifier.isPublic(method.getModifiers()))
            continue;

         Class[] parmTypes = method.getParameterTypes();
         if (parmTypes.length > 0)
            continue;

         Class returnType = method.getReturnType();
         if (
            (!returnType.equals(java.lang.Boolean.TYPE)) &&
            (!returnType.equals(java.lang.String.class)) &&
            (!returnType.equals(java.sql.ResultSet.class)))
            continue;

         vm.addElement(method);
      }
      methods = new Method[vm.size()];
      vm.copyInto(methods);

      // Sort the list by method name

      int n = methods.length;
      int nm1 = n-1;
      for (int i = 0; i < nm1; i++) {
         for (int j = i+1; j < n; j++) {
            String iname = methods[i].getName();
            String jname = methods[j].getName();
            if (iname.compareTo(jname) > 0) {
               Method temp = methods[i];
               methods[i] = methods[j];
               methods[j] = temp;
            }
         }
      }

      // Invoke each method and show the result

      out.println("<DL>");

      for (int i = 0; i < methods.length; i++) {
         Method method = methods[i];
         parms.method = method;
         String methodName = method.getName();

         out.println("<DT><B>" + methodName + "</B></DT>");
         out.println("<DD>");

         Class returnType = method.getReturnType();
         if (returnType.equals(java.lang.Boolean.TYPE))
            writeBooleanMethod(parms);
         else
         if (returnType.equals(java.lang.String.class))
            writeStringMethod(parms);
         else
         if (returnType.equals(java.sql.ResultSet.class))
            writeResultSetMethod(parms);

         out.println("</DD>");
         out.println("<P>");

      }

      out.println("</DL>");
   }

   /**
   * Writes a boolean method result to the table
   */
   public void writeBooleanMethod(Parameters parms)
      throws ServletException, IOException
   {
      PrintWriter out = parms.out;
      DatabaseMetaData md = parms.md;
      Method method = parms.method;

      try {
         Object[] nobody = new Object[0];
         Boolean value = (Boolean) method.invoke(md, nobody);
         out.println(value);
      }
      catch (Exception e) {
         out.println(e.getMessage());
      }
   }

   /**
   * Writes a String method result to the table
   */
   public void writeStringMethod(Parameters parms)
      throws ServletException, IOException
   {
      PrintWriter out = parms.out;
      DatabaseMetaData md = parms.md;
      Method method = parms.method;

      try {
         Object[] nobody = new Object[0];
         String value = (String) method.invoke(md, nobody);
         if (value == null)
            value = "";
         if (value.trim().equals(""))
            value = "&nbsp;";
         out.println(value);
      }
      catch (Exception e) {
         out.println(e.getMessage());
      }
   }

   /**
   * Writes a ResultSet method result to the table
   */
   public void writeResultSetMethod(Parameters parms)
      throws ServletException, IOException
   {
      PrintWriter out = parms.out;
      DatabaseMetaData md = parms.md;
      Method method = parms.method;

      try {
         Object[] nobody = new Object[0];
         ResultSet value = (ResultSet) method.invoke(md, nobody);
         if (value == null)
            out.println("N/A");
         else
            out.println(new TableMaker(value).toString());
      }
      catch (Exception e) {
         out.println(e.getMessage());
      }
   }
}
