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
    </head>
    <body>
        <h1>7. HACER UN FORMULARIO PARA SELECCIONAR EN UN COMBOBOX UN PDF Y SE MOSTRAR</h1>
        <%!
            //BASE DE DATOS
            int[] codigo = {0, 1, 2, 3};
            String[] nombre = {"SELECCIONAR", "JAVA SERVER PAGE", "JSP y SERVLET JAVA", "INTRODUCCION JSP"};
        %>

        <%
            int x = 0;
            String ruta = "";
            boolean bandera = false;
            String titulo = "";
            if (request.getParameter("cmdPdf") != null) {
                x++;
                String nombreArchivo = request.getParameter("cboDocumentosPdf");
                titulo = nombre[Integer.parseInt(nombreArchivo)];

                if (!nombreArchivo.equalsIgnoreCase("0")) {
                    ruta = request.getContextPath() + "/ejercicio_0007/pdf/" + nombreArchivo + ".pdf";
                    bandera = true;
                }
            }
        %>

    <center>
        <form action=''>
            <select name="cboDocumentosPdf" size="1">
                <%                    
                    for (int i = 0; i < nombre.length; i++) {

                        if (nombre[i].equalsIgnoreCase(titulo)) {
                            out.print("<option value='" + codigo[i] + "' selected>" + nombre[i] + "</option>");
                        } else {
                            out.print("<option value='" + codigo[i] + "'>" + nombre[i] + "</option>");
                        }

                    }
                %>
            </select>

            <input type='submit' name='cmdPdf' value='Enviar'/>
        </form>
    </center>

    <%
        if (x != 0) {

            if (bandera == true) {
    %>       

    <center>

        <br><br>
        <h2><%=titulo%></h2>

        <embed src="<%=ruta%>" type="application/pdf" width="100%" height="600px" />
    </center>
    <center><%=ruta%></center>
        <%
                } else {
                    out.print("<br><br><center>DEBE SELECCIONAR UN DOCUMENTO</center>");
                }
            }
        %>
</body>
</html>
