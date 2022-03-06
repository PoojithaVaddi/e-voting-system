<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{	
	String b=request.getParameter("mobile");
	String c=request.getParameter("pass");
	Connection con=DBConnection.getconnection();
	String sql="update user set password=? where mobile=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, c);
	ps.setString(2, b);
	int x=ps.executeUpdate();
	if(x>0)
	{
		%>
		<script type="text/javascript">
		alert('registered successfully.');
		window.location="userregistration.jsp";
		</script>		
		<%
	}
	else
	{
		%>
		<script type="text/javascript">
		alert('register failed.');
		window.location="userregistration.jsp";
		</script>		
		<%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>