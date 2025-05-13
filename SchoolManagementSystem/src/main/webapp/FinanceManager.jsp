<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Finance Dashboard</title>
    <link rel="stylesheet" href="FinanceManager.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="teacherDashboard.css">
    
    
</head>
<body>
    <!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="teacherDashboard.jsp">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="teacherDashboard.jsp">Home</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="ExamManagement.jsp">Exam</a>
		        </li>
		        
		        <li class="nav-item" >
		          <a class="nav-link" href="#">FAQ</a>
		        </li>
            
		        
		      </ul>
		
		    
		            
		      
		      <div   onclick = "location.href='home.jsp'"  class = "logOutDiv">
		
					<img class ="logOutIcon" src = "images/signOut.png">
		      
		      </div>
		      
		        
		      <div class = "profile-pic">
			   	  	
				<img class ="profile-pic img" src = "images/profilePic.png">
		      </div>
		      
		     
		    </div>
		  </div>
	</nav> 

    
    

    <div class="container">
        <div class="left-image">
            <img src="image/finance.png" alt="Finance Image" />
        </div>

        <div class="dashboard-card">
            <h1 class="dashboard-title">Finance Manager</h1>

            <div class="box-container">
                <!-- Changed to redirect to servlet instead of directly to JSP -->
                <button onclick="location.href='ExpensesServlet'" class="box">Expenses</button>
                <!-- Changed to redirect to servlet instead of directly to JSP -->
                <button onclick="location.href='IncomeServlet'" class="box">Income Sources</button>
            </div>

            <div id="piechart" class="chart"></div>
        </div>
    </div>
</body>
</html>
