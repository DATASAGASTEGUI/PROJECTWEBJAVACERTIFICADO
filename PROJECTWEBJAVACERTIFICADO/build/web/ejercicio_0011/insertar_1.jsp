<%-- 
    Document   : insertar
    Created on : 18-nov-2022, 9:51:06
    Author     : RYZEN
--%>

<%@page import="_11.OperacionesCrud"%>
<%@page import="_11.ConexionMysql"%>
<%@page import="_11.Alumno"%>
<%@page import="_11.Validar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ConexionMysql cm = new ConexionMysql("colegio");
    OperacionesCrud crud = new OperacionesCrud(cm.getConexion());
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>19</title>
        <style>
            input[type=text], input[type=submit], input[type=number] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
                width: 100px;
            }
        </style>

    </head>
    <body>
        <h1>19.</a> INSERTAR UN ALUMNO EL CODIGO SE GENERA</h1>

    <%!
        String codigo = "";
    %>

    <%            //ENTRADA
        //String codigo = "";
        String nombre = "";
        String edad = "";
        String estatura = "";
        String foto = "";
        //SALIDA
        String mensaje = "";

        codigo = crud.generarCodigo();
        foto = codigo.substring(1) + ".png";

        if (request.getParameter("cmdInsertar") != null) {

            codigo = request.getParameter("txtCodigo");
            nombre = request.getParameter("txtNombre");
            edad = request.getParameter("txtEdad");
            estatura = request.getParameter("txtEstatura");
            foto = request.getParameter("txtFoto");

            if (Validar.nombreYApellido(nombre) && Validar.edad(edad)
                    && Validar.estatura(estatura) && Validar.foto(foto)) {

                Alumno alumno = new Alumno(codigo, nombre, Integer.parseInt(edad), Double.parseDouble(estatura), foto);

                if (!crud.existeAlumno(codigo)) {

                    if (crud.insertarAlumno(alumno)) {
                        mensaje = "OK INSERTAR";
                    } else {
                        mensaje = "ERROR INSERTAR";
                    }
                } else {
                    mensaje = "CODIGO YA EXISTE";
                }

            } else {
                mensaje = "ENTRADA INCORRECTA";
            }
        }

        if (request.getParameter("cmdNuevo") != null) {
            codigo = nombre = edad = estatura = foto = mensaje = "";
            codigo = crud.generarCodigo();
            foto = codigo.substring(1) + ".png";
        }

        if (request.getParameter("cmdCodigo") != null) {
            codigo = crud.generarCodigo();
            foto = codigo.substring(1) + ".png";
        }
    %>



<center>   
    <form action=''>
        <input style='width: 30px;' type='submit' name='cmdCodigo' value='GC' />
        <input type='text' name='txtCodigo' value='<%=codigo%>' placeholder='CODIGO' readonly />
        <input type='text' name='txtNombre' value='<%=nombre%>' placeholder='NOMBRE'  />

        <input type="number" name='txtEdad' value='<%=edad%>' min='0' max='120' step='1' placeholder='EDAD' />


        <input type="number" name="txtEstatura" value='<%=estatura%>' min='1.00' max='1.90' step="0.01"  placeholder='ESTATURA'> 


        <input type='text' name='txtFoto' value='<%=foto%>' placeholder='FOTO' readonly />

        <input type='submit' name='cmdInsertar' value='INSERTAR' />
        <input type='submit' name='cmdNuevo' value='NUEVO' /><br><br>

        <input style='width: 300px;' type='text' name='txtMensaje' value='<%=mensaje%>' placeholder ='MENSAJE' disabled />
    </form> 
</center>     

</body>
</html>
