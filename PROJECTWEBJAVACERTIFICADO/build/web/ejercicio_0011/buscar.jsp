<%
    ConexionMysql cm = new ConexionMysql("colegio");
    Connection conexion = cm.getConexion();
%>

<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Set"%>
<%@page import="_11.OperacionesCrud"%>
<%@page import="java.sql.Connection"%>
<%@page import="_11.ConexionMysql"%>
<%@page import="java.util.Map"%>
<%@page import="_11.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BUSCAR</title>
    </head>
    <body>
        <h1>12. BUSCAR EN UNA TABLA SQL UN ALUMNO Y MOSTRARLA EN UNA PAGINA QUE INCLUYA UNA FOTO</h1>

        <%
            String clave = "";
            boolean encontro = false;
            Alumno a = null;
            if (request.getParameter("cmdEnviar") != null) {
                clave = request.getParameter("cboClaveAlumno");
                if (conexion != null) {
                    OperacionesCrud crud = new OperacionesCrud(conexion);
                    Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno();
                    a = alumnos_hm.get(clave);
                    encontro = true;
                } else {
                    System.out.println("ERROR: CONEXION");
                }
            }
        %>

    <center>
        <form action="">
            <%
                if (conexion != null) {
                    OperacionesCrud crud = new OperacionesCrud(conexion);
                    Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno();

                    TreeMap<String, Alumno> alumnos_tm = new TreeMap<>(alumnos_hm);

                    Set<String> claves = alumnos_tm.keySet();
            %>
            <select name="cboClaveAlumno" size="1"> 
                <%
                    for (String s : claves) {
                %>        
                <option value='<%=s%>'><%=s%></option> 
                <%
                    }
                %>
            </select>
            <input type='submit' name='cmdEnviar' value='ENVIAR' />
            <%
            } else {
            %>
            <center><input style='width: 15%; text-align:center;' type='text' value='ERROR: CONEXION' disabled /></center>
                <%
                    }
                %>


        </form>
    </center>

    <br><br>


    <%
        if (encontro == true) {
            String ruta = request.getContextPath() + "/ejercicio_0011/foto/" + a.getFoto();
    %> 
    <center>
        <table border='1'>
            <tr>
                <th>CODIGO</th><th>NOMBRE</th><th>EDAD</th><th>ESTATURA</th><th>FOTO</th>
            </tr>

            <tr>
                <td><%=a.getCodigo()%></td><td><%=a.getNombre()%></td><td><%=a.getEdad()%></td><td><%=a.getEstatura()%></td><td><img src='<%=ruta%>'></td>
            </tr>
        </table>
    </center>
    <%
        }
    %>



</body>
</html>
