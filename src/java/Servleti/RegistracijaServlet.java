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
public class RegistracijaServlet extends HttpServlet {

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
        
        String user=request.getParameter("username");
        String password=request.getParameter("password");
        String passwordpotrvrda=request.getParameter("confpassword");
        String mejl=request.getParameter("mejl");
        
        String dbUrl="jdbc:mysql://localhost:3306/businesshotel";
        String userb="root";
        String pass="";
                
        try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection(dbUrl,userb,pass);
           Statement st=con.createStatement();
           ResultSet rezultat=null;
           
           String upit="Select username from user";
           rezultat=st.executeQuery(upit);
           
           while(rezultat.next())
           {
               if(user.equals(rezultat.getString("username")))
               {
                  request.setAttribute("msg", "Korisnicko ime vec postoji");
                  request.getRequestDispatcher("Registracija.jsp").forward(request, response);
               }
           }
           st.close();
           con.close();
        }
        catch(ClassNotFoundException e){}
        catch(SQLException se)
        {
            String poruka=se.getMessage();
                   request.setAttribute("poruka",poruka);
                   request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        
        if(user!=null&&user.length()>0&&password!=null&&password.length()>0
                && passwordpotrvrda!=null&&passwordpotrvrda.length()>0
                && mejl!=null&&mejl.length()>0)
        {
            if(password.equals(passwordpotrvrda))
            {
                try
                {
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection(dbUrl,userb,pass);
                   Statement st=con.createStatement(); 
                   
                   String upitinsert="INSERT INTO user VALUES"
                           + "('5','"+user+"','"+password+"','"+mejl+"','korisnik','')";
                   
                   st.executeUpdate(upitinsert);
                   st.close();
                   con.close();
                   
                   request.setAttribute("msg", "Uspesno ste se registrovali. Prijavite se.");
                   request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
                catch(ClassNotFoundException e){}
                catch(SQLException se){
                        String poruka=se.getMessage();
                   request.setAttribute("poruka",poruka);
                   request.getRequestDispatcher("error.jsp").forward(request, response);
                   }
            }
            else
            {
                request.setAttribute("msg", "Lozinke se ne poklapaju!");
                request.getRequestDispatcher("Registracija.jsp").forward(request, response);
            }
        }
        else
        {
            request.setAttribute("msg", "Morate popuniti sva polja!");
            request.getRequestDispatcher("registracija.jsp").forward(request, response);
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
