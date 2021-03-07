<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Homepage</title>
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
        String reg = "";
        String name = "";
        String sub = "";
    %>
    <%
        reg = request.getAttribute("regattr").toString();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3306/onlinequiz","root","root");
            Statement st = con.createStatement();
            String query = "Select * from student where registration = '"+reg+"'";
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){
                name = rs.getString("name");
                sub = rs.getString("subject");
            }else{
                out.print("Error");
            }
            rs.close();
            st.close();
            con.close();
        }    catch(Exception ex){
            out.print(ex);
        }
    %>
    <div class="container" style="border: solid #000 1px; margin-top: 20px;margin-bottom: 20px;">
        <div class="col-sm-6 col-sm-offset-2">
            <h3 class="text-justify text-left">Name - <%= name %><br/>
                Registration no. - <%= reg %><br/>
                Subject - <%= sub %>
            </h3>
        </div>
        <div class="col-sm-6 col-sm-offset-3">
        <h1 class="text-muted">
            <hr/>CRYPTOGRAPHY EXAMINATION<hr/>
        </h1>
                <h4 class="text-left"> Select any one among the four given options in the below questions : </h4><br/>
        </div>
            
        <div class="row">
            <%
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3306/onlinequiz","root","root");
                Statement st = con.createStatement();
                String query = "Select * from questions_cryptography";
                ResultSet rs = st.executeQuery(query);
                %>
                <form action="check_cryptography" method="POST">
                    <input type="hidden" name="hidden_reg" value="<%= reg %>"/>
                                    <%
                while(rs.next()){
                    %>
                <div class="panel panel-primary col-lg-6 col-lg-offset-3">
                    <div class="panel-title">
                        <h4>Question <%= rs.getString("question_id").toString() %> :  <%= rs.getString("question").toString() %>  </h4>
                    </div>
                        <div class="panel-body">
                        
                            <input type="radio" name="cryptography_option[<%= rs.getString("question_id").toString() %>]" value="<%= rs.getString("option1").toString() %>" required/> <%= rs.getString("option1").toString() %><br/>
                            <input type="radio" name="cryptography_option[<%= rs.getString("question_id").toString() %>]" value="<%= rs.getString("option2").toString() %>" required/> <%= rs.getString("option2").toString() %><br/>
                            <input type="radio" name="cryptography_option[<%= rs.getString("question_id").toString() %>]" value="<%= rs.getString("option3").toString() %>" required/> <%= rs.getString("option3").toString() %><br/>
                            <input type="radio" name="cryptography_option[<%= rs.getString("question_id").toString() %>]" value="<%= rs.getString("option4").toString() %>" required/> <%= rs.getString("option4").toString() %><br/>
                        
                    </div>
                </div>
                            <%
                }
                %>
                            
                    <%
                
            }catch(Exception ex){
                out.print(ex);
            }

            %>
            
        </div>
            <div class="col-sm-6 col-sm-offset-3">
                <div class="text-center">
                                    <input class="btn btn-success" type="submit" value="SUBMIT"/>

                </div>
                            </div>  

                </form>
            
            <br/><br/><hr/>
                
                    
    </div>
</body>
</html>