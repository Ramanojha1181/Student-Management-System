<%@include file="database.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Your Details</title>
<style>
	#PI{
		margin-top:150px;
		margin-left:250px;
		padding-left:20px;
		height:250px;
		width:200px;
		border:2px solid black;
	}
</style>
</head>
<body>
	
	<%
int Id = 0;

try{
	

 Id = Integer.parseInt(request.getParameter("id"));

String query = "select * from details where id ="+Id;
PreparedStatement ps = cn.prepareStatement(query);
ResultSet rs = ps.executeQuery();

if(rs.next()){
	
	%>
	<div class="personalinformation-container" id="PI">
	<h2 style=" text-align:center;">ID-<%=rs.getString("id")%></h2>
	Name:-   <%=rs.getString("name") %><br><br>
	Branch:-   <%=rs.getString("branch") %><br><br>
	Fees:-   <%=rs.getDouble("fees") %><br><br>
	Address:-   <%=rs.getString("address") %>
	
		</div>
		<%
	}
}catch(Exception e){
	e.printStackTrace();
}

%>


</body>
</html>