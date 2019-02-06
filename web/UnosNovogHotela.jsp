<%-- 
    Document   : UnosNovogHotela
    Created on : Feb 5, 2019, 11:02:26 PM
    Author     : Luka Latkovic 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="StilRegistracija.css" rel="stylesheet" type="text/css"/>
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
        <form action="UnosHotel" method="post">
            <div class="container">
        <h1>Unos novog hotela u bazu</h1>
        <h3 align="center"><%
            String msg=(String)request.getAttribute("msg");
            if(msg!=null)
            {
                %><%=msg%><%
            }
            %>
            </h3>
        <hr>
        
            <label><b>Id hotela:</b></label>
            <input type="text" name="idhotela" required="true">
            <label><b>Naziv hotela:</b></label>
            <input type="text" name="nazivhotela" required="true">
            <label><b>Opis hotela:</b></label> 
            <input type="text" name="opishotela" required="true">
            <label><b>Id menadzera:</b></label>  
            <input type="text" name="idmenadzera" required="true">
            <label><b>Adresa:</b></label>
            <input type="text" name="adresahotela" required="true">
            <label><b>Telefon:</b></label>
            <input type="text" name="telefonhotela" required="true">
            <input type="submit" value="Unesi novi hotel" class="regdugme">
        
            </div>
        </form>
        
        
    </body>
</html>
