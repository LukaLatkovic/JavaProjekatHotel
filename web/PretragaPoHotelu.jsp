<%-- 
    Document   : PretragaPoHotelu
    Created on : Jan 30, 2019, 8:47:29 PM
    Author     : Luka Latkovic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="StilRegistracija.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
         <style>
            .tabelaizmena td, .tabelaizmena th {
  border: 1px solid #ddd;
  padding: 8px;
}



.tabelaizmena tr:hover {background-color: #ddd;}

.tabelaizmena th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
        </style>
    </head>
    <body>
        <div class="header">
        <img src="Slike/Logohotel.png" alt="Logo"/>
        </div>
        <div class="topnav">
        <a href="Pocetna.jsp">Pocetna</a>
        <a href="Usluge.jsp">Usluge</a>
        <a href="#">Kontakt</a>
        <% 
            HttpSession sesija=request.getSession();
            
            String user=(String)sesija.getAttribute("user");
            if(user==null)
            {
        %>
                <div class="reglog">
                <a href="Login.jsp">Uloguj se</a>
                <a href="Registracija.jsp">Registruj se</a>
                </div>
        <%        
            }
            else
            {
        %>
        
        <div class="reglog">
            <a href="LogoutServlet">Izloguj se</a>
            <a href="Profil.jsp"><%=user%></a>
            
        </div>
        <%
          }
        %>
        </div>
        
        
        <center>
            <h2>Pretraga po hotelu</h2>
            <hr>
        <form action="PretragaPoHotelu.jsp" method="post"> 
        <p>Izaberi hotel:</p>
        
        
        <select class="select" name="pretragahotel[]" onchange="this.form.submit();">
            <option value="0">Izaberi Hotel</option>
            
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/businesshotel","root","");
                    Statement stm=conn.createStatement();
                    ResultSet rs=stm.executeQuery("Select distinct id,naziv from hoteli");
                    while(rs.next())
                    {
                        %>
                        <option value="<%=rs.getString("id")%>"><%=rs.getString("naziv")%></option>
                        <%
                    }
                    conn.close();
                    rs.close();
                }
                catch(Exception ex){
                    ex.printStackTrace();
                    ex.getMessage();
                }
%>
            </select>
        

            <br>
            <br/>
        
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/businesshotel","root","");
                    Statement stmt=con.createStatement();
                    ResultSet res=stmt.executeQuery("Select naziv,opis,adresa,telefon from hoteli where id="+request.getParameter("pretragahotel[]"));
                    while(res.next())
                    {
                      %>
                      <table class="tabelaizmena">
                      <tr>
                            <th>Naziv</th>
                            <th>Opis</th>
                            <th>Adresa</th>
                            <th>Telefon</th>
                     </tr>
                      <tr>
                          <td><%=res.getString("naziv")%></td>
                          <td><%=res.getString("opis")%></td>
                          <td><%=res.getString("adresa")%></td>
                          <td><%=res.getString("telefon")%></td>
                      </tr>
                      <%
                    }
                res.close();
                con.close();
                }
                catch(Exception ex)
                {
                    request.setAttribute("poruka", ex);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                %>
        </table>
        </form>
        </center>

    </body>
</html>
