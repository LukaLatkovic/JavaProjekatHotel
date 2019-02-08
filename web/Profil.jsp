<%-- 
    Document   : Profil
    Created on : Feb 2, 2019, 9:40:23 PM
    Author     : Luka Latkovic
--%>

<%@page import="java.sql.*"%>
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
            
            String korisnikid=korisnik.getKorisnikID();
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
         
         <hr>
         
         <%

            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "businesshotel";
            String userid = "root";
            String password = "";
            try 
                {
                    Class.forName(driver);
                }
            catch (ClassNotFoundException e) 
                {
                     e.printStackTrace();
                }
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
%>


<h1 align="center">Rezervisane sobe</h1>
<hr>
<center>
<table class="tabelaizmena">
<tr>
    <th>Naziv hotela</th>
    <th>Kreveti</th>
    <th>Cena</th>
    <th>Datum iznajmljenja</th>
    <th>Status</th>
</tr>
<%
        
        try{
        connection = DriverManager.getConnection(connectionUrl+database, userid, password);
        statement=connection.createStatement();
        String sql ="select h.naziv,ts.kreveti,ts.cena,i.datum_iznajmljeno,i.status from hoteli as h join tipsobe as ts on h.id=ts.hotel_id join iznajmljeno as i on ts.id=i.soba_id join user as u on h.menadzer_id=u.id where u.username='"+korisnikuser+"'";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
%>
<tr>
    <td align="right"><%=resultSet.getString("h.naziv") %></td>
    <td><%=resultSet.getString("ts.kreveti") %></td>
    <td><%=resultSet.getString("ts.cena") %></td>
    <td align="right"><%=resultSet.getString("i.datum_iznajmljeno") %></td>
    <td><%=resultSet.getString("i.status") %></td>
</tr>
<%
    }
    connection.close();
    } 
    catch (Exception e)
        {
        e.printStackTrace();
        }
%>
        </table>
        <% 
                String msg=(String)request.getAttribute("msg");
                if(msg!=null&& msg.length()>0){
            %>
                    <div class="">
                <p align="justify"><%=msg%></p>
                </div>
            <%        
                }
            %>
    </center>   
         
         <input type="submit" value="Odjavi se" class="regdugme">
         </form>
    </body>
</html>
