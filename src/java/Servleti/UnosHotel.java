/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servleti;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author Luka Latkovic
 */
public class UnosHotel extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        String url="jdbc:mysql://localhost:3306/businesshotel";
        String user="root";
        String pass="";
        
        String idhotela=request.getParameter("idhotela");
        String imehotela=request.getParameter("nazivhotela");
        String opishotela=request.getParameter("opishotela");
        String idmenadzera=request.getParameter("idmenadzera");
        String adresahotela=request.getParameter("adresahotela");
        String telefonhotela=request.getParameter("telefonhotela");
        
        String upit="INSERT INTO hoteli VALUES('"+idhotela+"','"+imehotela+"','"+opishotela+"','"+idmenadzera+"','"+adresahotela+"','"+telefonhotela+"')";
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,user,pass);
            Statement st=con.createStatement();
            
            st.executeUpdate(upit);
            st.close();
            con.close();
        }
        catch(ClassNotFoundException e){}
        catch(SQLException se){
            String poruka=se.getMessage();
            request.setAttribute("poruka", poruka);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        request.setAttribute("msg", "Uspesno unet novi hotel!");
        request.getRequestDispatcher("UnosNovogHotela.jsp").forward(request, response);
            
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
