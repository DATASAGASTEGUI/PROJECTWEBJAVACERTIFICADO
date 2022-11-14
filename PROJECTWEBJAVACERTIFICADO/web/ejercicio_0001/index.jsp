<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //SALIDA
            String r = "";
            String m = "";
            //ENTRADA
            String n1 = "";
            String n2 = "";
            if (request.getParameter("cmdEnviar") != null) {
                try {
                    n1 = request.getParameter("txtN1");
                    n2 = request.getParameter("txtN2");
                    int a = Integer.parseInt(n1);
                    int b = Integer.parseInt(n2);
                    int c = a + b;
                    r = String.valueOf(c);
                     m = "OK";
                } catch (Exception e) {
                    m = "ENTRADA INCORRECTA";
                }
            }
        %>




        <h1>1. HACER UN FORMULARIO PARA SUMAR DOS NUMEROS</h1>
        <form action="">
            <input type='text' name='txtN1' value='<%=n1%>' />
            <input type='text' name='txtN2' value='<%=n2%>' />
            <input type='text' name="txtR" value='<%=r%>' />
            <input type='text' name="txtM" value='<%=m%>' />
            <input type='submit' value="SUMAR" name='cmdEnviar' />

        </form>  












    </body>
</html>
