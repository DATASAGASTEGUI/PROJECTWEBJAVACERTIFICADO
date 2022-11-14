<%-- 
    Document   : index
    Created on : 14-nov-2022, 9:49:44
    Author     : RYZEN
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>0005</title>
        <style>
            input[type=text], input[type=submit], input[type=button] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
            }
        </style>
    </head>
    <body>
        <h1>5. HACER UN FORMULARIO PARA RECUPERAR LA FECHA DEL SISTEMA SEPARANDO DIA-MES-AÑO.</h1>


        <%
            String diames = "";
            String diasemana = "";
            String diaAnio = "";
            String mes = "";
            String anio = "";
            if (request.getParameter("cmdFecha") != null) {
                LocalDate fecha = LocalDate.now();

                int diames1 = fecha.getDayOfMonth();
                int diasemana1 = fecha.getDayOfWeek().getValue();
                int diaAnio1 = fecha.getDayOfYear();
                int mes1 = fecha.getMonthValue();
                int anio1 = fecha.getYear();

                Map<Integer, String> diasemana_hm = new HashMap<>();
                diasemana_hm.put(1, "Lunes");
                diasemana_hm.put(2, "Martes");
                diasemana_hm.put(3, "Miercoles");
                diasemana_hm.put(4, "Jueves");
                diasemana_hm.put(5, "Viernes");
                diasemana_hm.put(6, "Sabado");
                diasemana_hm.put(7, "Domingo");

                Map<Integer, String> mes_hm = new HashMap<>();
                mes_hm.put(1, "Enero");
                mes_hm.put(2, "Febrero");
                mes_hm.put(3, "Marzo");
                mes_hm.put(4, "Abril");
                mes_hm.put(5, "Mayo");
                mes_hm.put(6, "Junio");
                mes_hm.put(7, "Julio");
                mes_hm.put(8, "Agosto");
                mes_hm.put(9, "Septiembre");
                mes_hm.put(10, "Octubre");
                mes_hm.put(11, "Noviembre");
                mes_hm.put(12, "Diciembre");

                diames = diames1 + "";
                diasemana = diasemana_hm.get(diasemana1);
                diaAnio = diaAnio1 + "";
                mes = mes_hm.get(mes1);
                anio = anio1 + "";
            }
        %>




    <center>
        <form action=''>
            <input type='text' name='txtDia'  value='<%=diames%>' placeholder='DIA MES' disabled/>
            <input type='text' name='txtMes'  value='<%=diasemana%>' placeholder='DIA SEMANA' disabled/>
            <input type='text' name='txtDia'  value='<%=diaAnio%>' placeholder='DIA AÑO' disabled/>
            <input type='text' name='txtMes'  value='<%=mes%>' placeholder='MES' disabled/>
            <input type='text' name='txtAnio' value='<%=anio%>' placeholder='AÑO' disabled /><br><br>
            <input type='submit' name='cmdFecha' value='FECHA' />
            <input type='submit' name='cmdNuevo' value='NUEVO' />
            <input type='button' name='cmdSalir' value='SALIR' onclick=self.close(); />

        </form> 
    </center>




</body>
</html>
