<%-- 
    Document   : mostrar
    Created on : 21-nov-2022, 9:38:32
    Author     : RYZEN
--%>

<%@page import="java.util.Collection"%>
<%@page import="java.util.Map"%>
<%@page import="_15.OperacionesCrud"%>
<%@page import="_15.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>1.MOSTRAR</title>
    </head>
    <body>
    <center><h1>MOSTRAR</h1></center>

    <%
        OperacionesCrud crud = new OperacionesCrud(2);
        Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno(2);
        Collection coleccion = alumnos_hm.values();
        for (Object o : coleccion) {
            Alumno a = (Alumno) o;
            String ruta = request.getContextPath() + "/ejercicio_0015/foto/" + a.getFoto();
    %>          

    <center>
        <input type='text' value='<%=a.getIdAlumno()%>' />  
        <input type='text' value='<%=a.getNombre()%>' />  
        <input type='text' value='<%=a.getEdad()%>' />  
        <input type='text' value='<%=a.getEstatura()%>' /> 
        <img src='<%=ruta%>' /><br>
    </center>
    <%
        }
    %>
</body>
</html>
