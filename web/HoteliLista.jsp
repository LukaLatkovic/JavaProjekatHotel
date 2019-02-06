<%-- 
    Document   : HoteliLista
    Created on : Feb 6, 2019, 11:02:20 AM
    Author     : Luka Latkovic 
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Beanovi.Hotel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
    <center><h1>Lista hotela</h1></center>
        <hr>
        
        <center>
            <table class="tabelaizmena">
                <tr>
                    <th>Naziv Hotela</th>
                    <th>Opis Hotela</th>
                    <th>Adresa</th>
                    <th>Telefon</th>
                    <th></th>
                </tr>
                <% 
                    ArrayList<Hotel> hoteli=(ArrayList<Hotel>)request.getAttribute("hotel");
                    
                    for(Hotel pom : hoteli){
                %>
                    <tr>
                        <td><%=pom.getNaziv() %></td>
                        <td><%=pom.getOpis()%></td>
                        <td><%=pom.getAdresa() %></td>
                        <td><%=pom.getTelefon() %></td>
                        <td><input type="button" class="dugmezapretragu" onclick="window.location.href='ListaTipova?ispis=listahotel&id=<%=pom.getHotelID()%>'" value="Vise"></td>
                    </tr>
                    <%
                }
                    %>
            </table>
        </center>
    </body>
</html>
