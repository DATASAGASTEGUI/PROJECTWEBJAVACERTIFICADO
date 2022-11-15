<%-- 
    Document   : index
    Created on : 15-nov-2022, 13:04:18
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
        <title>11</title>
        <style>
            .redondear {
                width: 50px;
                height: 50px;
                border: 2px solid black;
                border-radius: 100px;
            }
        </style>
    </head>
    <body>
        <h1>11. LEER UNA TABLA SQL Y MOSTRARLA EN UNA PAGINA QUE INCLUYA UNA FOT</h1>

        <%
            String mensaje = "";
            ConexionMysql cm = new ConexionMysql("colegio");
            Connection conexion = cm.getConexion();

            if (conexion != null) {
                out.print("ENTRO");

                OperacionesCrud crud = new OperacionesCrud(conexion);
                List<Alumno> alumnos_al = crud.getArrayListAlumnos();
                if (alumnos_al != null) {
        %> 
    <center>
        <table border="1">
            <thead>
                <tr>
                    <th>CODIGO</th>
                    <th>NOMBRE</th>
                    <th>EDAD</th>
                    <th>ESTATURA</th>
                    <th>FOTO</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Alumno a : alumnos_al) {
                        String ruta = request.getContextPath() + "/ejercicio_0011/foto/" + a.getFoto();
                %>
                <tr>
                    <td><%=a.getCodigo()%></td>
                    <td><%=a.getNombre()%></td>
                    <td><%=a.getEdad()%></td>
                    <td><%=a.getEstatura()%></td>
                    <td><img class="redondear" src='<%=ruta%>'></center>                             </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </center>
    <%                } else {
                System.out.println("ERROR: LISTA ALUMNOS");
                mensaje = "ERROR: LISTA ALUMNOS";
            }
        } else {
            System.out.println("ERROR: CONEXION");
            mensaje = "ERROR: CONEXION";

        }
    %>

    <input type='text' value='<%=mensaje%>' />
</body>
</html>
