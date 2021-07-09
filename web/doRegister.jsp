<%-- 
    Document   : doRegister
    Created on : 24 Oct, 2018, 12:01:48 AM
    Author     : acer
--%>

<%@page import="java.sql.SQLException"%>
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
            String name = request.getParameter("name");
           String email=request.getParameter("email");
           String pass = request.getParameter("pass");
           String mob_no=request.getParameter("mob_no");
           
                try{
    Class.forName("com.mysql.jdbc.Driver");
    // loads mysql driver

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fashion_hub", "root", ""); 

    String query = "insert into user(u_name,email,password,mob_no) values(?,?,?,?)";

    PreparedStatement ps = con.prepareStatement(query); // generates sql query

    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3,pass );
    ps.setString(4, mob_no);
           
                
    int b =ps.executeUpdate();
    if(b>0)
    {
        %>
    <center><font style="color:green";>Registered Successfully!! Please Login to continue</font><center>
        <%
        RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
        rd.include(request, response);
    }
    else{
%>
       <center><font style="color:green";>Mobile No. already registered!! Please Login to continue or use another Mobile no. to register</font><center>
               <%
       RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
        rd.include(request, response);
    }
    ps.close();
    con.close();
   } catch (ClassNotFoundException | SQLException e) {
%>
    <center><font style="color:green";>Mobile No. already registered!! Please Login to continue or use another Mobile no. to register</font><center>
               <%
       RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
        rd.include(request, response);
   

}
            %>
    </body>
</html>
