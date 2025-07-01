package com.example.simplecalculator;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            double a = Double.parseDouble(request.getParameter("firstOperand"));
            double b = Double.parseDouble(request.getParameter("secondOperand"));
            String operator = request.getParameter("operator");

            try {
                double result = Calculator.calculate(a, b, operator);
                out.println("<h2>Result: " + result + "</h2>");
            } catch (Exception e) {
                out.println("<h2>Error: " + e.getMessage() + "</h2>");
            }

        } catch (NumberFormatException e) {
            out.println("<h2>Error: Invalid number format. Please enter valid numbers.</h2>");
        }
    }
}
