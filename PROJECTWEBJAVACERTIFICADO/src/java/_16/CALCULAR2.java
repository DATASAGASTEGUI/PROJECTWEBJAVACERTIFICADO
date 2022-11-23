package _16;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CALCULAR2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        RequestDispatcher rd = null;

        try (PrintWriter out = response.getWriter()) {

            String opcion = "";

            if ((opcion = request.getParameter("cmdAccion")) != null) {

                String n1 = request.getParameter("txtN1");
                String n2 = request.getParameter("txtN2");

                double n1d = Double.parseDouble(n1);
                double n2d = Double.parseDouble(n2);

                double r = 0;

                switch (opcion) {
                    case "SUMAR":
                        r = n1d + n2d;
                        break;
                    case "RESTAR":
                        r = n1d - n2d;
                        break;
                }
                
                request.setAttribute("resultado", String.valueOf(r));
                request.setAttribute("n1", n1);
                request.setAttribute("n2", n2);

                rd = request.getRequestDispatcher("ejercicio_0016/index3.jsp");
                rd.include(request, response);

            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          processRequest(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
