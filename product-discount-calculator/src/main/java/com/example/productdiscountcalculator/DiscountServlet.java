package com.example.productdiscountcalculator;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DiscountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nhận dữ liệu từ form
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount"));
        // Tính toán
        double discountAmount = price * discountPercent * 0.01;
        double discountPrice = price - discountAmount;
        // Đưa dữ liệu vào request để truyền sang JSP
        request.setAttribute("description", description);
        request.setAttribute("price", price);
        request.setAttribute("discountPercent", discountPercent);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("discountPrice", discountPrice);
        // Chuyển đến trang hiển thị kết quả
        RequestDispatcher dispatcher = request.getRequestDispatcher("display-discount.jsp");
        dispatcher.forward(request, response);
    }
}
