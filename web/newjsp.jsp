<%-- 
    Document   : newjsp
    Created on : 07-feb-2020, 19:57:59
    Author     : SERGI
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Click the button to alert the hostname of the current URL.</p>

        
        <% File dir = new File ("C:\\Files");
            String [] s = dir.list();
            
            //como no podemos pasarle un java array a javascript, le pasamos un String y que JS los separe
            //y probamos con un iterator jiji.. a ver como era
            String toJS="";
            for (String string:s){
                //ponemos \\n por javaescript
                if(string.matches("^.*UPDATE.txt")) toJS+=string+"\\n";
            }
        
        %>
            
        <button onclick="myFunction()">Try it</button>  
        <script>
            //vale creo que acceder a los ficheros desde JS no esta bien por algo java si puede
            var data = new String("<%= toJS %>");
            function myFunction() {
                
                
                    alert(data);
            }
        </script>
    </body>
</html>
