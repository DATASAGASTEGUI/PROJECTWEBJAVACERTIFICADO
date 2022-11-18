<%@page import="java.util.Collection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Connection"%>
<%@page import="_11.ConexionMysql"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page import="_11.OperacionesCrud"%>
<%@page import="java.util.Map"%>
<%@page import="_11.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ConexionMysql cm = new ConexionMysql("colegio");
    Connection conexion = cm.getConexion();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>21</title>
    </head>
    <body>
        <h1>21. MOSTRAR LOS ALUMNOS USANDO UN CHECKBOX</h1>

        <%
            String[] claves_v;
            boolean encontro = false;
            Map<String, Alumno> alumnos2_hm = new HashMap<>();
            if (request.getParameter("cmdSeleccionar") != null) {
                try {
                    claves_v = request.getParameterValues("ckbCodigo");

                    if (conexion != null) {
                        OperacionesCrud crud = new OperacionesCrud(conexion);
                        Map<String, Alumno> alumnos1_hm = crud.getHashMapAlumno();

                        Set<String> claves = alumnos1_hm.keySet();

                        for (String k : claves_v) {
                            Alumno alumno = alumnos1_hm.get(k);
                            alumnos2_hm.put(k, alumno);
                        }
                    }

                    encontro = true;

                } catch (Exception e) {

                }
            }

        %>


    <center>
        <form action="">
            <%                if (conexion != null) {
                    OperacionesCrud crud = new OperacionesCrud(conexion);
                    Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno();

                    TreeMap<String, Alumno> alumnos_tm = new TreeMap<>(alumnos_hm);

                    Set<String> claves = alumnos_tm.keySet();
            %>



            <%
                for (String s : claves) {
            %>        
            <%=s%> <input type="checkbox" name='ckbCodigo' value='<%=s%>' /> <br>
            <%
                }
            %>




            <input type='submit' name='cmdSeleccionar' value='Seleccionar' />
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

            Collection coleccion = alumnos2_hm.values();

            for (Object o : coleccion) {
                Alumno a = (Alumno) o;
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
        }
    %>

</body>
</html>
