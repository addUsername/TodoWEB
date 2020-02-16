<%-- 
    Document   : add
    Created on : 09-feb-2020, 20:25:10
    Author     : SERGI
--%>

<%@page import="controlador.Sesion"%>
<%@page import="controlador.Cloud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TODO list</title>
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
    </head>
    <body>
        <%  
            String borrarID = request.getParameter("borrar_ID");
            String newState = request.getParameter("newState");
            //debemos generar un string y llamar a addTodo()
            String input = "'"+request.getParameter("language")+"','"+request.getParameter("name")+"',"+request.getParameter("state");
            //el objeto s nos salva la vida de manera continuada y nos la lia un poco tb
            System.out.println(input+" .length = "+input.length());
            String description = request.getParameter("description");
            
            //esto esta mal. YA NO xd
            if (!borrarID.equals("0")){
                System.out.println(s.deleteTodo(borrarID));
                System.out.println("ESTAMOS DENTRO");
                
                System.out.println(borrarID);
                response.sendRedirect("http://localhost:8080/Login2/home.jsp?show=deleted");
                
            }
            /*else{
                System.out.println("IS NUUULLLL");
                response.sendRedirect("http://localhost:8080/Login2/home.jsp");
            }*/
            else if(!newState.equals("0") && !newState.equals("")){
                System.out.println("ACTUALIZANDOO");
                
                s.updateState(request.getParameter("actualizar_ID"), newState);
                response.sendRedirect("http://localhost:8080/Login2/home.jsp?show=updated");
                
            }else if(input.matches("^.*[a-z]+.*$") && description !=null){
                s.addTodo(input,description);
                Cloud.waitForIt(250);
                response.sendRedirect("http://localhost:8080/Login2/home.jsp?show=added");
            }
            //response.sendRedirect("http://localhost:8080/Login2/home.jsp");
            //NO FUNCIONAAA
            
            System.out.println("actualizar_ID"+ newState+"AQUIIIIIIIIIIIIIIIIIII");
            
            

            //ESTO ES UN POCO MOVIDA; HAY QUE VER COMO SE IMLEMENTA BIEN Y NO LIARLA CON LOS INPUTS XQ ESTA LINEA SIEMORE SE EJECUTABA Y JODIA LA DB
            //me lo sigue haciendo, NO ES AQUI
            //miniregex
            //matches("^.*[a-z]+.*$") este si
            //if(input.matches("[a-z0-9]+"))s.addTodo(input);
            
            //response.sendRedirect("http://localhost:8080/Login2/home.jsp");
        %>
    </body>
</html>
