<%-- 
    Document   : home
    Created on : 01-feb-2020, 21:31:47
    Author     : SERGI
--%>


<%@page import="controlador.Conexion"%>
<%@page import="controlador.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TODO LIST</title>
        
        <%  //if Sesion is not instanciated in index.jsp (cos user never visit it, this throws NullPointerException, this code should be improved
            Sesion s=null;
            String [] lista=null;
            try {
                //session.getAttribute("logged");??
                s = (Sesion) request.getSession().getAttribute("logged");
            
            if(!s.getLogged()){
                response.sendRedirect("http://localhost:8080/Login2/index.jsp");
            }
            }catch(Exception e){
                response.sendRedirect("http://localhost:8080/Login2/index.jsp");
            }
            
            if(s.superUser){
                
               lista = s.getUpdateList();
               int listaLength = lista.length;
               if (listaLength>0){

                   %><script>
                    //vale creo que acceder a los ficheros desde JS no esta bien por algo java si puede
                    var num = <%=listaLength%>;
                    function myFunction() {
                    alert(num+" updates encontrados");
                    }
                    myFunction();
                    </script><%
                }
            }%>        
        
    </head>
    <body>
        <h3 align="center"> FIRST TO-DO</h3>
        <% //aqui vamos a pillar el RS de la query y crear la tabla DINAMICAMENTE OMG %>
        <% 
           
           Object[] tabla = s.getTable();
        %>
        <table border="1" width = "90%">
            
        <tr bgcolor="lightblue">
            <td>ID</ID>
            <td>PROJECT</td>
            <td>LANGUAGE</td>
            <td>STATE</td>
            <td>DESCRIPTION</td>
        </tr>
        
        <% //creamos (por fin) la tabla dinamica
            for (int i = 0; i<tabla.length ; i++){
                String [] row=tabla[i].toString().split(",");
        %>
            <tr bgcolor="lightyellow">
                <td><%= row[0] %></td>
                <td><%= row[1] %></td>
                <td><%= row[2] %></td>
                <td><%= row[3] %></td>
                <td><a href="<%=row[4]%>">go to description</a> </td>
                
            </tr>
            <%}%>
        </table>
        <br/>
        <table  width = "90%">
        <form action ="home.jsp" method="POST"> 
            <tr>
                <td align="center" bgcolor="lightblue">Añadir nueva tarea/<td>
                <td rowspan="2" colspan="2" align="center" bgcolor="lightyellow"<%= s.shouldHide() %> >
                    <b>Updates pendientes:<br/></b>
                    <% if(lista!=null){ //esto deberia ser innecesario porque deberia estar como hidden.. PERO BUENO
                        for(String update: lista){
                            
                            %><a href="<%="http://localhost:8080/Login2/Download.jsp?id="+update%>">Descarga </a><%=update%>
                            <a href="<%="http://localhost:8080/Login2/Modify.jsp?id="+update.split("-")[0]%>"> Añadir a original</a>
                            <br/>
                        <%
                        }}                    
                        %>
                </td>
            </tr>
            <tr>
                <td>
                    Project <input type="text" name="name"/>
                    Language <input type="text" name="language"/>
                    State <input type="number" name="state" min="1" max="4" <%=s.shouldDisable()%>/>                        
                </td>
            </tr>
            <tr>
                <td>
                    DESCRIPTION: <textarea rows="5" colspan="70" name="description" align="top"></textarea>
                </td>
            </tr>
                    <td><input type="submit" value="submit" colspan="3" align="right" /> </td>
        </form>
        </table>
        <%  
                
                //debemos generar un string y llamar a addTodo()
                String input = "'"+request.getParameter("language")+"','"+request.getParameter("name")+"',"+request.getParameter("state");
                //el objeto s nos salva la vida de manera continuada y nos la lia un poco tb
                System.out.println(input+" .length = "+input.length());
                String description = request.getParameter("description");
                
                //ESTO ES UN POCO MOVIDA; HAY QUE VER COMO SE IMLEMENTA BIEN Y NO LIARLA CON LOS INPUTS XQ ESTA LINEA SIEMORE SE EJECUTABA Y JODIA LA DB
                //me lo sigue haciendo, NO ES AQUI
                //miniregex
                //matches("^.*[a-z]+.*$") este si
                //if(input.matches("[a-z0-9]+"))s.addTodo(input);
                if(input.matches("^.*[a-z]+.*$")&& description !=null){
                    s.addTodo(input,description);
                }else System.out.println("No entramos en el addTODO");
        %>
    </body>
</html>
