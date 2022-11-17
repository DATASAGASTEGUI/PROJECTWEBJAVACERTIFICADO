<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>15</title>
        <script>
            function recogerid(id) {
                if (id == "elpais") {
                    document.getElementById('caja_oculta').value = "https://elpais.es/";
                }
                if (id == "elmundo") {
                    document.getElementById('caja_oculta').value = "https://elmundo.es/";
                }
                if (id == "okdiario") {
                    document.getElementById('caja_oculta').value = "https://okdiario.com/";
                }
                if (id == "larazon") {
                    document.getElementById('caja_oculta').value = "https://larazon.es/";
                }
            }
        </script>
    </head>
    <body>
        <h1>15. MENU CON BOTON RADIO PARA LEVANTAR URL</h1>


<center>
    <form action=''>
        <input type='radio' name='rPrensa' onclick='recogerid(this.id)' id='elpais' /> El Pais
        <input type='radio' name='rPrensa' onclick='recogerid(this.id)' id='elmundo' /> El Mundo
        <input type='radio' name='rPrensa' onclick='recogerid(this.id)' id='okdiario' /> Ok Diario
        <input type='radio' name='rPrensa' onclick='recogerid(this.id)' id='larazon' /> La Razón
        <input type='hidden' name='txtOculto' id='caja_oculta' />
        <input type='submit' name='cmdPrensa' value='ENVIAR' />
    </form>
</center>

<%
    if (request.getParameter("cmdPrensa") != null) {
        String opcion = request.getParameter("txtOculto");
%>       

<% response.sendRedirect(opcion); %>


<center>Haga clic: <a id='contenido' href="<%=opcion%>"><%=opcion%></a></center>
<%
    }
%>
</body>
</html>
