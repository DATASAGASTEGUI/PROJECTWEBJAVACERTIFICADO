<%-- 
    Document   : index
    Created on : 14-nov-2022, 11:34:59
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>0006</title>
        <style>
            .redondear {
                width: 200px;
                height: 200px;
                border: 2px solid black;
                border-radius: 400px;
            }


        </style>


    </head>
    <body>
        <h1>6.HACER UN FORMULARIO PARA SELECCIONAR EN UN COMBOBOX EL NOMBRE DE UNA PERSONA Y SE MOSTRAR LA IMAGEN DE DICHA PERSONA.</h1>
        <%!
            //BASE DE DATOS
            int[] codigo = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
            String[] nombre = {"Seleccionar", "Mario", "Vanessa", "Javier", "Miguel", "Carlos", "Luis", "Melissa", "María", "Arturo", "Jose"};
            String ruta = "";
            boolean bandera = false;
        %>

        <%
            if (request.getParameter("cmdFoto") != null) {
                String nombreArchivo = request.getParameter("cboAlumno");

                ruta = request.getContextPath() + "/ejercicio_0006/foto/" + nombreArchivo + ".png";
                    bandera = true;
            }
        %>

    <center>
        <form action=''>
            <select name="cboAlumno" size="1">
                <%                    for (int i = 0; i < nombre.length; i++) {
                        out.print("<option value='" + codigo[i] + "'>" + nombre[i] + "</option>");
                    }
                %>
            </select>

            <input type='submit' name='cmdFoto' value='Enviar'/>
        </form>
    </center>

    <%
        if (bandera == true) {
    %>       

    <center><img class="redondear" src='<%=ruta%>'></center>
    <center><%=ruta%></center>
        <%
            }
        %>
</body>
</html>
