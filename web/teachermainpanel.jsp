<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Teacher Panel</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css" type="text/css"/>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <div class="text-right" style="margin-top: 10px;margin-right: 10px;">
        <a style="font-size: 15px" class="btn btn-danger" href="logout">Logout</a>
    </div>
    <%!
    String str = "";
    %>
	<div class="container">
            <%
                str = request.getAttribute("msg").toString();
            %>
            <!--
            Registration / Removal msg state
            -->
            <%= str %>
		<div class="col-sm-8 col-sm-offset-2">
			<br/><br/>
			<hr/>
			<div class="col-sm-4 col-sm-offset-1">
				<!-- Add student  -->
				<a href="addstudent.jsp" class="btn btn-success btn-block"><span class="glyphicon glyphicon-plus"></span> Add student</a>
			</div>
			<div class="col-sm-4 col-sm-offset-1">
				<!-- Remove student -->
				<a href="removestudent.jsp" class="btn btn-warning btn-block"><span class="glyphicon glyphicon-minus"></span> Remove student</a>
			</div>
			<br/><br/>
			<hr/>
			<!-- List of students : -->
			<h3>List of registered students :</h3><br/>
                        <!--
                        Dynamically fetching the list of students using jsp
                        -->
                              
			<div>
				<table class="table table-striped table-hover">
					<tr>
						<th>
							Name of student
						</th>
						<th>
							Registration No.
						</th>
						<th>
							Subject
						</th>
					</tr>
                                        <%
                                            try{
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3306/onlinequiz","root","root");
                                                Statement st = con.createStatement();
                                                String query = "Select * from student";
                                                ResultSet rs = st.executeQuery(query);
                                                while(rs.next()){
                                                    %>

                                                    <tr>
                                                    <td>
                                                        <%= rs.getString("name") %>
                                                    </td>
                                                    <td>
                                                            <%= rs.getString("registration") %>
                                                    </td>
                                                    <td>
                                                            <%= rs.getString("subject") %>
                                                    </td>
                                            </tr>
                                            <%
                                                }
                                                rs.close();
                                                st.close();
                                                con.close();
                                            }catch(Exception e){
                                                    e.printStackTrace();
                                            }
                                        %>
					
				</table>
			</div>
		</div>
	</div>
</body>
</html>