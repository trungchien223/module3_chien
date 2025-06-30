package com.example.simplecalculator;

public class Calculator {
    public static double calculate(double a, double b, String operator) throws Exception {
        switch (operator) {
            case "add":
                return a + b;
            case "sub":
                return a - b;
            case "mul":
                return a * b;
            case "div":
                if (b == 0) {
                    throw new Exception("Cannot divide by zero");
                }
                return a / b;
            default:
                throw new Exception("Invalid operator");
        }
    }
}
