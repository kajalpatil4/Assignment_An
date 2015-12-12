package fileuploadbean;

public class Jsp1Bean {

    private String m_String0 = "Start value";

    public String getSample()
    {
        return m_String0;
    }

    public void setSample(String newValue)
    {
        if( newValue != null )
            m_String0 = newValue;
    }
}