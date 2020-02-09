<%-- 
    Document   : Download.jsp
    Created on : 05-feb-2020, 19:50:09
    Author     : SERGI
--%>

<%@page import="controlador.Cloud"%>
<%@page import="controlador.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%  //if Sesion is not instanciated in index.jsp (cos user never visit it, this throws NullPointerException, this code should be improved 
            try {
                //session.getAttribute("logged");??
                Sesion s = (Sesion) request.getSession().getAttribute("logged");
            
                if(!s.getLogged()){
                response.sendRedirect("http://localhost:8080/Login2/index.jsp");
            }
            }catch(Exception e){
                response.sendRedirect("http://localhost:8080/Login2/index.jsp");
            }
            
        %>
        <title>TODO List</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String downLink = Cloud.waitForIt(id);
            response.sendRedirect(downLink);%>
    </body>
</html>
