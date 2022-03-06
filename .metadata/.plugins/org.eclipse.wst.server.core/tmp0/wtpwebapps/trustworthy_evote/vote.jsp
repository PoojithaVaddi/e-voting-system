<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="databaseconn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
	int uid=(int)session.getAttribute("uid");
	System.out.println("uid : "+uid);
	int id=Integer.parseInt(request.getParameter("id"));
	System.out.println("id : "+id);
	
	String s1=String.valueOf(uid).toString();
	String s2=String.valueOf(id).toString();
	
	String str=s1+s2;
	MessageDigest md = MessageDigest.getInstance("SHA-256");
	byte[] hash=md.digest(str.getBytes(StandardCharsets.UTF_8));
	// Convert byte array into signum representation  
    BigInteger number = new BigInteger(1, hash);  

    // Convert message digest into hex value  
    StringBuilder hexString = new StringBuilder(number.toString(16));  

    // Pad with leading zeros 
    while (hexString.length() < 32)  
    {  
        hexString.insert(0, '0');  
    } 
    System.out.println("hashcode : "+hexString);
    String phcode=null;
    Connection con=DBConnection.getconnection();
    
	 String sql="select hcode from election order by id desc limit 1";
	 PreparedStatement ps=con.prepareStatement(sql);
	 ResultSet rs=ps.executeQuery();
	 if(rs.next())
	 {
		 phcode=rs.getString("hcode");
		 System.out.println("phcode : "+phcode);
	 }
	 else
	 {
		 phcode="0";
	 }
	
	 java.util.Date now = new java.util.Date();
		String date=now.toString();
		String DATE_FORMAT = "dd-MM-yyyy hh:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String strDateNew = sdf.format(now) ;
		
	 String sql1="insert into election(hcode, voter, vote, phcode, dt) values(?,?,?,?,?)";
	 PreparedStatement ps1=con.prepareStatement(sql1);
	 ps1.setString(1, hexString.toString());
	 ps1.setInt(2, uid);
	 ps1.setInt(3, id);
	 ps1.setString(4, phcode);
	 ps1.setString(5, strDateNew);
	 ps1.execute();
	 
	 
	String sql2="update voterdetails set vote=? where id=?";
	
	PreparedStatement ps2=con.prepareStatement(sql2);
	ps2.setInt(1, id);
	ps2.setInt(2, uid);
	int x=ps2.executeUpdate();
	//int x=0;
	if(x>0)
	{
		%>
		<script type="text/javascript">		
		alert("voted successfully.");
		window.location="userlogin.jsp";
		</script>
		<%
	}
	else
	{
		%>
		<script type="text/javascript">		
		alert("vote failed.");
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