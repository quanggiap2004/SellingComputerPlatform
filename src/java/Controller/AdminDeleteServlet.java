/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.AccountDAO;
import dal.OrderManageDAO;
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
@WebServlet(name = "AdminDeleteServlet", urlPatterns = {"/adminDelete"})
public class AdminDeleteServlet extends HttpServlet {

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
                int prod_id = Integer.parseInt(request.getParameter("id"));
                ProductDAO prodDAO = new ProductDAO();
                prodDAO.deleteProdById(prod_id);
                request.getRequestDispatcher("AdminController?action=Product").forward(request, response);
            } else if(action.equals("Account")) {
                int ac_id = Integer.parseInt(request.getParameter("id"));
                AccountDAO accDAO = new AccountDAO();
                int deleteAccount = accDAO.deleteAccById(ac_id);
                request.getRequestDispatcher("AdminController?action=Account").forward(request, response);
            } else if(action.equals("Order")) {
                int or_id = Integer.parseInt(request.getParameter("id"));
                OrderManageDAO omDAO = new OrderManageDAO();
                int orderDelete = omDAO.deleteOrderById(or_id);
                request.getRequestDispatcher("AdminController?action=Order").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("AdminDeleteServlet problems");
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
