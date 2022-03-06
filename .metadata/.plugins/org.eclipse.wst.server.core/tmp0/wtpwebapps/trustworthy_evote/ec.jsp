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
          <li><a class="nav-link scrollto" href="index.html">Home</a></li>
          <li><a class="nav-link scrollto active" href="ec.jsp">Register Voter</a></li>
          <li><a class="nav-link scrollto" href="candidate.jsp">Register Candidate</a></li>
          <li><a class="nav-link scrollto" href="viewcan.jsp">Candidate Details</a></li>
          <li><a class="nav-link scrollto" href="chart.jsp">Status Chart</a></li>
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
          <h2>Voter Details Registration</h2>
        </div>

        <div class="row">

          <div class="col-lg-10 mt-5 mt-lg-0 d-flex align-items-stretch">
            <form action="ecdb.jsp" enctype="multipart/form-data" method="post" role="form">
              <div class="row">
              
                <div class="form-group col-md-6">
                  <label for="name">Name</label>
                  <input class="form-control" name="name" id="name" type="text" placeholder="Enter voter's full name" required><br>
                </div>
                
                <div class="form-group col-md-6">
                  <label for="name">Age</label>
                  <input class="form-control" name="age" id="age" type="text" placeholder="Enter age of the voter" min=18 max=200 required><br>
                </div>
                
                <div class="form-group col-md-6">
                  <label for="name">District</label>
                  <input class="form-control" name="district" id="password" type="text" placeholder="Enter voter's district" required><br>
                </div>
                
                <div class="form-group col-md-6">
                  <label for="name">State</label>
                 	   <select name="state" id="mobile" class="form-control" required>
                  			<option>Select</option>
							<option value="Andhra Pradesh">Andhra Pradesh</option>
							<option value="Arunachal Pradesh">Arunachal Pradesh</option>
							<option value="Assam">Assam</option>
							<option value="Bihar">Bihar</option>
							<option value="Chhattisgarh">Chhattisgarh</option>
							<option value="Goa">Goa</option>
							<option value="Gujarat">Gujarat</option>
							<option value="Haryana">Haryana</option>
							<option value="Himachal Pradesh">Himachal Pradesh</option>
							<option value="Jharkhand">Jharkhand</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Kerala">Kerala</option>
							<option value="Madhya Pradesh">Madhya Pradesh</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Manipur">Manipur</option>
							<option value="Meghalaya">Meghalaya</option>
							<option value="Mizoram">Mizoram</option>
							<option value="Nagaland">Nagaland</option>
							<option value="Odisha">Odisha</option>
							<option value="Punjab">Punjab</option>
							<option value="Rajasthan">Rajasthan</option>
							<option value="Sikkim">Sikkim</option>
							<option value="Tamil Nadu">Tamil Nadu</option>
							<option value="Telangana">Telangana</option>
							<option value="Tripura">Tripura</option>
							<option value="Uttar Pradesh">Uttar Pradesh</option>
							<option value="Uttarakhand">Uttarakhand</option>
							<option value="West Bengal">West Bengal</option>
							
				  		</select><br>
                  <!--  <input class="form-control" name="state" id="mobile" type="text" placeholder="Enter voter's state" required><br>   -->
                </div>
                
                
                
                <div class="form-group col-md-6">
                  <label for="name">Mobile</label>
                  <input class="form-control" name="mobile" id="mobile" type="text" placeholder="Enter voter's mobile number" required><br>
                </div>
                
                <div class="form-group col-md-6">
                  <label for="name">Father Name</label>
                  <input class="form-control" name="Father/Husband" id="name" type="text" placeholder="Enter voter's father's names" required><br>
                </div>
                
                <div class="form-group col-md-6">
                  <label for="name">DOB</label>
                  <input class="form-control" name="dob" id="email" type="date" placeholder="Enter voter's Date of Birth" min="01-01-2002" required><br>
                </div>
                
                 <div class="form-group col-md-6">
                  <label for="email">Gender</label>
                  		<select name="gender" class="form-control" required>
                  			<option>Select</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
							<option value="Others">Others</option>
				  		</select>
                </div>
                
                <div class="form-group col-md-12">
                  <label for="email">Upload Voter-ID card</label>
                  <input class="form-control" name="image" id="mobile" type="file" placeholder="Upload file" required><br>
                </div>
                
              </div>
              <button class="btn btn-primary" type="submit" value="submit">Submit</button>
              <button class="btn btn-primary" type="reset" value="clear">Reset</button>
            </form>
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