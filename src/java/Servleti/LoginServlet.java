/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servleti;

import Beanovi.Korisnik;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Luka Latkovic
 */
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
            PrintWriter out = response.getWriter();
            
            String user=request.getParameter("korisnickoime");
            String pass=request.getParameter("korisnickasifra");
            String msg="";
            
            HttpSession sesija=request.getSession();
            
            Korisnik korisnik=new Korisnik();
            korisnik.setUsername(user);
            korisnik.setPassword(pass);
            
            
//            if(user.isEmpty() || pass.isEmpty())
//            {
//                msg="Morate uneti oba polja";
//                request.setAttribute("msg", msg);
//                request.getRequestDispatcher("Login.jsp").forward(request, response);       
//            }   
//            else
//            {
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/businesshotel","root","");
                    stmt=con.createStatement();
                    String upit="Select * from user where username='"+user+"' and password='"+pass+"'";
                    rs=stmt.executeQuery(upit);
                    if(rs.next())
                    {
                        String korisnikID=rs.getString("id");
                        String email=rs.getString("email");
                        String role=rs.getString("role");
                        String poeni=rs.getString("poeni");
                        
                        korisnik.setKorisnikID(korisnikID);
                        korisnik.setEmail(email);
                        korisnik.setRole(role);
                        korisnik.setPoeni(poeni);
                        sesija.setAttribute("korisnik",korisnik);
                        sesija.setAttribute("user", user);
                        sesija.setAttribute("role", role);
                        response.sendRedirect("Pocetna.jsp");
                        stmt.close();
                        con.close();
                    }
                    else
                    {
                        msg="Neispravno korisnicko ime i lozinka.Pokusajte ponovo.";
                        request.setAttribute("msg", msg);
                        stmt.close();
                        con.close();
                        request.getRequestDispatcher("Login.jsp").forward(request, response);
                    }
                }
                catch(ClassNotFoundException e){}
                catch(SQLException se)
                        {
                            sesija.invalidate();
                            String errormsg=se.getMessage();
                            if(con!=null)
                            {
                                try
                                {
                                    con.close();
                                }
                                catch(Exception ex)
                                {
                                    errormsg+=ex.getMessage();
                                }
                                request.setAttribute("poruka",errormsg);
                                request.getRequestDispatcher("error.jsp").forward(request, response);
                            }
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
