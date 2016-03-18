/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.admin;

import core.AdminServlet;
import entity.Menu;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.MenuModel;

/**
 *
 * @author MyPC
 */
//TODO cần phải kế thừa AdminServlet
public class MenuServlet extends AdminServlet {

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
        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("login") != (Object) 1) {
                response.sendRedirect("login");
            } else {
                String action = request.getParameter("action");
                switch (action) {
                    case "add":
                        this.actionAdd(request, response);
                        break;
                    default:
                        out.println("Unknown action");
                        break;
                }
            }
        }
    }

    private void actionAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.setTitle(request, "Add a new menu");
        if ("POST".equals(request.getMethod())) {
            String name = request.getParameter("name");
            int order = Integer.parseInt(request.getParameter("order"));
            MenuModel mm = new MenuModel();
            Menu m = new Menu(name, order);
            HttpSession session = request.getSession();
            if (mm.insert(m)) {
                session.setAttribute("message", "success");
            } else {
                session.setAttribute("message", "error");
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher("views/menu/add.jsp");
        rd.include(request, response);

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