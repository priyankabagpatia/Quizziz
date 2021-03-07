<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Teacher Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css" type="text/css"/>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <%
        request.setAttribute("msg","");
    %>
	<div class="container">
            <p><%= request.getAttribute("msgt") %></p>
				<br/><br/><br/>
		<div class="row">
			<div class="col-xs-4 col-xs-offset-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
					<h4>Teacher Login</h4>
					</div>
					<div class="panel-body">
                                            <form action="teacher_authentication" method="POST">
							<div class="form-group">
								<input type="email" name="email" class="form-control" placeholder="Email" required>
							</div>
							<div class="form-group">
								<input type="password" name="password" required placeholder="Password" class="form-control">
							</div>
							<button type="submit" name="submit" class="btn btn-primary">Login</button>
						</form><br/>
					</div>
					<div class="panel-footer"><p>Don't have an account? <a href="teacherregister.jsp">Register</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>