<%-- 
    Document   : index
    Created on : Mar 21, 2020, 1:19:38 PM
    Author     : Vivek Patidar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online Quiz</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css" type="text/css"/>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<br/>
		<div class="jumbotron" style="border: 1px solid black;">
			<h2 class="text-center">Welcome to Quizo online quiz</h2>
		</div>
		<div class="col-sm-6">
			<div>
				<h3 class="text-center text-justify">
					The QUIZO online quiz application let the students give online examination and check
                                        their capabilities and potential in their respective fields. This examination is made
                                        using JSP Servlet and JDBC is used for database. This online quiz application is made
                                        for <b>Mini Project</b> by <b>Vivek Patidar</b>. To get started, first get yourself registered by your teacher.
                                        The teacher will also use this application to sign in and register as well as remove students.
                                        At the end you will be able to see leaderboard which will consist of all the exam results
                                        evaluated so far.
                                        All the best !
				</h3>
			</div>
		</div>
		<div class="col-sm-5 col-sm-offset-1">
			<br/>
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3><span class="glyphicon glyphicon-education"></span> Student Login</h3>
				</div>
				<div class="panel-body">
					<p>Login to start quiz</p>
                                        <form action="student_authentication" method="POST">
						<div class="form-group">
							<input type="text" name="regno" class="form-control" placeholder="Enter Registration number" required>
						</div>
						<div class="form-group">
							<input type="password" name="password" required placeholder="Enter Password" class="form-control">
						</div>
						<button type="submit" name="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
				<div class="panel-footer"><p><span class="glyphicon glyphicon-edit"></span> No account? Ask your teacher to create one.</p>
				</div>
			</div>
			<hr/>
			<div class="btn btn-default">
				<a href="teacherlogin.jsp"><h4><span class="glyphicon glyphicon-pencil">&nbsp;</span> Login as Teacher</h4></a>
			</div><hr/>
		</div>
	</div>
	<br/><br/><br/>
	<footer style="position: fixed;
	padding: 10px 0;
	background-color: #101010;
	color: #9d9d9d;
	bottom: 0;
	width: 100%;">
		<div class="container">
			<p class="text-center">Online quiz application Copyright &copy Vivek Patidar</p>
		</div>
	</footer>
</body>
</html>