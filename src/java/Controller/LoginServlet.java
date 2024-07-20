/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author acer
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String remember = request.getParameter("rem");
        Cookie cuser = new Cookie("cuser", username);
        Cookie cpass = new Cookie("cpass", pass);
        Cookie crem = new Cookie("crem", remember);
        if(remember != null) {
            cuser.setMaxAge(60*60*24);
            cpass.setMaxAge(60*60*24);
            crem.setMaxAge(60*60*24);
            response.addCookie(cuser);
            response.addCookie(cpass);
            response.addCookie(crem);
        } else {
            cuser.setMaxAge(0);
            cpass.setMaxAge(0);
            crem.setMaxAge(0);
            response.addCookie(cuser);
            response.addCookie(cpass);
            response.addCookie(crem);
        }
        HttpSession session = request.getSession();
        AccountDAO da = new AccountDAO();
        String ms = "";
        Account ad = da.check(username, pass);
        if (ad == null) {
            System.out.println("please try again");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else if(ad.getRole()==1){
            session.setAttribute("account", ad);
            request.getRequestDispatcher("AdminController").forward(request, response);
        } else{
            AccountDAO acDAO = new AccountDAO();
            int cartId = acDAO.getCartIdByUserId(ad.getUserId());
            session.setAttribute("cartId", cartId);
            session.setAttribute("account", ad);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
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
