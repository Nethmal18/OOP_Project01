<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="paymentPage.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<title>Payment Complete</title>
	<link rel="icon" type="image/png" href="images/faviconIcon.png">
	
	<!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="#">Link1</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="#">Link2</a>
		        </li>
		        
		        <li class="nav-item" >
		          <a class="nav-link" href="#">Link3</a>
		        </li>
		        
		        
		        
		      </ul>
		      <form class="d-flex" role="search">
		        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		        <button class="btn btn-outline-success" type="submit">Search</button>
		      </form>
		    </div>
		  </div>
	</nav> 
<body>

<div class = "paySuccess">
	
		<div>
			<img src="images/paymentComplete.png" alt="Centered Image" width = "450" height = "450">
		</div>
		
		<div>
			<h2 style = "margin: 40px 0px 50px 0px">We appreciate your payment. It has been processed successfully.</h2>
		</div>
		
		<div>
			<a href = "StudentDashboardServlet"><button type="button" class="btn btn-primary btn-lg">Go Back</button></a>

		</div>

	</div>

</body>
</html>