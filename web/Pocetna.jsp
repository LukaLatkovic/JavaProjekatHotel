<%-- 
    Document   : Pocetna
    Created on : Jan 29, 2019, 10:58:58 PM
    Author     : User
--%>

<%@page import="Beanovi.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/StilPocetna.css" />
        <title>Pocetna</title>
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
            <a href="Profil.jsp"><%=user%></a>
        </div>
        <%
          }
        %>
        </div>
        
        <h1>Dobrodosli u Business hotel</h1>
        
        <div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="Slike/SlikaHotel1.jpg" alt="Slika1" style="width: 100%">
  <div class="text">Recepcija</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="Slike/SlikaHotel2.jpg" alt="Slika2" style="width: 100%">
  <div class="text">Ulaz u hotel</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="Slike/SlikaHotel3.jpg" alt="Slika3" style="width: 100%">
  <div class="text">Pogled sa terase</div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
    </body>
</html>
