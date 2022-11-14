<%-- 
    Document   : index
    Created on : 11-nov-2022, 12:25:00
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>2. HACER UN FORMULARIO PARA CALCULAR EL FACTORIAL DE UN NUMERO.</h1>

        <%
            //ENTRADA
            String n = "";
            //SALIDA
            String f = "";
            if(request.getParameter("cmdFactorial") != null) {
               n = request.getParameter("txtN");//n=3  1x2x3
               long acu = 1;
               for(int i=1; i<=Integer.parseInt(n); i++) {
                   acu = acu * i;
               }
               f = String.valueOf(acu);
            }
        %>
        <form action=''>
            <input type='text' name='txtN' value='<%=n%>'/>
            <input type='text' name='txtR' value='<%=f%>'/>
            <input type='submit' name='cmdFactorial' value='Factorial' />

        </form>


    </body>
</html>
