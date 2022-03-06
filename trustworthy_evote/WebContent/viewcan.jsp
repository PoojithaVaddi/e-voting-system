<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
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
          <li><a class="nav-link scrollto active" href="viewcan.jsp">Candidate Details</a></li>
          <li><a class="nav-link scrollto" href="chart.jsp">Visualize</a></li>
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
     <div class="container" data-aos="fade-up" align="center">
	     <div class="section-title">
	          <h2>Registered Candidate Details</h2><br>
	      </div>
	      
      	  <div class="inner" style="padding-left:200px;" >
			   <div class="table-wrapper">
					<table class="alt" style=" width:1000px; margin:0;" cellpadding="0" cellspacing="0" border="0">
						<thead>
							<tr style="height:40px; width:450px; margin:5;">
								<th>Candidate Name</th>
								<th>District</th>
								<th>State</th>
								<th>Logo</th>
							</tr>
						</thead>
						<tbody>
							<%
								try
								{
									Connection con=DBConnection.getconnection();
									String sql="select * from candidate";
									PreparedStatement ps=con.prepareStatement(sql);
									ResultSet rs=ps.executeQuery();
									while(rs.next())
									{
										%>
											<tr>
												<td><%=rs.getString("name") %></td>
												<td><%=rs.getString("district") %></td>
												<td><%=rs.getString("state") %></td>
												<td><img style="width: 150px; height: 150px;" src="Document/<%=rs.getString("iname")%>"></td>
											</tr>
										<%
									}
								}
								catch(Exception e)
								{
									e.printStackTrace();
								}											
							%>
												
						</tbody>
					</table>
				</div>
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