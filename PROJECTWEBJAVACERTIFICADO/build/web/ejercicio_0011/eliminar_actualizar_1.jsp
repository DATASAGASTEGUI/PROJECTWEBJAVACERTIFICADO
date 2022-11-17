<%@page import="_11.Validar"%>
<%
    ConexionMysql cm = new ConexionMysql("colegio");
    Connection conexion = cm.getConexion();
    OperacionesCrud crud = new OperacionesCrud(conexion);
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
        <title>ELIMINAR/ACTUALIZAR</title>
    </head>
    <body>
        <h1>13.ELIMINAR Y ACTUALIZAR UN ALUMNO</h1>

        <%!
            Alumno a = null;
        %>

        <%-- ACCION BOTON SELECCIONAR(BUSCAR) --%>
        <%
            String clave = "";
            boolean encontro = false;

            if (request.getParameter("cmdSeleccionar") != null) {
                clave = request.getParameter("cboClaveAlumno");
                Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno();
                a = alumnos_hm.get(clave);
                encontro = true;
            }
        %>

        <%-- ACCION BOTON ELIMINAR --%>
        <%
            boolean eliminarMensaje1 = false;
            if (request.getParameter("cmdEliminar") != null) {
                String codigo = request.getParameter("txtCodigo");
                boolean eliminar = crud.eliminarAlumno(codigo);
                eliminarMensaje1 = true;
            }
        %>

        <%-- ACCION BOTON ACTUALIZAR --%>
        <%
            boolean actualizarMensaje1 = false;
            if (request.getParameter("cmdActualizar") != null) {
                try {
                    String codigo = request.getParameter("txtCodigo");
                    String nombre = request.getParameter("txtNombre");
                    String edad = request.getParameter("txtEdad");
                    String estatura = request.getParameter("txtEstatura");
                    Alumno alumno = new Alumno(codigo, nombre, Integer.parseInt(edad), Double.parseDouble(estatura));
                    boolean actualizar = crud.actualizarAlumno(alumno);
                    actualizarMensaje1 = true;
                    encontro = true;
                } catch (Exception e) {

                }
            }
        %>


        <%-- PINTA COMBOBOX(LISTA DESPLEGABLE) --%>
    <center>
        <form action="">
            <%
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
            <input type='submit' name='cmdSeleccionar' value='SELECCIONAR' />
        </form>

    </center>

    <br><br>

    <%-- PINTA LA TABLA DEL ALUMNO ENCONTRADO --%>

    <%        if (encontro == true) {
            String ruta = request.getContextPath() + "/ejercicio_0011/foto/" + a.getFoto();
    %> 

    <center>
        <form action=''>
            <input type='hidden' name='txtCodigo' value='<%=a.getCodigo()%>' />
            <table border='1'>
                <tr>
                    <th>NOMBRE</th><th>EDAD</th><th>ESTATURA</th><th>FOTO</th>
                </tr>

                <tr>
                    <td><input type='text' name='txtNombre' value='<%=a.getNombre()%>' /></td>
                    <td><input type='text' name='txtEdad' value='<%=a.getEdad()%>' /></td>
                    <td><input type='text' name='txtEstatura' value='<%=a.getEstatura()%>' /></td>
                    <td><img src='<%=ruta%>'></td>
                </tr>
            </table>

            <%
                if (actualizarMensaje1 == true) {
            %>       
            <center><input style='width: 25%; text-align:center;' type='text' value='OK: ACTUALIZAR' disabled /></center>    

            <%
                }
            %>                  

            <br><br>
            <input type='submit' name='cmdEliminar' value='ELIMINAR' />
            <input type='submit' name='cmdActualizar' value='ACTUALIZAR' />
        </form>
    </center>
    <%
        }
    %>


    <%
        if (eliminarMensaje1) {
    %>
    <center><input style='width: 25%; text-align:center;' type='text' value='OK: ELIMINAR' disabled /></center> 

    <%
        }

    %>





</body>
</html>
