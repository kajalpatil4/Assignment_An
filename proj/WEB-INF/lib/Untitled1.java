package fileuploadbean;

import java.io.PrintStream;

public class Untitled1 {

    public static void main(String[] args)
    {
        String s = "Content-Disposition; name=\"filename\" filename=\"C:\\data\\g\"";
        String filename = "";
        String filepath = "";
        int pos = s.indexOf( "filename=\"" );

        if( pos != -1 )
        {
            filepath = s.substring( pos + 10, s.length() - 1 );
            pos = filepath.lastIndexOf( "\\" );
            if( pos != -1 )
                filename = filepath.substring( pos + 1 );
            else
                filename = filepath;
        }
        System.out.println( filename );
    }
}

