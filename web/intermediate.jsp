<%-- 
    Document   : intermediate
    Created on : Apr 24, 2014, 2:41:30 PM
    Author     : Nivedita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                     <%
                        String judge;
                        String name=request.getParameter("name");
                        String password=request.getParameter("password");
                        judge=request.getParameter("judge");
                        HttpSession session1=null;
                        session1=request.getSession(true);
                        session1.setAttribute("judge",judge);
                    %>
<%

if(name.equalsIgnoreCase("Ajinkya Kulkarni")&&password.equalsIgnoreCase("1234")||(1==1))
response.sendRedirect("activity.jsp");
else
response.sendRedirect("index.html");%>            
    </body>
</html>
