<%-- 
    Document   : index1
    Created on : 23-nov-2022, 9:59:36
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>24</title>
    </head>
    <body>
        <h1>24.JSP SOLICITAR A UN SERVLET UN CALCULO</h1>
        
        
        
        
        
    <center>
        <form action='http://localhost:8081/WEB/Calcular'>
             <input type='text' name='txtN1' value='' placeholder='NUMERO 1' />
             <input type='text' name='txtN2' value='' placeholder='NUMERO 2' />
            
             <input type='submit' name='cmdSumar' value='SUMAR' />
             <input type='submit' name='cmdRestar' value='RESTAR' />
        </form>
    </center>
        
        
        
    </body>
</html>
