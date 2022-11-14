<%-- 
    Document   : index
    Created on : 11-nov-2022, 10:18:39
    Author     : RYZEN
--%>

<%-- DIRECTIVAS  --%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center><h1>PARTES DE UNA PAGINA JSP</h1></center>
        <%-- DECLARACIONES: DECLARAMOS METODOS O VARIABLES --%>   
        <%!
            int contador = 0;

            public String mensaje(String nombre) {
                return "Hola " + nombre;
            }
        %>


    <%-- SCRIPTLETS: EQUIVALENTE AL MAIN AQUI VA SU CODIGO JAVA  --%>
    <%
        Date fecha = new Date();
        List<String> nombres_al = new ArrayList<>();
        nombres_al.add("Luis");
        nombres_al.add("Marcos");
        nombres_al.add("Silvia");

        String bienvenido = mensaje("Walter");
    %>
    <%-- EXPRESIONES: MOSTRAR EL CONTENIDO DE VARIABLES EN EL HTML --%>
    <center><h1>SALIDA: VARIABLE</h1></center>
        <%="<center><h1>" + bienvenido + "</h1></center>"%>
    <center><h1>SALIDA: FECHA</h1></center>
        <%="<center><h1>" + fecha + "</h1></center>"%>
    <center><h1>SALIDA: ARRAYLIST</h1></center>
        <%
            for (String nombre : nombres_al) {
        %>
        <%="<center><h1>" + nombre + "</h1></center>"%>   
        <%
            }
        %>
        <%-- SCRIPTLETS: CON SALIA EN LA PAGINA HTML --%>    
        <%
            int a = 5;
            int b = 6;
            int c = a + b;
            out.println("<center><h1>SALIDA: SUMAR DOS NUMEROS</h1></center>");
            out.println("<center><h1>" + c + "</h1></center>");
            out.println("<center><h1>" + (contador++) + "</h1></center>");
        %>
    <center><h1>SALIDA: CONTADOR</h1></center>
        <%="<center><h1>" + (contador++) + "</h1></center>"%>
</body>contador++
</html>
