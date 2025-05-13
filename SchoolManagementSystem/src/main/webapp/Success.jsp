<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- Modal -->
    <div class="modal show d-block" tabindex="-1" style="background-color: rgba(0, 0, 0, 0.5);">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title text-success">Success</h5>
          </div>
          <div class="modal-body">
            <p>Your operation was successful.</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" onclick="redirect()">OK</button>
          </div>
        </div>
      </div>
    </div>

    <!-- JS to redirect -->
    <script>
      function redirect() {
        window.location.href = "admin.jsp"; 
      }
    </script>

    <!-- Bootstrap JS (for future if needed) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>