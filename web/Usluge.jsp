<%-- 
    Document   : Usluge
    Created on : Jan 30, 2019, 12:21:43 AM
    Author     : Luka Latkovic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/StilRegistracija.css" />
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
           
            String role=(String)sesija.getAttribute("role");
            if(role.equals("administrator"))
            {
        %>
        
        <h1 align="center">Usluge hotela</h1>
        <hr>
    <center>
        <form action="UnosNovogHotela.jsp" name="unoshotel" class="formazausluge" method="post"><br>
            <label><b>Unos novog hotela</b></label><br/>
            <center><input type="submit" name="dugmenovhotel" class="dugmezapretragu" value="Kreni"></center>
        </form>
        <div class="vl"></div>
        <form action="IzmenaHotela.jsp" name="izmenahotela" class="formazausluge" method="post"><br>
            <label><b>Izmena postojeceg hotela</b></label><br/>
            <center><input type="submit" name="dugmeizmenihotel" class="dugmezapretragu" value="Kreni"></center>
        </form>
        <div class="vl"></div>
        <form action="IzmenaHotela.jsp" name="brisanjehotela" class="formazausluge" method="post"><br>
            <label><b>Brisanje postojeceg hotela</b></label><br/>
            <center><input type="submit" name="dugmebrisihotel" class="dugmezapretragu" value="Kreni"></center>
        </form>
    </center><br/>
    <center>
        <form action="ListaHotelaServlet?ispis=listahotel" name="listhotel" class="formazausluge" method="post"><br>
            <label><b>Lista hotela</b></label><br/>
            <center><input type="submit" name="dugmelisthotel" class="dugmezapretragu" value="Kreni"></center>
        </form>
        <div class="vl"></div>
        <form name="prethotel" class="formazausluge" method="post"><br>
            <label><b>Pretraga po hotelu</b></label><br/>
            <center><input type="submit" name="dugmehotel" class="dugmezapretragu" value="Kreni"></center>
        </form>
        <div class="vl"></div>
        <form name="pretsoba" class="formazausluge" method="post"><br>
            <label><b>Pretraga po tipu sobe</b></label><br/>
            <center><input type="submit" name="dugmetipsobe" class="dugmezapretragu" value="Kreni"></center>
        </form>
        
        
    </center>
        
        <%
            }
            else if(role.equals("menadzer"))
            {
        %>
        
        <form name="uslugeforma">
            <label>Pretraga po hotelu</label><br/>
            <input class="dugmezapretragu" type="submit" name="pretragausluge" value="Kreni" onclick="PretragaPoHoteluServlet">
            <label>Pretraga po tipu sobe</label>
            <input class="dugmezapretragu" type="submit" name="pretragasobe" value="Kreni" onclick="PretragaPoHoteluServlet">
                
        </form>
        
        <%
            }
            else if(role.equals("korisnik")) 
            {
        %>

        
        <%
            }
            else if(user==null)
            {
                response.sendRedirect("Registracija.jsp");
            }
        %>
        
        


    </body>
</html>
