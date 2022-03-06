<%@ page import ="java.sql.*" %>
<%
    try{
        String uniqueid = request.getParameter("uniqueid");   
        String key2 = request.getParameter("key2");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting2","root","poojitha");    
        PreparedStatement pst = conn.prepareStatement("Select uniqueid,key2 from ecvalid where uniqueid=? and key2=?");
        pst.setString(1, uniqueid);
        pst.setString(2, key2);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())
        {
        	%>
    		<script>
	    		window.location="ecregistration.jsp";
    		</script>
    		<%   
        }
        else
        {	
        
	        %>
			<script>
				alert("Invalid Credentials");
	    		window.location="zecform.jsp";
			</script>
			<%  
        }
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>