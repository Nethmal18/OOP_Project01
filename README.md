#  --Navigation Bar --

	<!--nav bar -->

	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="teacherDashboard.jsp">
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
	</nav> `

  --  Also include these in the head --

   - <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -



#    -- Class for the nav bar --

.nav-item 
{
	margin-right : 50px;
}

.nav-item a:hover{
	
	color : royalblue;
}

.navbar-brand {

  font-size: var(--bs-navbar-brand-font-size);
  color: var(--bs-navbar-brand-color);
  text-decoration: none;
  white-space: nowrap;
  top: -23px;
  left: -8px;
  position:absolute;
  height : 50px;
  margin-top : 0px;
}
