<%-- 
    Document   : PretragaPoHotelu
    Created on : Jan 30, 2019, 8:47:29 PM
    Author     : Luka Latkovic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Pretraga po hotelu</h2>
        <form action="PretragaPoHotelu.jsp" method="post"> 
        <p>Izaberi hotel:</p>
        
        <select class="select" name="pretragahotel" onchange="this.form.submit();">
            <option value="0">Izaberi Hotel</option>
            
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/businesshotel","root","");
                    Statement stm=conn.createStatement();
                    ResultSet rs=stm.executeQuery("Select distinct id,naziv from hoteli");
                    while(rs.next())
                    {
                        %>
                        <option value="<%=rs.getInt("id")%>"><%=rs.getString("naziv")%></option>
                        <%
                    }
                    conn.close();
                    rs.close();
                }
                catch(Exception ex){
                    ex.printStackTrace();
                }
%>
            </select>

            <br>
        <table class="tabelahoteli">
            <tr>
                <th>Broj</th
                <th>Naziv</th>
                <th>Opis</th>
                <th>Adresa</th>
                <th>Telefon</th>
            </tr>
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/businesshotel","root","");
                    Statement stmt=con.createStatement();
                    ResultSet res=stmt.executeQuery("Select id,naziv,opis,adresa,telefon from hoteli where id="+Integer.parseInt(request.getParameter("pretragahotel")));
                    while(res.next())
                    {
                      %>
                      <tr>
                          <td><%=res.getInt("id")%></td>
                          <td><%=res.getString("naziv")%></td>
                          <td><%=res.getString("opis")%></td>
                          <td><%=res.getString("adresa")%></td>
                          <td><%=res.getString("telefon")%></td>
                      </tr>
                      <%
                    }
                res.close();
                con.close();
                }
                catch(Exception ex)
                {
                    ex.printStackTrace();
                }
                %>
        </table>
        </form>

    </body>
</html>
