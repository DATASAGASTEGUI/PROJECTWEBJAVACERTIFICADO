<%-- 
    Document   : buscar
    Created on : 21-nov-2022, 9:38:46
    Author     : RYZEN
--%>

<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="_15.OperacionesCrud"%>
<%@page import="_15.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>2.BUSCAR</title>
    </head>
    <body>
    <center><h1>BUSCAR</h1></center>

    <%
        OperacionesCrud crud = new OperacionesCrud(2);
        Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno(2);

        TreeMap<String, Alumno> alumnos_tm = new TreeMap<>(alumnos_hm);

        Set<String> claves = alumnos_tm.keySet();
    %>



    <%
        Alumno a = null;
        boolean salida = false;
        if (request.getParameter("cmdBuscar") != null) {
            String codigo = request.getParameter("cboCodigo");
            a = alumnos_hm.get(codigo);
            salida = true;
        }
    %>

    <center>
        <form action=''>
            <select name='cboCodigo' size='1'> 
                <%                    for (String s : claves) {
                %>

                <option value='<%=s%>'><%=s%></option>

                <%
                    }
                %>
            </select>
            <input type='submit' name='cmdBuscar' value='BUSCAR' /><br><br>
        </form>
    </center>

    <%
        if (salida == true) {
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
