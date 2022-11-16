<%@page import="_11.Validar"%>
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

        <%-- ACCION BOTON ELIMINAR --%>
        <%
            boolean eliminarMensaje1 = false;
            boolean eliminarMensaje2 = false;
            if (request.getParameter("cmdEliminar") != null) {
                String codigo = request.getParameter("txtCodigo");
                if (conexion != null) {
                    OperacionesCrud crud = new OperacionesCrud(conexion);
                    boolean eliminar = crud.eliminarAlumno(codigo);
                    if (eliminar == true) {
                        System.out.println("OK: ELIMINAR");
                        eliminarMensaje1 = true;
                    }
                } else {
                    System.out.println("ERROR: CONEXION");
                    eliminarMensaje2 = true;
                }
            }
        %>

        <%-- ACCION BOTON ACTUALIZAR --%>
        <%
            boolean actualizarMensaje1 = false;
            boolean actualizarMensaje2 = false;
            boolean actualizarMensaje3 = false;
            if (request.getParameter("cmdActualizar") != null) {
                String codigo = request.getParameter("txtCodigo");
                String nombre = request.getParameter("txtNombre");
                String edad = request.getParameter("txtEdad");
                String estatura = request.getParameter("txtEstatura");
                if (Validar.nombreYApellido(nombre) && Validar.edad(edad) && Validar.estatura(estatura)) {
                    if (conexion != null) {
                        OperacionesCrud crud = new OperacionesCrud(conexion);
                        Alumno alumno = new Alumno(codigo, nombre, Integer.parseInt(edad), Double.parseDouble(estatura));
                        boolean actualizar = crud.actualizarAlumno(alumno);
                        if (actualizar == true) {
                            System.out.println("OK: ACTUALIZAR");
                            actualizarMensaje1 = true;
                        }
                    } else {
                        System.out.println("ERROR: CONEXION");
                        actualizarMensaje2 = true;
                    }
                } else {
                    System.out.println("ERROR: ENTRADA INCORRECTA");
                    actualizarMensaje3 = true;
                    encontro = true;
                }
            }
        %>


        <%-- PINTA COMBOBOX(LISTA DESPLEGABLE) --%>
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
            <input type='submit' name='cmdSeleccionar' value='SELECCIONAR' />
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
                if (actualizarMensaje3 == true) {
            %>       
            <center><input style='width: 25%; text-align:center;' type='text' value='ERROR: ENTRADA INCORRECTA' disabled /></center>    

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


    <%-- MENSAJES BANDERA ELIMINAR Y ACTUALIZAR --%>

    <%
        if (eliminarMensaje1 == true) {
    %>       
    <center><input style='width: 15%; text-align:center;' type='text' value='OK: ELIMINAR' disabled /></center>    

    <%
        }
    %>

    <%
        if (eliminarMensaje2 == true) {
    %>       
    <center><input style='width: 15%; text-align:center;' type='text' value='ERROR: CONEXION' disabled /></center>    

    <%
        }
    %>

    <%
        if (actualizarMensaje1 == true) {
    %>       
    <center><input style='width: 15%; text-align:center;' type='text' value='OK: ACTUALIZAR' disabled /></center>    

    <%
        }
    %>

    <%
        if (actualizarMensaje2 == true) {
    %>       
    <center><input style='width: 15%; text-align:center;' type='text' value='ERROR: CONEXION' disabled /></center>    

    <%
        }
    %>





</body>
</html>
