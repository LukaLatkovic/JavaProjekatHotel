<%-- 
    Document   : Profil
    Created on : Feb 2, 2019, 9:40:23 PM
    Author     : Luka Latkovic
--%>

<%@page import="Beanovi.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="StilRegistracija.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
       
        <% 
            
            Korisnik korisnik=(Korisnik)sesija.getAttribute("korisnik");
            
            String korisnikuser=korisnik.getUsername();
            String korisnikmejl=korisnik.getEmail();
            String korisnikpoeni=korisnik.getPoeni();
         %>
         <form action="LogoutServlet" method="post">
         <h1 align="center">Podaci o korisniku</h1>
         <hr>
         <label><b>Username:</b></label>
         <label><%=korisnikuser%></label><br>
         <br>
         <label><b>Mejl:</b></label>
         <label><%=korisnikmejl%></label><br>
         <br>
         <label><b>Broj poena:</b></label>
         <label><%=korisnikpoeni%></label><br>
         <br>
         
         <input type="submit" value="Odjavi se" class="regdugme">
         </form>
    </body>
</html>
