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
public class IzmenaKorisnika extends HttpServlet {

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
        
        String driverName = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/businesshotel";
        String user1 = "root";
        String psw = "";
        
        
       String idkor = request.getParameter("idkor");
       String korisnicko=request.getParameter("korisnicko");
       String sifra=request.getParameter("sifra");
       String mejl=request.getParameter("mail");
       String role=request.getParameter("role");
       String poeni=request.getParameter("poeni");
       String msg="";
       
       
       try
        {
            Connection con = null;
            PreparedStatement ps = null;
            Class.forName(driverName);
            con = DriverManager.getConnection(url,user1,psw);
            String sql="Update user set id=?,username=?,password=?,email=?,role=?,poeni=? where id="+idkor;
            ps = con.prepareStatement(sql);
            ps.setString(1,idkor);
            ps.setString(2,korisnicko);
            ps.setString(3,sifra);
            ps.setString(4,mejl);
            ps.setString(5,role);
            ps.setString(6,poeni);
            int i = ps.executeUpdate();
            if(i > 0)
            {
                msg="Uspesno ste izmenili korisnika!";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("IzmenaKorisnika.jsp").forward(request, response);
                
            }
        } 
        catch(ClassNotFoundException ex){}
        catch(SQLException sql)
        {
        request.setAttribute("poruka", sql);
        request.getRequestDispatcher("error.jsp").forward(request, response);       
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
