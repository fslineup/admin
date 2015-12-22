<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%@ page import ="java.io.BufferedReader" %>
<%@ page import ="java.io.InputStreamReader" %>
<%@ page import ="java.net.HttpURLConnection" %>
<%@ page import ="java.net.URL" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%


String result = "";
String urlAddr = "http://comic.naver.com/webtoon/list.nhn?titleId=20853&weekday=tue";
URL url;
HttpURLConnection conn;
BufferedReader rd;
String line;

try {
   url = new URL(urlAddr);
   conn = (HttpURLConnection) url.openConnection();
   conn.setRequestMethod("GET");
   rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"EUC-KR"));
   
   boolean chk;
   chk = false;
   
   while ((line = rd.readLine()) != null) {
      
	 
		  
	  	 	result += line+"\n";	
	   
   
	   
	   
   }
   System.out.println(result);
   rd.close();
} catch (Exception e) {
   e.printStackTrace();
} finally {
	  
} %>

<%=result%>
</body>
</html>