<%-- 
    Document   : Indetail
    Created on : 05-feb-2020, 11:11:28
    Author     : SERGI
--%>

<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>
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
                System.out.println("NOOO ESTAS LOGEADIOOOOO");
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
            String id = s.getID();
            if (request.getParameter("id")!=null){
                s.setID(request.getParameter("id"));
                id = s.getID();
            }
            Scanner sc=null;
             %>
        <h3 align="center"> FIRST TO-DO</h3>
        <table>
            <tr>
                <td>
                Hello user, here is the <b>description-<%= request.getParameter("id")%></b> file!
                <br/>
                <textarea readonly rows="30" cols="50" name="newTxt">
                    <% if(id!=null){
                        sc = new Scanner(new File("c:\\Files\\Descripcion-"+s.getID()+".txt"));
                        while(sc.hasNext()) out.println(sc.nextLine());
                    }%>
                </textarea>
                </td>
                <td valign="top">
                    
                    <a href = <%="http://localhost:8080/Login2/Download.jsp?id="+s.getID()%>>DESCARGAR</a>
                    <br/>   
                    <a href = <%="http://localhost:8080/Login2/Update.jsp?id="+s.getID()%>>ACTUALIZAR</a>
                        
                </td>
            <form action ="Indetail.jsp" method="POST">
                <td>
                    <input type="submit" value="Save"/>

                    here is <b>your description-<%= request.getParameter("id")%></b> file!
                    <br/>
                    <textarea rows="30" cols="50" name="pullreq">DONÂ´T FORGET THE TIME LOG YOU FUCKING OP</textarea>    
                </td>
            </form>
            </tr>
            <% if(request.getParameter("pullreq")!=null) s.setUpdateText(request.getParameter("pullreq"));  %>
        </table>
    </body>
</html>
