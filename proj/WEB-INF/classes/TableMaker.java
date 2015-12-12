import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;

/*
 *A class that creates an HTML table from a ResultSet
*/
public class TableMaker
{
   private ResultSet rs;

   /**
   * Creates a new TableMaker for the specified ResultSet
   * @param rs the result set
   * @exception SQLException if the result set cannot be read
   */
   public TableMaker(ResultSet rs) throws SQLException
   {
      this.rs = rs;
   }

   /**
   * Returns an HTML table corresponding to this result set
   */
   public String toString()
   {
      StringWriter sw = new StringWriter();
      PrintWriter out = new PrintWriter(sw);
      out.println("<TABLE BORDER=1 CELLPADDING=3>");
      try {
         ResultSetMetaData md = rs.getMetaData();

         // Create the headings row

         out.println("<TR>");
         int nColumns = md.getColumnCount();
         String[] align = new String[nColumns];
         for (int i = 0; i < nColumns; i++) {
            int col = i+1;

            // Get the column label.  Use the
            // column name if the label is not
            // available.

            String label = md.getColumnLabel(col);
            if (label == null)
               label = md.getColumnName(col);

            // Left or right justify, depending on
            // the data type

            switch (md.getColumnType(col)) {
               case Types.CHAR:
               case Types.VARCHAR:
                  align[i] = "LEFT";
                  break;
               default:
                  align[i] = "RIGHT";
            }
            out.println("<TH>" + label + "</TH>");
         }
         out.println("</TR>");

         // Create the detail rows

         while (rs.next()) {
            out.println("<TR>");
            for (int i = 0; i < nColumns; i++) {
               int col = i+1;
               String value = rs.getString(col);
               StringBuffer buffer = new StringBuffer();

               buffer.append("<TD ALIGN=\"");
               buffer.append(align[i]);
               buffer.append("\"");
               buffer.append(" VALIGN=\"TOP\"");
               buffer.append(">");
               buffer.append(value);
               buffer.append("</TD>");
               out.println(buffer.toString());
            }
            out.println("</TR>");
         }
      }
      catch (SQLException e)
      {
         sw = new StringWriter();
         out = new PrintWriter(sw);
         out.println("<TABLE BORDER=0>");
         out.println("<TR><TD>"+e.getMessage()+"</TD></TR>");
      }
      finally
      {
         out.println("</TABLE>");
         sw.flush();
         return sw.toString();
      }
   }
}
