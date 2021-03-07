<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Add Student</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css" type="text/css"/>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<br/><br/><br/>
		<div class="row">
			<div class="col-xs-4 col-xs-offset-4">
			<h3>Student Registration</h3>
                        <form action="student_registration" method="POST">
					<div class="form-group">
						<input type="text" name="name" class="form-control" placeholder="Name" required>
					</div>
					<div class="form-group">
						<input type="text" name="regno" required placeholder="Registration Number" class="form-control">
					</div>
					<div class="form-group">
                                            <select name="subject"  required class="form-control">
                                                <option value="JAVA">JAVA</option>
                                                <option value="ANDROID">ANDROID</option>
                                                <option value="CRYPTOGRAPHY">CRYPTOGRAPHY</option>
                                            </select>
					</div>
					<div class="form-group">
                                            <input type="password" name="password" required placeholder="Password" class="form-control">
					</div>                                    
					<button type="submit" name="submit" class="btn btn-success btn-block">Register</button>
				</form><br/>
			</div>
		</div>
	</div>
</body>
</html>