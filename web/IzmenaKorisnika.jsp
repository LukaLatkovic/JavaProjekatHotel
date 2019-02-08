<%-- 
    Document   : IzmenaKorisnika
    Created on : Feb 8, 2019, 2:59:29 PM
    Author     : Luka Latkovic 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="StilRegistracija.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<html>
    <head>
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
<h1 align="center">Izmena hotela</h1>
<hr>
<center>
<table class="tabelaizmena">
<tr>
    <th>ID Korisnika</th>
    <th>Korisnicko ime</th>
    <th>Sifra</th>
    <th>Mejl</th>
    <th>Role</th>
    <th>Poeni</th>
    <th></th>
    <th></th>
</tr>
<%
        try{
        connection = DriverManager.getConnection(connectionUrl+database, userid, password);
        statement=connection.createStatement();
        String sql ="select * from user";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
%>
<tr>
    <td align="right"><%=resultSet.getString("id") %></td>
    <td><%=resultSet.getString("username") %></td>
    <td><%=resultSet.getString("password") %></td>
    <td align="right"><%=resultSet.getString("email") %></td>
    <td><%=resultSet.getString("role") %></td>
    <td><%=resultSet.getString("poeni") %></td>
    <td><input type="button" class="dugmezapretragu" onclick="window.location.href='IzmenaKorisnika2.jsp?id=<%=resultSet.getString("id")%>'" value="Izmeni"></td>
    <td><input type="button" class="dugmezapretragu" onclick="window.location.href='BrisanjeKorisnika?id=<%=resultSet.getString("id")%>'" value="Obrisi"></td>
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
            <center>
                <p align="justify"><%=msg%></p>
            </center>
            <%        
                }
            %>
    </center>   
</body>
</head>
</html>