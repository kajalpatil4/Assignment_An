<%
private static String FTP_SERVER = "ftp.coe.neu.edu";
private static String FTP_USER = "YourCoeName";
private static String FTP_PASSWORD = "YourCoePassword";
private static String FTP_DIRECTORY = "www";
void renameAndMoveToFTPServer(String newName, File objToFtpPut)throws IOException{
com.oroinc.net.ftp.FTPClient ftp = null;
FileInputStream inputLocal = null;
BufferedInputStream inputLocalBuf = null;
try{
ftp = new com.oroinc.net.ftp.FTPClient();
ftp.connect(FTP_SERVER);
int reply = ftp.getReplyCode();
if(!com.oroinc.net.ftp.FTPReply.isPositiveCompletion(reply))
throw new java.io.IOException("Could not connect to ftp server "+FTP_SERVER);
ftp.login(FTP_USER,FTP_PASSWORD);
ftp.setFileType(com.oroinc.net.ftp.FTP.BINARY_FILE_TYPE); 
ftp.changeWorkingDirectory(FTP_DIRECTORY);
try{
inputLocal = new FileInputStream(objToFtpPut);
inputLocalBuf = new BufferedInputStream(inputLocal);
if(!ftp.storeFile(newName,inputLocalBuf))
throw new java.io.IOException("Copy file to remote ftp host failed");
}
finally{
if(inputLocalBuf!=null) inputLocalBuf.close();
if(inputLocal!=null) inputLocal.close();
}
ftp.logout();
}
finally{
if(ftp != null){
try{
ftp.disconnect();
}
catch(Exception e){
}
}
}
%>