<%-- 
    Document   : IzmenaHotela3
    Created on : Feb 6, 2019, 12:49:25 AM
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
        
<%!     
        String driverName = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/businesshotel";
        String user1 = "root";
        String psw = "";
%>
        
<%
    String idhot = request.getParameter("idhot");
    String nazhot=request.getParameter("nazhot");
    String opishot=request.getParameter("opishot");
    String idmenhot=request.getParameter("idmenhot");
    String adrhot=request.getParameter("adrhot");
    String telhot=request.getParameter("telhot");
if(idhot != null)
{
Connection con = null;
PreparedStatement ps = null;
int hotID = Integer.parseInt(idhot);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user1,psw);
String sql="Update hoteli set id=?,naziv=?,opis=?,menadzer_id=?,adresa=?,telefon=? where id="+idhot;
ps = con.prepareStatement(sql);
ps.setString(1,idhot);
ps.setString(2,nazhot);
ps.setString(3,opishot);
ps.setString(4,idmenhot);
ps.setString(5,adrhot);
ps.setString(6,telhot);
int i = ps.executeUpdate();
if(i > 0)
{ %>
<label align="center"><b>Uspesno ste izmenili hotel</b></label>
<a href="Usluge.jsp">Vratite se na usluge</a>
<%
}
else
{ %>
<label align="center"><b>Doslo je do problema, pokusajte ponovo!</b></label>
<a href="IzmenaHotela.jsp">Vrati se nazad</a>
<%
} 
}
catch(SQLException sql)
{
request.setAttribute("poruka", sql);
request.getRequestDispatcher("error.jsp").forward(request, response);


}
}
%>
    </body>
</html>
