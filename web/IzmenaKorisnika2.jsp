<%-- 
    Document   : IzmenaKorisnika2
    Created on : Feb 8, 2019, 3:15:47 PM
    Author     : Luka Latkovic 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="StilRegistracija.css" rel="stylesheet" type="text/css"/>
<%@page import="java.sql.*"%>
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
String sql ="select * from user where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<h1 align="center">Unesi nove vrednosti</h1>
<hr>
<form  method="post" action="IzmenaKorisnika">
    <div class="container">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<label><b>ID korisnika:</b></label>
<input type="text" name="idkor" value="<%=resultSet.getString("id") %>">
<br>
<label><b>Korisnicko ime:</b></label>
<input type="text" name="korisnicko" value="<%=resultSet.getString("username") %>">
<br>
<label><b>Sifra:</b></label>
<input type="text" name="sifra" value="<%=resultSet.getString("password") %>">
<br>
<label><b>Mejl:</b></label>
<input type="text" name="mail" value="<%=resultSet.getString("email") %>">
<br>
<label><b>Role:</b></label>
<input type="text" name="role" value="<%=resultSet.getString("role") %>">
<br>
<label><b>Poeni:</b></label>
<input type="text" name="poeni" value="<%=resultSet.getString("poeni") %>">
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