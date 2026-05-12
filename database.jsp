<%@ page import="java.sql.*"  %>
<%
	String url = "jdbc:mysql://localhost:3306/first";
	String username = "root";
	String password = "root";

	Connection cn = null; 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	cn = DriverManager.getConnection(url,username,password); 
	//out.println("hello zkjck");
	
}catch(Exception e){
	out.print(e.getMessage());
}

%>