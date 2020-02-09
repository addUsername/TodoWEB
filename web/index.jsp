<%-- 
    Document   : index
    Created on : 01-feb-2020, 17:40:04
    Author     : SERGI
--%>

<%@page import="controlador.Sesion"%>
<%@page import="controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3 align="center"> FIRST TO-DO</h3>
        <form action ="index.jsp" method="POST"> 
            <ul>
                <li>
            USER: <input type="text" name="user"/>
            PASS: <input type="password" name="pass"/>
                </li>
                <li>
            <input type="submit" value="log in"/>
                </li>
            </ul> 
        </form>
        <%
            Sesion logged = new Sesion();
            Consultas consulta = new Consultas();
            Boolean access = consulta.autentificacion(request.getParameter("user"),request.getParameter("pass"));
            
            
            if (access){
                logged.setLogged();
                logged.setAccesToAvoidFutureNon_StaticShit(consulta);
                
                
                response.sendRedirect("http://localhost:8080/Login2/home.jsp");
            } else{
                out.println("usuario/contraseña incorrectos");
            }
            //añadimos un objeto Sesion a la session implicit object
            session.setAttribute("logged", logged);
            Sesion s = (Sesion) request.getSession().getAttribute("logged");
            if(request.getParameter("user")!=null)s.setSuperUser(request.getParameter("user"));

        %>
        
    </body>
</html>
