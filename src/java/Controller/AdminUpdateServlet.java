/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.AccountDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
@WebServlet(name = "AdminUpdateServlet", urlPatterns = {"/adminUpdate"})
public class AdminUpdateServlet extends HttpServlet {

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
        try {
            if (action.equals("Product")) {
                int prod_id = Integer.parseInt(request.getParameter("prod_id"));
                String prod_name = request.getParameter("prod_name");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                double price = Double.parseDouble(request.getParameter("price"));
                double disprice = Double.parseDouble(request.getParameter("disprice"));
                int sold = Integer.parseInt(request.getParameter("sold"));
                ProductDAO prodDAO = new ProductDAO();
                int updateProduct = prodDAO.updateProduct(prod_id, prod_name, quantity, price, disprice, sold);
                request.getRequestDispatcher("AdminController?action=Product").forward(request, response);
            } else if(action.equals("Account")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String status = request.getParameter("status");
                int role = Integer.parseInt(request.getParameter("role"));
                int userId = Integer.parseInt(request.getParameter("userId"));
                AccountDAO accDAO = new AccountDAO();
                int updateAccount = accDAO.updateAccountById(username, password, phone, email, status, role, userId);
                request.getRequestDispatcher("AdminController?action=Account").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("AdminUpdateServlet problems");
            System.out.println(e);
        }

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
