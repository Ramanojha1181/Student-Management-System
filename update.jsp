<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="database.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<style>

  .registration-container {
    width: 400px;
    height:450px;
    margin: 30px auto;
    padding: 30px;
    border: 2px solid #ccc;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  }

  label {
    display: block;
    margin-top: 0px;
    font-size: 20px;
    font-weight: 600;
   
  }

  input[type="text"] {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 18px;
  }
  
  #update {
    
    width: 40%;
    margin-top: 6%;
    margin-left: 6%;
    padding: 10px;
    font-size: 18px;
    font-weight: 600;
    background-color:#009fa2;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    
  }

  #update:hover {
    background-color: #00ffbf;
  }
  
   h2 {
    text-align: center;
    margin-bottom: 20px;
    font-weight:600;
  }
  
</style>
</head>
<body>

<%
int Id = 0;

try{
	

 Id = Integer.parseInt(request.getParameter("studentid"));

String query = "select * from details where studentid ="+Id;
PreparedStatement ps = cn.prepareStatement(query);
ResultSet rs = ps.executeQuery();

if(rs.next()){
	
	%>
	<div class="registration-container">
	<form action=""method="post">
	<h2>Id - <%=rs.getInt("studentid")%></h2><br>
	    
       <label for="name"> Name</label>
       <input type="text" id="name" name ="studentname" value="<%=rs.getString("studentname")%>"><br>

       <label for="branch">Branch</label>
       <input type="text" id="branch" name ="studentbranch" value="<%=rs.getString("studentbranch")%>"><br>

       <label for="fees">Fees</label>
       <input type="text" id="fees" name ="studentfees" value="<%=rs.getInt("studentfees")%>"><br>

       <label for="address">Address</label>
       <input type="text" id="address" name ="studentaddress" value="<%=rs.getString("studentaddress")%>"><br>
       
       <input type="submit" id="update" name="update" value="Update">
       <input type="reset" value="Reset" id="update" name="reset">
	</form>	
	</div>
	<%
}
}catch(Exception e){
	e.printStackTrace();
}

try{

	
	 String name = request.getParameter("studentname");
	 String branch = request.getParameter("studentbranch");
	 String Fees = request.getParameter("studentfees");
	 String address = request.getParameter("studentaddress");
	
	int fees = Integer.parseInt(Fees);
	
	String query2 = "update details set studentname = ?, studentbranch = ?, studentfees = ?, studentaddress = ? where studentid="+Id;
	PreparedStatement ps = cn.prepareStatement(query2);
	
	ps.setString(1,name);
	ps.setString(2,branch);
	ps.setInt(3,fees);
	ps.setString(4,address);
	
	ps.executeUpdate();
	%>
	<script>
		alert("Database Updated!")
		window.location.href="RetrieveData.jsp"
	</script>	
	<%
	
}catch(Exception e){
	e.getMessage();
}
%>
</body>
</html>