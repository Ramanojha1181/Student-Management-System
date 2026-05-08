<%@ include file="database.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <!DOCTYPE html>
 <html>  
 <head>
 <title>Retrieve Data</title>
  <style>
  body{
   margin-left:20px;
   margin-top:40px;
  }
   table, th, td {
      border: 2px solid black; 
      border-collapse: collapse;
      padding: 10px 50px 10px 50px;
      font-size:20px;
      text-align:center;
      
    }
    #search{
    width: 50%;
    padding: 8px;
    margin-top: 2px;
    margin-bottom:-50px
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 15px;
    }
    
  </style>
 </head> 
 <body>
 <div>
 <table>
     <thead>
       <tr>
         <th>ID</th>
         <th>NAME</th>
         <th>BRANCH</th>
         <th>FEES</th>
         <th>ADDRESS</th>
         <th>SHOW</th>
         <th>EDIT</th>
         <th>DELETE</th>
       </tr>
     </thead>
     <tbody>
    
<%
String query = "select * from details";
try{
	 PreparedStatement ps = cn.prepareStatement(query);
     ResultSet rs = ps.executeQuery();
     
   
	while(rs.next()){
	
		
		int id = rs.getInt("studentid");
        String name =  rs.getString("studentname");
        String branch =  rs.getString("studentbranch");
        int fees = rs.getInt("studentfees");
        String address =  rs.getString("studentaddress");
        
        %>
        <tr>
          <td class="th"><%= id %></td>
          <td><%= name %></td>
          <td><%= branch %></td>
          <td><%= fees %></td>
          <td><%= address %></td>
          <td ><a href = "update.jsp?studentid=<%=id %>">Edit</a></td>
          <td ><a href = "Delete.jsp?studentid=<%=id %>">Delete</a></td>
          <td ><a href = "ShowPD.jsp?studentid=<%=id %>">Show</a></td>
        </tr>
       
     <%  	
	}
  }catch(SQLException e){
	e.getMessage();
}
	
%>
	  <tbody>
    </table>
    </div>
  </body>
</html>
	

  
    

    
    