/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servleti;

import Beanovi.Hotel;
import Beanovi.TipSobe;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luka Latkovic
 */
public class ListaTipova extends HttpServlet {

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
       Connection con=null;
       Statement stmt=null;
       ResultSet rs=null;
       String url="jdbc:mysql://localhost:3306/businesshotel";
       String user="root";
       String pass="";
       String ispis=request.getParameter("ispis");
       ArrayList<TipSobe> hoteltip=new ArrayList<TipSobe>();
       try
       {
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection(url,user,pass);
           stmt=con.createStatement();
           
           if(ispis.equals("listahotel"))
           {
            
           String tipsobe=request.getParameter("id");
           String upit="Select * from tipsobe as ts join hoteli as h on h.id=ts.hotel_id where hotel_id='"+tipsobe+"'";          
           rs = stmt.executeQuery(upit);
           while(rs.next())
           {
               hoteltip.add(new TipSobe(rs.getString("id"),rs.getString("hotel_id"),rs.getString("kreveti"),rs.getString("brojsoba"),rs.getString("brojslobodnih"),rs.getString("opis"),rs.getString("cena")));
           }
           request.setAttribute("hoteltip", hoteltip);
           request.getRequestDispatcher("HotelTip.jsp").forward(request, response);
           }       
       }
       catch(ClassNotFoundException e){}
       catch(SQLException se){
           String poruka=se.getMessage();
           request.setAttribute("poruka",poruka);
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
