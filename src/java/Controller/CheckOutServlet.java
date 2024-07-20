/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.OrderLineDAO;
import dal.OrderManageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.OrderManage;

/**
 *
 * @author acer
 */
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/checkout"})
public class CheckOutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if(action.equals("checkout")) {
            LocalDate orderDate = LocalDate.now();
            LocalDate deliveryDate = orderDate.plusDays(3);
        // Định dạng ngày tháng
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String real_orderDate = orderDate.format(formatter);
            String real_deliveryDate = deliveryDate.format(formatter);
            request.setAttribute("orderDate", real_orderDate);
            request.setAttribute("deliveryDate", real_deliveryDate);
            request.getRequestDispatcher("cart").forward(request, response);
        } else {
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String orderDate = dateConverter(request.getParameter("orderDate"));
            String deliveryDate = request.getParameter("deliveryDate");
            System.out.println("delivery date" + deliveryDate);
            double total = Double.parseDouble(request.getParameter("total"));
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            int ac_id = acc.getUserId();
            int cartId = (int) session.getAttribute("cartId");
            OrderManageDAO order = new OrderManageDAO();
            int orderUpdate = order.insertOrder(phone, address, total, orderDate, ac_id, cartId);
            OrderManage OrderManage_line = new OrderManage(cartId, ac_id, orderDate,"Delivering",total,address, phone);
            request.setAttribute("invoice", OrderManage_line);
            request.setAttribute("deliveryDate", deliveryDate);
            OrderLineDAO oDAO = new OrderLineDAO();
            int deleteOrderLine = oDAO.deleteByCartId(cartId);
            request.getRequestDispatcher("Invoice.jsp").forward(request, response);
        }
    }
    
    public String dateConverter(String date) {
        DateTimeFormatter originalFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        // Phân tích chuỗi ngày tháng thành LocalDate
        LocalDate date1 = LocalDate.parse(date, originalFormatter);

        // Bộ định dạng ngày tháng mới theo định dạng yyyy/MM/dd
        DateTimeFormatter newFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");

        // Định dạng lại ngày tháng
        String newDateString = date1.format(newFormatter);
        return newDateString;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
