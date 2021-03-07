<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Teacher Registration</title>
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
			<h3>Teacher Sign Up</h3>
                        <form action="teacher_registration" method="POST">
					<div class="form-group">
						<input type="text" name="name" class="form-control" placeholder="Name" required>
					</div>
					<div class="form-group">
						<input type="email" name="email" class="form-control" placeholder="Email" required>
					</div>
					<div class="form-group">
						<input type="password" name="password" required placeholder="Password" class="form-control">
					</div>
					<div class="form-group">
						<input type="number" name="contact" required placeholder="Contact" class="form-control">
					</div>
					<div class="form-group">
						<input type="text" name="city" required placeholder="City" class="form-control">
					</div>
					<div class="form-group">
						<input type="text" name="address" required placeholder="Address" class="form-control">
					</div>
					<button type="submit" name="submit" class="btn btn-primary">Submit</button>
				</form><br/>
			</div>
		</div>
	</div>
</body>
</html>