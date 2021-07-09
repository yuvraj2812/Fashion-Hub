<%-- 
    Document   : checkuser
    Created on : 24 Oct, 2018, 1:46:05 PM
    Author     : acer
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
           
           String mob = request.getParameter("mob");
           String pass = request.getParameter("pass");
           try{
    Class.forName("com.mysql.jdbc.Driver");
    // loads mysql driver

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fashion_hub", "root", ""); 

    String query = "select * from user where mob_no=? and password=?";

    PreparedStatement ps = con.prepareStatement(query); // generates sql query

    ps.setString(1,mob);
    ps.setString(2,pass);
    
    ResultSet rs = ps.executeQuery();
           
    
    if(rs.isBeforeFirst())
    {
        session.setAttribute("mob",mob);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
    else{
        %>
    <center> <font style="color:red;">Invalid Mobile No. or Password</font></center>
       <%
        RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
        rd.include(request, response);
    }
    ps.close();
    con.close();
   } catch (ClassNotFoundException | SQLException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
   }
           %>
    </body>
</html>
