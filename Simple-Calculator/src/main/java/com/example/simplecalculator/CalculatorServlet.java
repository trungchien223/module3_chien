package com.example.simplecalculator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double a = Double.parseDouble(request.getParameter("firstOperand"));
        double b = Double.parseDouble(request.getParameter("secondOperand"));
        String operator = request.getParameter("operator");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            double result = Calculator.calculate(a, b, operator);
            out.println("<h2>Result: " + result + "</h2>");
        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    }
}
