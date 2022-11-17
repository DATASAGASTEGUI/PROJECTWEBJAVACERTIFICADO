<%-- 
    Document   : ordenar
    Created on : 17-nov-2022, 9:34:17
    Author     : RYZEN
--%>

<%@page import="java.util.List"%>
<%@page import="_11.Alumno"%>
<%@page import="_11.OperacionesCrud"%>
<%@page import="java.sql.Connection"%>
<%@page import="_11.ConexionMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>14</title>
        <style>
            .redondear {
                width: 50px;
                height: 50px;
                border: 2px solid black;
                border-radius: 100px;
            }
            input[type=text], input[type=submit], input[type=radio] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
                width: 100px;
            }
        </style>


    </head>
    <body>
        <h1>14.</a> ORDENAR UN ARRAYLIST POR UN ATRIBUTO</h1>

    <%!
        String opcion = "";
    %>

    <%
        if (request.getParameter("cmdOrdenar") != null) {
            opcion = request.getParameter("rOrdenar");
        }
    %>

    <%-- FORMULARIO (ENTRADA) --%>
    <%
        if (opcion.equalsIgnoreCase("nombre")) {

    %>
<center>
    <form action=''>
        <input type='radio' name='rOrdenar' value='nombre' checked /> Nombre
        <input type='radio' name='rOrdenar' value='edad' /> Edad
        <input type='radio' name='rOrdenar' value='estatura' /> Estatura <br><br>
        <input type='submit' name='cmdOrdenar' value='ORDENAR' /> <br><br>
    </form>
</center>

<%    }
%>

    <%
        if (opcion.equalsIgnoreCase("edad")) {

    %>
<center>
    <form action=''>
        <input type='radio' name='rOrdenar' value='nombre'/> Nombre
        <input type='radio' name='rOrdenar' value='edad'  checked /> Edad
        <input type='radio' name='rOrdenar' value='estatura' /> Estatura <br><br>
        <input type='submit' name='cmdOrdenar' value='ORDENAR' /> <br><br>
    </form>
</center>

<%    }
%>

    <%
        if (opcion.equalsIgnoreCase("estatura")) {

    %>
<center>
    <form action=''>
        <input type='radio' name='rOrdenar' value='nombre'/> Nombre
        <input type='radio' name='rOrdenar' value='edad' /> Edad
        <input type='radio' name='rOrdenar' value='estatura' checked /> Estatura <br><br>
        <input type='submit' name='cmdOrdenar' value='ORDENAR' /> <br><br>
    </form>
</center>

<%    }
%>

    <%
        if (opcion.equalsIgnoreCase("")) {

    %>
<center>
    <form action=''>
        <input type='radio' name='rOrdenar' value='nombre' checked /> Nombre
        <input type='radio' name='rOrdenar' value='edad' /> Edad
        <input type='radio' name='rOrdenar' value='estatura'  /> Estatura <br><br>
        <input type='submit' name='cmdOrdenar' value='ORDENAR' /> <br><br>
    </form>
</center>

<%    }
%>










<%-- MOSTRAR ALUMNOS (SALIDA) --%>


<%    String mensaje = "";
    ConexionMysql cm = new ConexionMysql("colegio");
    Connection conexion = cm.getConexion();

    if (conexion != null) {
        OperacionesCrud crud = new OperacionesCrud(conexion);
        List<Alumno> alumnos_al = crud.getArrayListAlumnos();

        if (alumnos_al != null) {

            if (opcion.equalsIgnoreCase("nombre")) {
                crud.ordenarArrayListPorNombre(alumnos_al);
            }

            if (opcion.equalsIgnoreCase("edad")) {
                crud.ordenarArrayListPorEdad(alumnos_al);
            }

            if (opcion.equalsIgnoreCase("estatura")) {
                crud.ordenarArrayListPorEstatura(alumnos_al);
            }

            for (Alumno a : alumnos_al) {
                String ruta = request.getContextPath() + "/ejercicio_0011/foto/" + a.getFoto();

%> 

<center>
    <input type='text' value='<%=a.getCodigo()%>' />               
    <input type='text' value='<%=a.getNombre()%>' /> 
    <input type='text' value='<%=a.getEdad()%>' /> 
    <input type='text' value='<%=a.getEstatura()%>' /> 
    <img class="redondear" src='<%=ruta%>' /><br>
</center>

<%
            }

        }
    } else {
        out.print("<input type='text' value='ERROR: CONEXION' />");
    }
%> 




</body>
</html>
