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
public class student_authentication extends HttpServlet {
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String regno = request.getParameter("regno");
            String pass = request.getParameter("password");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3306/onlinequiz","root","root");
            Statement st = con.createStatement();
            String query = "Select * from student where registration = '"+regno+"' && password = '"+pass+"'";
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){
                HttpSession session = request.getSession();
                session.setAttribute("registration_session", regno);
                request.setAttribute("regattr", regno);
                switch(rs.getString("subject")){
                    case "JAVA" : 
                        RequestDispatcher rd = request.getRequestDispatcher("homepage_java.jsp"); 
                        rd.forward(request, response);
                        break;
                    case "ANDROID" : 
                        RequestDispatcher rd1 = request.getRequestDispatcher("homepage_android.jsp"); 
                        rd1.forward(request, response);
                        break;
                    case "CRYPTOGRAPHY" : 
                        RequestDispatcher rd2 = request.getRequestDispatcher("homepage_cryptography.jsp"); 
                        rd2.forward(request, response);
                        break;
                    default : out.println("Not a valid subject");
                }
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
