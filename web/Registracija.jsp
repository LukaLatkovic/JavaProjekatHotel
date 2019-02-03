<%-- 
    Document   : Registracija
    Created on : Jan 29, 2019, 8:37:05 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/StilRegistracija.css" />
        <title>Hotel-Registracija</title>
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
        
        <form action="RegistracijaServlet" method="post">
            <div class="container">
                <h1>Registracija</h1>
                <p> Unesite vase podatke da biste se registrovali.</p>
            <hr>
            
            
               
           
            <label><b>Korisnicko ime:</b></label>
            <input type="text" name="username"required="true">
            <label><b>Sifra:</b></label>
            <input type="password" name="password"required="true">
            <label><b>Potvrda sifre:</b></label> 
            <input type="password" name="confpassword"required="true">
            <label><b>Mejl:</b></label>  
            <input type="email" name="mejl"required="true">
            <input type="submit" value="Registruj se" class="regdugme">
            
                  
            <div class="container registracija">
            <p align=center>Ukoliko vec imate nalog mozete se prijaviti <a href="Login.jsp">ovde</a></p>
            </div>
            </div>
            <% 
                String msg=(String)request.getAttribute("msg");
                if(msg!=null&& msg.length()>0){
            %>
                <div class="error">
                <p><%=msg%></p>
                </div>
            <%        
                }
            %>
        </form>
    </body>
</html>
