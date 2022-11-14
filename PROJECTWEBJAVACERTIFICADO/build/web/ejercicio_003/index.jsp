<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            input[type=text], input[type=submit] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
            }
        </style>
    </head>
    <body>
        <h1>3. HACER UN FORMULARIO PARA CALCULAR LAS RAICES DE UNA ECUACION CUADRATICA</h1>


        <%
            //ENTRADA
            String a, b, c;
            a = b = c = "";
            //SALIDA
            String x1, x2, m;
            x1 = x2 = m = "";
            if (request.getParameter("cmdRaiz") != null) {
                try {
                    a = request.getParameter("txtA");
                    b = request.getParameter("txtB");
                    c = request.getParameter("txtC");

                    double a1 = Double.parseDouble(a);
                    double b1 = Double.parseDouble(b);
                    double c1 = Double.parseDouble(c);
                    double d = 0;
                    if (a1 != 0) {
                        d = b1 * b1 - 4 * a1 * c1;
                        if (d < 0) {
                            m = "NO TIENE SOLUCION REAL";
                        } else {
                            x1 = String.valueOf((-b1 + Math.sqrt(d)) / (2 * a1));
                            x2 = String.valueOf((-b1 - Math.sqrt(d)) / (2 * a1));
                        }
                    } else {
                        m = "NO ES UNA ECUACION CUADRATICA";
                    }
                } catch (Exception e) {
                        m = "ENTRADA INCORRECTA";
                }
            }
            if(request.getParameter("cmdReset") != null) {
                a = b = c = "";
                x1 = x2 = m = "";
            }

        %>
        <form action=''>
            A?<input type='text' name='txtA' value='<%=a%>' /><br>
            B?<input type='text' name='txtB' value='<%=b%>' />
            C?<input type='text' name='txtC' value='<%=c%>' />

            X1:<input type='text' name='txtX1' value='<%=x1%>' disabled />
            X2:<input type='text' name='txtX2' value='<%=x2%>' disabled /> 
            <input type='text' name='txtM' value='<%=m%>' size='20' style='width: 300px' disabled /> 

            <input type='submit' name='cmdRaiz' value='Calcular Raices' />
            <input type='submit' name='cmdReset' value='Resetear' />
        </form>
    </body>
</html>
