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
public class check_cryptography extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String reg = request.getParameter("hidden_reg");
        String name = null,subject = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3306/onlinequiz","root","root");
            Statement st = con.createStatement();
            String query = "Select * from student where registration = '"+reg+"'";
            ResultSet rs = st.executeQuery(query);
            if(rs.next()){
                name = rs.getString("name");
                subject = rs.getString("subject");
            }else{
                out.print("Error");
            }
            rs.close();
            st.close();
            con.close();
        }    catch(Exception ex){
            out.print(ex);
        }
            
        int count = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3306/onlinequiz","root","root");
            Statement st = con.createStatement();
            for(int i=1;i<=10;i++){
                String ans = request.getParameter("cryptography_option["+i+"]");
                String query = "Select * from questions_cryptography where question_id = '"+i+"' ";
                ResultSet rs = st.executeQuery(query);
                if(rs.next()){
                    if(ans.equals(rs.getString("answer"))){
                        count++;
                    }
                }
            }
            
            String update_query = "Insert into result values('"+reg+"','"+name+"','"+subject+"','"+count+"')";
            st.executeUpdate(update_query);
            st.close();
            con.close();
                    
                    
        }catch(ClassNotFoundException | SQLException e){
            out.print(e);
        }
        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
         
    }
}