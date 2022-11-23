<%-- 
    Document   : index3
    Created on : 23-nov-2022, 11:07:55
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>26</title>
    </head>
    <body>
        <h1>26. JSP SOLICITAR A UN SERVLET UN CALCULO RESPONDER AL MISMO JSP QUE HACE LA PETICION</h1>

    <%
        Object opcion;
        String n1 = "";
        String n2 = "";
        String r = "";
        if ((opcion = request.getAttribute("resultado")) != null) {
            r = (String) (request.getAttribute("resultado"));
            n1 = (String)(request.getAttribute("n1"));
            n2 = (String)(request.getAttribute("n2"));
        }
    %>

    <center>
        <form action='http://localhost:8081/WEB/CALCULAR2' method='get'>
            
            <!-- ENTRADA -->
            <input type='text' name='txtN1' value='<%=n1%>' placeholder='NUMERO 1' />
            <input type='text' name='txtN2' value='<%=n2%>' placeholder='NUMERO 2' />
            <!-- SALIDA -->
            <input type='text' name='txtR' value='<%=r%>' placeholder='RESULTADO' disabled />

            <input type='submit' name='cmdAccion' value='SUMAR' />
            <input type='submit' name='cmdAccion' value='RESTAR' />
        </form>
    </center> 

</body>
</html>
