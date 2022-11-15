<%-- 
    Document   : index
    Created on : 14-nov-2022, 14:09:34
    Author     : RYZEN
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>0008</title>
    </head>
    <body>
        <h1>8. HACER UN FORMULARIO PARA BUSCAR EL SIGNIFICADO DE UNA PALABRA EN INGLES-ESPAÑOL USANDO UN DICCIONARIO</h1>

    <%!
        public String diccionario(String ingles) {
            String espaniol = "";
            Map<String, String> diccionario_hm = new HashMap<>();
            diccionario_hm.put("one", "uno");
            diccionario_hm.put("file", "archivo");
            diccionario_hm.put("input", "entrada");
            diccionario_hm.put("computer", "computadora");
            diccionario_hm.put("tool", "herramienta");

            espaniol = diccionario_hm.get(ingles);

            return espaniol;
        }
    %>

    <%
        String ingles = "";
        String espaniol = "";
        if (request.getParameter("cmdBuscar") != null) {
            ingles = request.getParameter("txtIngles").toLowerCase();
            espaniol = diccionario(ingles);
            if (espaniol == null) {
                espaniol = "NO ENCONTRADO";
            }
        }
    %>

    <form action=''>
        <input type='text' name='txtIngles' value='<%=ingles%>' />
        <input type='text' name='txtSpain'  value='<%=espaniol%>' disabled="" />
        <input type='submit' name='cmdBuscar' value='BUSCAR' />
    </form>

</body>
</html>
