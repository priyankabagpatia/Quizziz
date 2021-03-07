/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class teacher_registration extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contact = request.getParameter("contact");
            String city = request.getParameter("city");
            String address = request.getParameter("address");
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3306/onlinequiz","root","root");
            Statement st = con.createStatement();
            String query = "insert into teacher values('"+name+"','"+email+"','"+password+"','"+contact+"','"+city+"','"+address+"')";
            request.setAttribute("msgt","Registration done successfully");
            RequestDispatcher rd = request.getRequestDispatcher("teacherlogin.jsp");
            rd.forward(request, response);
            st.executeUpdate(query);
            st.close();
            con.close();
        }catch(ClassNotFoundException | SQLException e){
            out.println(e);
        }
    }
}
