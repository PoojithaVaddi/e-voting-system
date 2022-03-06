<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="databaseconn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chart.Eresult"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>E-Voting</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/elogo.png" rel="icon">
  <link href="assets/img/elogo.png" rel="elogo">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

 
</head>

<body>
	<!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html">MyVote</a></h1>
      

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="ec.jsp">Back to EC Home Page</a></li>
          <li><a class="nav-link scrollto" href="candidate.jsp">Register Candidate</a></li>
          <li><a class="nav-link scrollto" href="viewcan.jsp">Candidate Details</a></li>
          <li><a class="nav-link scrollto active" href="chart.jsp">Visualize</a></li>
          <li><a class="nav-link scrollto" href="eclogin.jsp">Logout</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
  
  
  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container footer-bottom clearfix">
      <div class="copyright">
        &nbsp; 
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/ -->
         <a href="https://bootstrapmade.com/"></a>
      </div>
    </div>
  </footer><!-- End Footer -->
  
<!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">
      
      		<div class="section-title">
	          <h2>Election Result</h2>
	      	</div>
			
			<!-- Main -->
				<div class="inner">
					
				  <form action="#">
					<table class="tab">   
					<tr><td><label style="color: blue;">Select Type:</label></td>
					<td>
						<select class="form-control" name="type" style="color: blue;">
							<option>Select</option>
							<option value="column">Column Chart</option>
							<option value="bar">Bar Chart</option>
							<option value="area">Area Chart</option>
							<option value="spline">Spline Chart</option>
							<option value="pie">Pie Chart</option>
							<option value="line">line Chart</option>
						</select>
					</td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<td><input type="submit" value="submit" style="color: blue;" /></td></tr>
<%
List<Eresult> list=new ArrayList<Eresult>();
int count;
String s="";
try
{
	Connection conn=DBConnection.getconnection();
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery("SELECT candidate.name,candidate.state, COUNT(election.vote) AS count FROM election LEFT JOIN candidate ON (candidate.id=election.vote) GROUP BY election.vote, candidate.name ORDER BY candidate.name");
		while(rs.next())
		{	   
	    	String date =rs.getString("name");
	    	String state=rs.getString("state");
	    	System.out.println("$$$$$$$date"+date);
	        count = rs.getInt("count");
	        System.out.println("$$$$$$$count"+count);
	        Eresult gp=new Eresult();
	        gp.setName(date+" ("+state+") ");	       
	        gp.setCount(count);
	        list.add(gp);
		}
	    for(Integer i =0;i<list.size(); i++)
	    {
	    	Eresult a = list.get(i);
	    	s=s+"{label: \""+a.getName()+"\",y:"+a.getCount()+"},";
	    } 

}
catch(Exception e)
{
	e.printStackTrace();
}
%>    
    </table></form>
     <%
   String type = request.getParameter("type");
   %>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">

window.onload = function () 
{
	var chart = new CanvasJS.Chart("chartContainer", {
	theme: "theme1",//theme1
	title:{text: "" },
	animationEnabled: true,   // change to true
	data: [              
	{
	// Change type to "bar", "area", "spline", "pie",etc.
	type: "<%=type%>",
	dataPoints: [
	            <%=s%>
	]
	}
	]
	});
	chart.render();
}
</script>  
<div id="chartContainer" style="height: 500px; width: 900px; margin-left: 150px; position: related;"></div>
					
				</div>
        
      </div>
    </section><!-- End Contact Section -->
  
			
		<div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  
  
  
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

</body>

</html>