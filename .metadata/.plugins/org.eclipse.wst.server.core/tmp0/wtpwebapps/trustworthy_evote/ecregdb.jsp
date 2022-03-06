<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate Reg</title>
</head>
<body>
<%
try
{	
	String a=request.getParameter("name");
	String b=request.getParameter("email");
	String c=request.getParameter("pass");
	String d=request.getParameter("mobile");
	Connection con=DBConnection.getconnection();
	String sql="insert into ec(name,email,password,mobile) values(?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ps.setString(3, c);
	ps.setString(4, d);
	int x=ps.executeUpdate();
	if(x>0)
	{
		%>
		<script type="text/javascript">
		alert('registered successfully.');
		window.location="ecregistration.jsp";
		</script>		
		<%
	}
	else
	{
		%>
		<script type="text/javascript">
		alert('register failed.');
		window.location="ecregistration.jsp";
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