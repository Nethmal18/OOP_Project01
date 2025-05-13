<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher Management</title>
    
    <link rel="stylesheet" type="text/css" href="css/button1.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <style>
    	.card {
		    border-radius: 15px;
		    transition: transform 0.2s;
		}
		.card:hover {
		    transform: scale(1.02);
		}
		.card-footer button {
		    width: 80px;
		}

		.nav-item { 
			margin-right : 50px;
		}

		.nav-item a:hover{
			color : royalblue;
		}

		.navbar-brand {
			font-size: var(--bs-navbar-brand-font-size); color: var(--bs-navbar-brand-color); text-decoration: none; white-space: nowrap; top: -23px; left: -8px; position:absolute; height : 50px; margin-top : 0px; }
    	.add-new-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .add-new-box {
            background-color: #fff;
            border: 2px dashed #007bff;
            border-radius: 12px;
            padding: 20px;
            cursor: pointer;
            text-align: center;
            transition: background 0.3s ease;
        }

        .add-new-box:hover {
            background-color: #f0f8ff;
        }

        .add-new-icon {
            font-size: 30px;
            color: #007bff;
        }

        .add-new-text {
            margin-top: 5px;
            font-weight: bold;
            color: #007bff;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            padding: 20px 40px;
        }

        .admin-card {
            background: white;
            padding: 20px;
            border-radius: 16px;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
        }

        .admin-card:hover {
            transform: translateY(-5px);
        }

        .admin-card h3 {
            margin-top: 0;
            color: #2c3e50;
        }

        .admin-card p {
            margin: 8px 0;
            font-size: 14px;
            color: #555;
        }

        .card-actions {
		    margin-top: 16px;
		    display: flex;
		    margin-left: 20px;
		    gap: 10px;
		    padding-bottom: 15px;
		}


        .custom-button {
            flex: 1;
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
            border: none;
            background-color: #007bff;
            color: white;
            transition: background 0.2s ease-in-out;
        }

        .custom-button:hover {
            background-color: #0056b3;
        }

        .custom-button.delete {
            background-color: #e74c3c;
        }

        .custom-button.delete:hover {
            background-color: #c0392b;
        }
        
        .custom-button i {
    vertical-align: middle;
    font-size: 16px;
}
        .custom-button {
    padding: 8px 14px;
    border-radius: 50%;
}
        
    </style>
    <!-- Optionally use Font Awesome or Emoji for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary" >
	  <div class="container-fluid">
	        <a class="navbar-brand" href="teacherDashboard.jsp">
 				 <img src="images/logo.png" alt="LOGO" width="130" height="115"> 
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

    <!-- <button class="custom-button" onclick="window.location.href='InsertStudent.jsp'">+Add New</button> -->
	 <div class="add-new-container">
	    <div class="add-new-box" onclick="window.location.href='InsertTeacher.jsp'">
	  			<div class="add-new-icon">+</div>
	  			<div class="add-new-text">Add New</div>
		</div>
    </div>
    <br><br><br>
    <!-- Teacher Card Grid Display -->
<div class="container mt-4">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <c:forEach var="tc" items="${tcDetails}">
            <c:set var="tid" value="${tc.id}" />
            <c:set var="fname" value="${tc.fname}" />
            <c:set var="lname" value="${tc.lname}" />
            <c:set var="email" value="${tc.email}" />
            <c:set var="phone" value="${tc.phone}" />
            <c:set var="address" value="${tc.address}" />
            <c:set var="nic" value="${tc.nic}" />
            <c:set var="salary" value="${tc.salary}" />
            <c:set var="hd" value="${tc.hireDate}" />
            <c:set var="ex" value="${tc.experience}" />
            <c:set var="sp" value="${tc.specialization}" />
            <c:set var="dsig" value="${tc.designation}" />
            <c:set var="pass" value="${tc.password}" />

            <c:url value="UpdateTeacher.jsp" var="update">
                <c:param name="tid" value="${tc.id}" />
                <c:param name="fname" value="${tc.fname}" />
                <c:param name="lname" value="${tc.lname}" />
                <c:param name="email" value="${tc.email}" />
                <c:param name="phone" value="${tc.phone}" />
                <c:param name="address" value="${tc.address}" />
                <c:param name="nic" value="${tc.nic}" />
                <c:param name="salary" value="${tc.salary}" />
                <c:param name="hd" value="${tc.hireDate}" />
                <c:param name="ex" value="${tc.experience}" />
                <c:param name="sp" value="${tc.specialization}" />
                <c:param name="dsig" value="${tc.designation}" />
                <c:param name="pass" value="${tc.password}" />
            </c:url>

            <div class="col">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">${tc.fname} ${tc.lname}</h5>
                        <p><strong>ID:</strong> ${tc.id}</p>
                        <p><strong>Email:</strong> ${tc.email}</p>
                        <p><strong>Phone:</strong> ${tc.phone}</p>
                        <p><strong>NIC:</strong> ${tc.nic}</p>
                        <p><strong>Address:</strong> ${tc.address}</p>
                        <p><strong>Salary:</strong> ${tc.salary}</p>
                        <p><strong>Hire Date:</strong> ${tc.hireDate}</p>
                        <p><strong>Experience:</strong> ${tc.experience}</p>
                        <p><strong>Specialization:</strong> ${tc.specialization}</p>
                        <p><strong>Designation:</strong> ${tc.designation}</p>
                        <p><strong>Password:</strong> ${tc.password}</p>
                    </div>
                    <div class="card-actions">
		                <form action="${update}" method="get" style="display:inline;">
		                    <button type="submit" class="custom-button" title="Update">
		                        <i class="fas fa-edit"></i>
		                    </button>
		                </form>
                        <form method="post" action="TeacherInsertServlet" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this Teacher?');">
                            <input type="hidden" name="tid" value="${tc.id}" />
                            <input type="hidden" name="action" value="delete" />
                            <button type="submit" class="custom-button delete" title="Delete">
                        	<i class="fas fa-trash-alt"></i>
                    		</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
