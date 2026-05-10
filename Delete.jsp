<%@ page import="java.sql.*"%>
<%@include file="database.jsp" %>
<%
int Id = Integer.parseInt(request.getParameter("id"));

String query = "delete from details where id ="+Id;
PreparedStatement ps = cn.prepareStatement(query);
ps.executeUpdate();



%>
<script>
alert("Data deleted ");
window.location.href = "RetrieveData.jsp";
</script>