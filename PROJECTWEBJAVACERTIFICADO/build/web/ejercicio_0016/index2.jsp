<%-- 
    Document   : index2
    Created on : 23-nov-2022, 10:32:01
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>25</title>
    </head>
    <body>
        <h1>25. JSP SOLICITAR A UN SERVLET UN CALCULO (UNIFICAR BOTON SUMAR Y RESTAR)</h1>


    <center>
        <form action='http://localhost:8081/WEB/Calcular1'>
            <input type='text' name='txtN1' value='' placeholder='NUMERO 1' />
            <input type='text' name='txtN2' value='' placeholder='NUMERO 2' />

            <input type='submit' name='cmdAccion' value='SUMAR' />
            <input type='submit' name='cmdAccion' value='RESTAR' />
        </form>
    </center> 

</body>
</html>
