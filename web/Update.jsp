<%-- 
    Document   : Update
    Created on : 06-feb-2020, 1:47:02
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
            Sesion s=null;
            try {
                //session.getAttribute("logged");??
                s = (Sesion) request.getSession().getAttribute("logged");
            
            if(!s.getLogged()){
                response.sendRedirect("http://localhost:8080/Login2/index.jsp");
            }
            }catch(Exception e){
                response.sendRedirect("http://localhost:8080/Login2/index.jsp");
            }
            
        %>
        <title>JSP Page</title>
    </head>
    <body>
                
            <%
                String path = Cloud.modify(request.getParameter("id"), s.getUpdateText());
                //hola JS
                if(path!=null){%>
                    <script>alert('Archivo modificado con exito!!');</script>                
                <%}%>
                //mirar
        <a href='<%="http://localhost:8080/Login2/Download.jsp?id="+request.getParameter("id")+"-UPDATE"%>'>Download</a>    
        <a href="<%="http://localhost:8080/Login2/Indetail.jsp?id="+request.getParameter("id")%>">go back</a>
        
    </body>
</html>
