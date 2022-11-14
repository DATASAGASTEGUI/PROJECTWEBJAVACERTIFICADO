<%-- 
    Document   : index
    Created on : 14-nov-2022, 9:49:44
    Author     : RYZEN
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>0004</title>
        <style>
            input[type=text], input[type=submit], input[type=button] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
            }
        </style>
    </head>
    <body>
        <h1>4. HACER UN FORMULARIO PARA RECUPERAR LA FECHA DEL SISTEMA SEPARANDO DIA-MES-AÑO.</h1>


        <%
            String dia = "";
            String mes = "";
            String anio = "";
            if (request.getParameter("cmdFecha") != null) {
                Date fecha = new Date();
                String formato = DateFormat.getDateInstance().format(fecha);
                String[] c = formato.split("-");

                Map<String, String> mes_hm = new HashMap<>();
                mes_hm.put("jan", "Enero");
                mes_hm.put("feb", "Febrero");
                mes_hm.put("mar", "Marzo");
                mes_hm.put("apr", "Abril");
                mes_hm.put("may", "Mayo");
                mes_hm.put("jun", "Junio");
                mes_hm.put("jul", "Julio");
                mes_hm.put("aug", "Agosto");
                mes_hm.put("sep", "Septiembre");
                mes_hm.put("oct", "Octubre");
                mes_hm.put("nov", "Noviembre");
                mes_hm.put("dec", "Diciembre");

                dia = c[0]; //14
                mes = mes_hm.get(c[1]).toUpperCase(); //nov   NOVIEMBRE
                anio = c[2]; //2022
                System.out.println("Fecha: " + formato);

            }
        %>




    <center>
        <form action=''>
            <input type='text' name='txtDia'  value='<%=dia%>' placeholder='DIA' disabled/>
            <input type='text' name='txtMes'  value='<%=mes%>' placeholder='MES' disabled/>
            <input type='text' name='txtAnio' value='<%=anio%>' placeholder='AÑO' disabled /><br><br>
            <input type='submit' name='cmdFecha' value='FECHA' />
            <input type='submit' name='cmdNuevo' value='NUEVO' />
            <input type='button' name='cmdSalir' value='SALIR' onclick=self.close(); />

        </form> 
    </center>




</body>
</html>
