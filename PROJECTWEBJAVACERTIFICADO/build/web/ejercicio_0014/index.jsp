<%-- 
    Document   : index
    Created on : 18-nov-2022, 13:21:09
    Author     : RYZEN
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>20</title>
        <style>
            input[type=text], input[type=submit], input[type=date] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
                width: 100px;
            }
        </style>
    </head>
    <body>
        <h1>20. MOSTRAR EL NÚMERO DE AÑOS, MESES Y DIAS A PARTIR DE UNA FECHA DE NACIMIENTO</h1>

        <%
            //SALIDA
            String anios = "";
            String meses = "";
            String dias = "";

            if (request.getParameter("cmdEnviar") != null) {

                LocalDate actual = LocalDate.now();

                String fecha = request.getParameter("fecha");//2022-11-18
                if (!fecha.equalsIgnoreCase("")) {

                    String[] c = fecha.split("-");

                    LocalDate nacimiento = LocalDate.of(Integer.parseInt(c[0]),
                            Integer.parseInt(c[1]),
                            Integer.parseInt(c[2]));

                    Period p = Period.between(nacimiento, actual);

                    anios = p.getYears() + "";
                    meses = p.getMonths() + "";
                    dias = p.getDays() + "";
                }
            }

        %>

    <center>
        <form action=''>
            SELECCIONAR FECHA NACIMIENTO<br><br>
            <input type='date' name='fecha' /><br><br>
            <input type='submit' name='cmdEnviar' value='ENVIAR' /><br><br>
            <input type='text' name='txtAnios' value='<%=anios%>' disabled placeholder='AÑOS'/>
            <input type='text' name='txtMeses' value='<%=meses%>' disabled placeholder='MESES' />
            <input type='text' name='txtDias' value='<%=dias%>' disabled placeholder='DIAS'/>
        </form>
    </center>

</body>
</html>
