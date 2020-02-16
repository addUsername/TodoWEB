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
        
        <div id ="header"><h3 align="center"> FIRST TO-DO</h3>
        </div>
        
        <div id="tables">
        <table border="1" width = "90%">
            
        <tr bgcolor="lightblue">
            <td>ID</ID>
            <td>PROJECT</td>
            <td>LANGUAGE</td>
            <td>STATE</td>
            <td colspan="2">DESCRIPTION</td>
        </tr>
        
        <% //creamos (por fin) la tabla dinamica
           //pero tambien guardamos un array de ids para mstrar en las opciones borrar y actualizar
            Object[] tabla = s.getTable();
            Integer[] ids = new Integer[tabla.length];
            for (int i = 0; i<tabla.length ; i++){
                String [] row=tabla[i].toString().split(",");
                ids[i]=Integer.parseInt(row[0]);
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
        <form action ="add.jsp" method="POST"> 
            <tr>
                <td align="center" bgcolor="lightblue" colspan="2">
                    Añadir nueva tarea<br/>
                </td>
                <td align="center" bgcolor="lightblue">
                    Actualizar estado<br/>
                </td>
                <td align="center" bgcolor="lightblue">
                    Borrar tarea<br/>
                </td>
                    
                <td rowspan="3" colspan="2" align="center" bgcolor="lightyellow"<%= s.shouldHide() %> >
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
            <tr bgcolor="lightblue">
                            <td>    
                    Project <input type="text" name="name" maxlength="50"/>
                            </td>
                            <td>
                    Language <input type="text" name="language" maxlength="10"/>
                            </td>
                            <td align="right">ID 
                                <select name="actualizar_ID" style="width: 35px;">
                                    <option value="0" selected> </option>
                                    <%
                                    for(Integer i:ids){
                                        %><option value="<%=i%>"><%=i%></option>
                                    <%}%>
                                </select>
                                new State <input type="text" name="newState" min="0" max="4"/>
                                <input <%=s.shouldDisable()%> type="submit" value="Actualizar" valign="top" />
                                
                            </td>
                            <td align="right">ID
                                <select name="borrar_ID" style="width: 35px;">
                                    <option value="0" selected> </option>
                                    <%
                                    for(Integer i:ids){
                                        %><option value="<%=i%>"><%=i%></option>
                                    <%}%>
                                </select>
                                <input <%=s.shouldDisable()%> type="submit" value="Borrar" valign="top" />
                            </td>

            </tr>
            <tr bgcolor="lightblue">
                            <td rowspan="2">DESCRIPTION: <textarea style="width: 100%; border: none" rows="10" name="description"></textarea></td>
                
                            <td>
                    State <input type="number" name="state" min="1" max="4" />
                            </td>
                            <td>
                                <% if(request.getParameter("show")!=null && request.getParameter("show").equals("updated")){
                                %><p> query actualizada con exito!</p><%
                                }%>
                            </td>                            
                            <td>
                                <% if(request.getParameter("show")!=null && request.getParameter("show").equals("deleted")){
                                %><p> query y todos los archivos relacionados borrados con exito!</p><%
                                }%>
                            </td>
                            
            </tr>
            <tr>
                    <td><input <%=s.shouldDisable()%> type="submit" value="submit" valign="top"/>
                    </td>
                    <td></td
                    <td></td>
                    <td></td>
            </tr>
        </form>
        </table>
        </div>
         
        <% //<div><jsp:include page="Indetail.jsp"/></div> %>                   
    </body>
</html>
