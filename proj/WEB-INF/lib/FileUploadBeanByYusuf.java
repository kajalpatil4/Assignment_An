package com.yusuf.web;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Dictionary;
import java.util.Hashtable;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

public class FileUploadBeanByYusuf
{
    private String m_String0;
    private String m_String1;
    private String m_String2;
    private String m_String3;
    private Dictionary m_Dictionary4;
    private ByteArrayOutputStream m_ByteArrayOutputStream5;
    private String m_String6;

	public String getFilename()
    {
        return m_String2;
    }

    public String getFilepath()
    {
        return m_String1;
    }

    public void setSavePath(String savePath)
    {
        m_String0 = savePath;
    }

    public String getContentType()
    {
        return m_String3;
    }

    public String getFieldValue(String fieldName)
    {
        if( m_Dictionary4 == null || fieldName == null )
            return null;
        else
            return (String) m_Dictionary4.get( fieldName );
    }
    /*
	public void doUpload(HttpServletRequest request) throws IOException
	{
		ServletInputStream in = request.getInputStream();
		byte[] line = new byte[128];
		int i = in.readLine(line, 0, 128);
		
		if (i < 3)
			return;
		
		int boundaryLength = i - 2;
		String boundary = new String(line, 0, boundaryLength); //-2 discards the newline character
		
		//fields = new Hashtable();
		
		while (i != -1)
		{
			String newLine = new String(line, 0, i);
			
			if (newLine.startsWith("Content-Disposition: form-data; name=\""))
			{
				if (newLine.indexOf("filename=\"") != -1)
				{
					setFilename(new String(line, 0, i-2));
				
					if (filename==null)
						return; //this is the file content
						
					i = in.readLine(line, 0, 128);
						
					setContentType(new String(line, 0, i-2));
						
					i = in.readLine(line, 0, 128); // blank line
						
					i = in.readLine(line, 0, 128);
						
					newLine = new String(line, 0, i);
						
					PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter((savePath==null? "" : savePath) + filename)));
						
					while (i != -1 && !newLine.startsWith(boundary))
					{
						// the problem is the last line of the file content
						// contains the new line character.
						// So, we need to check if the current line is
						// the last line.
							
						i = in.readLine(line, 0, 128);
							
						if ((i==boundaryLength+2 || i==boundaryLength+4)  && (new String(line, 0, i).startsWith(boundary)))
							pw.print(newLine.substring(0, newLine.length()-2));
						else pw.print(newLine);
							newLine = new String(line, 0, i);
					}
						
					pw.close();
				}
				else
				{
					//this is a field
					// get the field name
					int pos = newLine.indexOf("name=\"");
					String fieldName = newLine.substring(pos+6, newLine.length()-3);
					//System.out.println("fieldName:" + fieldName); // blank line
					i = in.readLine(line, 0, 128);
					i = in.readLine(line, 0, 128);
					
					newLine = new String(line, 0, i);
						
					StringBuffer fieldValue = new StringBuffer(128);
						
					while (i != -1 && !newLine.startsWith(boundary))
					{
						// The last line of the field
						// contains the new line character.
						// So, we need to check if the current line is
						// the last line.
							
						i = in.readLine(line, 0, 128);
							
						if ((i==boundaryLength+2 || i==boundaryLength+4) && (new String(line, 0, i).startsWith(boundary)))
							fieldValue.append(newLine.substring(0, newLine.length()-2));
						else fieldValue.append(newLine);
							newLine = new String(line, 0, i);
					}
								
					//System.out.println("fieldValue:" + fieldValue.toString());
							
					fields.put(fieldName, fieldValue.toString());
				}
			}
					
			i = in.readLine(line, 0, 128);
		}
	}
	*/
}