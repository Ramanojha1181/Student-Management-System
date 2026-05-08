<%@ include file="database.jsp" %>
<%

if(request.getParameter("submit")!= null){
	
String Id = request.getParameter("studentid");
String Name = request.getParameter("studentname");
String Branch = request.getParameter("studentbranch");
String Fees = request.getParameter("studentfees");
String Address = request.getParameter("studentaddress");

 int id = Integer.parseInt(Id);
 int fees = Integer.parseInt(Fees);

String query = "insert into details values(?,?,?,?,?)";
try{
PreparedStatement ps = cn.prepareStatement(query);

ps.setInt(1,id);
ps.setString(2,Name);
ps.setString(3,Branch);
ps.setInt(4,fees);
ps.setString(5,Address);

int row = ps.executeUpdate();
if(row>0){
	out.println(" Data saved successfully");
	%>
	<script>
alert("Data Saved Successfully");
window.location.href = "RetrieveData.jsp";
</script>
	<%
}
else{
	out.println("Error");
}

}catch(SQLException e){
	e.getMessage();
}

}
else{
	out.println("trying to parse empty form");
}
%>
