<%-- 
    Document   : Modify
    Created on : 08-feb-2020, 21:26:50
    Author     : SERGI
--%>

<%@page import="controlador.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TODO modify</title>
        <%  //if Sesion is not instanciated in index.jsp (cos user never visit it, this throws NullPointerException, this code should be improved
            Sesion s=null;
            String [] lista=null;
            try {
                //session.getAttribute("logged");??
                s = (Sesion) request.getSession().getAttribute("logged");
            
            if(!s.getLogged()){ %>
            <script>
                if (window.confirm('No tienes permisos para modificar ni deberias haber llegado a este link')) 
                {
                    window.location.href='http://localhost:8080/Login2/index.jsp';
                };
            </script>
            <% } 
                //response.sendRedirect("http://localhost:8080/Login2/index.jsp");
            }catch(Exception e){
                response.sendRedirect("http://localhost:8080/Login2/index.jsp");
            }
            %>
    </head>
    <body>
        <% Boolean a= controlador.Cloud.modifyOriginal(request.getParameter("id"));
        out.println("TRUE vamos tuuuuu");%>
    </body>
</html>
