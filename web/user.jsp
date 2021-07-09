<%-- 
    Document   : user
    Created on : 24 Mar, 2019, 1:23:41 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>USER DETAILS</h1>
         <% 
            String name = request.getParameter("name");
           String email=request.getParameter("email");
           String pass = request.getParameter("pass");
           String mob_no=request.getParameter("mob_no");
           
           %>
           
           <table border="0">
               <tbody>
                   <tr>
                       <td><strong>Name :</strong></td>
                       <td><p><%=name%></p></td>
                   </tr>
                   <tr>
                       <td><strong>Email :</strong></td>
                       <td><p><%=email%></p></td>
                   </tr>
                   <tr>
                       <<td><strong>password :</strong></td>
                       <td><p><%=pass%></p></td>
                   </tr>
                   <tr>
                      <td><strong>mobile No.:</strong></td>
                       <td><p><%=mob_no%></p></td>
                   </tr>
               </tbody>
           </table>

           
    </body>
</html>
