<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.ArrayList"%>
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
	String a=null,b=null,c=null,d=null,e=null,f=null,g=null,h=null;
	
	ArrayList<FileInputStream> list = new ArrayList<FileInputStream>();
	ServletContext context = getServletContext();
	
	String dirName =context.getRealPath("\\Document");
	System.out.println("file path:"+dirName);
	String paramname=null;
	String file=null;
	
	java.util.Date now = new java.util.Date();
	String date=now.toString();
	String DATE_FORMAT = "dd-MM-yyyy hh:mm:ss";
	SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
	String strDateNew = sdf.format(now) ;
	
	File file1 = null;
	
	MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB
	
	Enumeration params = multi.getParameterNames();
	while (params.hasMoreElements()) 
	{
		paramname = (String) params.nextElement();
		
		if(paramname.equalsIgnoreCase("name"))
		{
			a=multi.getParameter(paramname);
		}
		if(paramname.equalsIgnoreCase("district"))
		{
			c=multi.getParameter(paramname);
		}
		if(paramname.equalsIgnoreCase("state"))
		{
			d=multi.getParameter(paramname);
		}
		if(paramname.equalsIgnoreCase("image"))
		{
			h=multi.getParameter(paramname);
		}
		
	}
		
	int i = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
	
		if(paramname != null)
		{
			i = 1;
			h = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Document\\"+h);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	FileInputStream fs1 = null;

	Connection con=DBConnection.getconnection();
	String sql="select * from candidate where name=? and district=? and state=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, c);
	ps.setString(3, d);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
		<script>
		alert("candidate already registred.");
		window.location="candidate.jsp";
		</script>
		<% 
	}
	else
	{
		PreparedStatement ps1=con.prepareStatement("insert into candidate(name,district,state,iname,image,date) values(?,?,?,?,?,?)");
		ps1.setString(1,a);
	   	ps1.setString(2,c);
		ps1.setString(3,d);
		ps1.setString(4,h);	
	    if(i == 0)
	    {
	    	ps1.setObject(5,null);
	    }    	
	   	else if(i == 1)
	   	{
	   		fs1 = (FileInputStream)list.get(0);
	   		ps1.setBinaryStream(5,fs1,fs1.available());
	   	}	
	    ps1.setString(6,strDateNew);	
		
		int x=ps1.executeUpdate();

		if(x!=0)
		{
			%>
			<script>
			alert("uploaded successfully");
			window.location="candidate.jsp";
			</script>
			<% 
		}
		else
		{
			%>
			<script>
			alert("upload failed");
			window.location="candidate.jsp";
			</script>
			<%
		}
	}	

}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>