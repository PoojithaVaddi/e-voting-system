<%@page import="java.sql.ResultSet"%>
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
	String a=request.getParameter("email");
	String b=request.getParameter("pass");
	Connection con=DBConnection.getconnection();
	String sql="select * from ec where email=? and password=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		String s=rs.getString("id");
		session.setAttribute("uid", s);
		response.sendRedirect("ec.jsp");
	}
	else
	{
		%>
		<script type="text/javascript">
		alert("invalid email or password.");
		window.location="eclogin.jsp";
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