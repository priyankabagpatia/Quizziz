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

/**
 *
 * @author Priyanka Bagpatia
 */
public class student_registration extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String name = request.getParameter("name");
            String regno = request.getParameter("regno");
            String subject = request.getParameter("subject");
            String password = request.getParameter("password");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3306/onlinequiz","root","root");
            Statement st = con.createStatement();
            String query = "insert into student values('"+name+"','"+regno+"','"+subject+"','"+password+"')";
            st.executeUpdate(query);
            request.setAttribute("msg","Registration done successfully");
            RequestDispatcher rd = request.getRequestDispatcher("teachermainpanel.jsp");
            rd.forward(request, response);
            st.close();
            con.close();
        }catch(ClassNotFoundException | SQLException e){
            out.println(e);
        }
    }
}
