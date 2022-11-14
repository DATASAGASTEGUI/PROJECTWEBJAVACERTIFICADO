package org.apache.jsp.ejercicio_005f003;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <style>\n");
      out.write("            input[type=text], input[type=submit] {\n");
      out.write("                text-align:center;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                border: 2px solid #39c;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>3. HACER UN FORMULARIO PARA CALCULAR LAS RAICES DE UNA ECUACION CUADRATICA</h1>\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");

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

        
      out.write("\n");
      out.write("        <form action=''>\n");
      out.write("            A?<input type='text' name='txtA' value='");
      out.print(a);
      out.write("' /><br>\n");
      out.write("            B?<input type='text' name='txtB' value='");
      out.print(b);
      out.write("' />\n");
      out.write("            C?<input type='text' name='txtC' value='");
      out.print(c);
      out.write("' />\n");
      out.write("\n");
      out.write("            X1:<input type='text' name='txtX1' value='");
      out.print(x1);
      out.write("' disabled />\n");
      out.write("            X2:<input type='text' name='txtX2' value='");
      out.print(x2);
      out.write("' disabled /> \n");
      out.write("            <input type='text' name='txtM' value='");
      out.print(m);
      out.write("' size='20' style='width: 300px' disabled /> \n");
      out.write("\n");
      out.write("            <input type='submit' name='cmdRaiz' value='Calcular Raices' />\n");
      out.write("            <input type='submit' name='cmdReset' value='Resetear' />\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
