<%-- 
    Document   : index
    Created on : 15-nov-2022, 11:13:49
    Author     : RYZEN
--%>

<%@page import="java.io.File"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>0009</title>
    </head>
    <body>
        <h1>9. HACER UN FORMULARIO PARA BUSCAR EL SIGNIFICADO DE UNA PALABRA EN INGLES-ESPAÑOL USANDO UN DICCIONARIO - JSON</h1>

        <%!
            public String diccionario(String ingles,String nra) {
                String espaniol = "";
                String cadenajson = "";

                //String nra = "C:/Users/RYZEN/Documents/NetbeansProjects7/PROYECTOWEBMANANA/PROJECTWEBJAVACERTIFICADO/web/ejercicio_0009/diccionario.json";
                                


                try {
                    cadenajson = new String(Files.readAllBytes(Paths.get(nra))); //read byte data from the Sample.json file and convert it into String 

                    Map<String, String> diccionario_hm = new Gson().fromJson(cadenajson, new TypeToken<HashMap<String, String>>() {  // store string data into Map by using TypeToken class  
                    }.getType());

                    espaniol = diccionario_hm.get(ingles);
                } catch (Exception e) {
                    espaniol = "ErrorArchivo";
                }

                return espaniol;
            }
        %>

        <%
            String nra = new File(application.getRealPath("/ejercicio_0009/data/diccionario.json")).toString();
            String ingles = "";
            String espaniol = "";
            if (request.getParameter("cmdBuscar") != null) {
                ingles = request.getParameter("txtIngles").toLowerCase();
                espaniol = diccionario(ingles,nra);
                if (espaniol == null) {
                    espaniol = "NO ENCONTRADO";
                }
                if (espaniol.equalsIgnoreCase("ErrorArchivo")) {
                    espaniol = "ERROR ARCHIVO";
                }

            }
        %>

        <form action=''>
            <input type='text' name='txtIngles' value='<%=ingles%>' />
            <input type='text' name='txtSpain'  value='<%=espaniol%>' disabled="" />
            <input type='submit' name='cmdBuscar' value='BUSCAR' />
        </form>



    </body>
</html>
