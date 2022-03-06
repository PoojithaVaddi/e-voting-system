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
<title>Login Status</title>
</head>
<body>
<%
try
{
	String a=request.getParameter("name");
	String b=request.getParameter("pass");
	Connection con=DBConnection.getconnection();
	String sql="select * from user where name=? and password=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		int uid=rs.getInt("uid");
		session.setAttribute("uid", uid);
		String sql1="select * from voterdetails where id=?";
		PreparedStatement ps1=con.prepareStatement(sql1);
		ps1.setInt(1, uid);
		ResultSet rs1=ps1.executeQuery();
		if(rs1.next())
		{
			int v=rs1.getInt("vote");
			if(v>0 )
			{
				%>
				<script type="text/javascript">
				alert("voter already voted.");
				window.location="userlogin.jsp";
				</script>
				<%

			}
			else
			{
				String dis=rs1.getString("district");
				session.setAttribute("dis", dis);
				
				String sta=rs1.getString("state");
				session.setAttribute("sta", sta);
				response.sendRedirect("user.jsp");
			}
			
		}
	}
	else
	{
		%>
		<script type="text/javascript">
		alert("invalid email or password.");
		window.location="userlogin.jsp";
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