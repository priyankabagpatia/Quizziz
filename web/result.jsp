<%-- 
    Document   : result
    Created on : Apr 12, 2020, 4:43:49 PM
    Author     : Vivek Patidar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>RESULT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css" type="text/css"/>
  <script src="js/bootstrap.min.js"></script>
</head>
    <body>
        <div class="text-right" style="margin-top: 10px;margin-right: 10px;">
        <a style="font-size: 15px" class="btn btn-danger" href="logout">Logout</a>
    </div>
        <div class="container" style="margin-top: 50px;">
            <div class="jumbotron" style="border: solid #000 1px;">
                <p class="text-center text-muted">Thank you for attending the exam!</p>
                <h3 class="text-center">LEADER BOARD</h3>
            </div>
				<table class="table table-striped table-hover table-bordered">
					<tr>
                                                <th>
                                                	Registration No.
						</th>
						<th>
							Name of student
						</th>
						<th>
							Subject
						</th>
                                                <th>
                                                        Score
                                                </th>
					</tr>
                                        <%
                                            try{
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3306/onlinequiz","root","root");
                                                Statement st = con.createStatement();
                                                String query = "Select * from result";
                                                ResultSet rs = st.executeQuery(query);
                                                while(rs.next()){
                                                    %>

                                                    <tr>
                                                        <td>
                                                            <%= rs.getString("reg_no") %>
                                                        </td>
                                                    <td>
                                                        <%= rs.getString("name") %>
                                                    </td>
                                                    <td>
                                                            <%= rs.getString("subject") %>
                                                    </td>
                                                    <td>
                                                        <%= rs.getString("score") %>
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
    </body>
</html>
