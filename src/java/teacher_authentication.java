/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Priyanka Bagpatia
 */
public class teacher_authentication extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3306/onlinequiz","root","root");
            Statement st = con.createStatement();
            String query = "Select * from teacher where email = '"+email+"' && password = '"+pass+"'";
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){
                HttpSession session = request.getSession();
                session.setAttribute("teacher_email_session", email);
                request.setAttribute("msg", "Logged In successful, Welcome "+ rs.getString("name"));
                request.setAttribute("teacher_info", rs.getString("name"));
                RequestDispatcher rd = request.getRequestDispatcher("teachermainpanel.jsp");
                rd.forward(request, response);
            }else{
                out.println("Wrong user name or password");
            }
            rs.close();
            st.close();
            con.close();
        }catch(ClassNotFoundException | SQLException e){
            out.println(e);
        }
    }
}