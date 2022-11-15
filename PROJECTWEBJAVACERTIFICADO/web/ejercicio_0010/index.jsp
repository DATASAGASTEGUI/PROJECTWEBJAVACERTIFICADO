<%-- 
    Document   : index
    Created on : 15-nov-2022, 11:56:20
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>10</title>
        <style>
            input[type=text], input[type=submit] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
            }
        </style>
    </head>
    <body>
        <h1>10. HACER UN FORMULARIO QUE PIDA UN NÚMERO N Y SE MOSTRARA LA TABLA DE MULTIPLICAR DE N</h1>

        <%
            String n = "";
            boolean entro = false;
            if (request.getParameter("cmdEnviar") != null) {
                String patron = "[0-9]+";
                n = request.getParameter("txtN");
                boolean valido = n.matches(patron);
                if (valido) {
                    entro = true;
                }else {
                    entro = false;
                    n = "DEBE SER ENTERO";
                }
            }
        %>


        <form action=''>
            <input type='text' name='txtN' value='<%=n%>' />
            <input type='submit' name='cmdEnviar' value='ENVIAR' />
        </form>

        <br>

        <%
            if (entro) {
                for (int i = 1; i <= 12; i++) {
        %>            
        <input style='width: 25px;' type='text' value='<%=n%>'  />&nbsp;x 
        <input style='width: 25px;' type='text' value='<%=i%>'  />&nbsp;=
        <input style='width: 25px;' type='text' value='<%=Integer.parseInt(n) * i%>'  />

        <br>


        <%
                }
            }
        %>



    </body>
</html>
