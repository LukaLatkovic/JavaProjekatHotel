<%-- 
    Document   : Login
    Created on : Jan 29, 2019, 9:04:12 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="${pageContext.request.contextPath}/StilLogovanje.css" />
        <title>Login</title>
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
        
        <form action="LoginServlet" method="post">
            <div class="container">
            <h1>Prijavljivanje</h1>
            <p>Unesite vase korisnicko ime i sifru da biste se ulogovali.</p>
            <hr>
            
            <label><b>Korisnicko ime: </b></label>
            <input type="text" name="korisnickoime">
            <label><b>Sifra: </b></label> 
            <input type="password" name="korisnickasifra">
            <input type="submit" value="Uloguj se" class="regdugme">
            <input type="reset" value="Ponisti uneto" class="odudugme">
            </div>
                   
            <div class="container registracija">
            <p align="center">Ako nemas otvoren nalog, registruj se <a href="Registracija.jsp">ovde</a></p>
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
