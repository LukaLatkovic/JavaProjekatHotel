<%-- 
    Document   : PretragaPoTipu
    Created on : Feb 7, 2019, 10:39:08 PM
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
            <h2>Pretraga po Tipu</h2>
            <hr>
        <form action="PretragaPoTipu.jsp" method="post"> 
        <p>Izaberi Tip Sobe:</p>
        
        
        <select class="select" name="pretragahotel[]" onchange="this.form.submit();">
            <option value="0">Izaberi Tip Sobe</option>
            
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/businesshotel","root","");
                    Statement stm=conn.createStatement();
                    ResultSet rs=stm.executeQuery("Select distinct id,kreveti from tipsobe");
                    while(rs.next())
                    {
                        %>
                        <option value="<%=rs.getString("id")%>"><%=rs.getString("kreveti")%></option>
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
                    ResultSet res=stmt.executeQuery("Select h.naziv,ts.kreveti,ts.brojslobodnih,ts.opis,ts.cena from tipsobe as ts join hoteli as h on ts.hotel_id=h.id where ts.id="+request.getParameter("pretragahotel[]"));
                    while(res.next())
                    {
                      %>
                      <table class="tabelaizmena">
                      <tr>
                            <th>Naziv</th>
                            <th>Tip Sobe</th>
                            <th>Slobodnih soba</th>
                            <th>Opis</th>
                            <th>Cena</th>
                     </tr>
                      <tr>
                          <td><%=res.getString("h.naziv")%></td>
                          <td><%=res.getString("ts.kreveti")%></td>
                          <td><%=res.getString("ts.brojslobodnih")%></td>
                          <td><%=res.getString("ts.opis")%></td>
                          <td><%=res.getString("ts.cena")%></td>
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