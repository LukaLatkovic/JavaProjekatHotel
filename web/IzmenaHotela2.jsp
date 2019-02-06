<%-- 
    Document   : IzmenaHotela2
    Created on : Feb 6, 2019, 12:27:08 AM
    Author     : Luka Latkovic 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        
        
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "businesshotel";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from hoteli where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<h1 align="center">Unesi nove vrednosti</h1>
<hr>
<form  method="post" action="IzmenaHotela3.jsp">
    <div class="container">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<label><b>ID hotela:</b></label>
<input type="text" name="idhot" value="<%=resultSet.getString("id") %>">
<br>
<label><b>Naziv Hotela:</b></label>
<input type="text" name="nazhot" value="<%=resultSet.getString("naziv") %>">
<br>
<label><b>Opis Hotela:</b></label>
<input type="text" name="opishot" value="<%=resultSet.getString("opis") %>">
<br>
<label><b>ID Menadzera:</b></label>
<input type="text" name="idmenhot" value="<%=resultSet.getString("menadzer_id") %>">
<br>
<label><b>Adresa:</b></label>
<input type="text" name="adrhot" value="<%=resultSet.getString("adresa") %>">
<br>
<label><b>Telefon:</b></label>
<input type="text" name="telhot" value="<%=resultSet.getString("telefon") %>">
<br><br>
<input type="submit" class="regdugme" value="Izmeni">
    </div>
</form>

<%
    }
connection.close();
} 
catch (Exception e) {
    e.printStackTrace();
}
%>

    </body>
</html>
