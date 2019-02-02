/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beanovi;

/**
 *
 * @author Luka Latkovic
 */
public class Korisnik {

   

    
    private String korisnikID;
    private String username;
    private String password;
    private String email;
    private String role;
    private String poeni;
    
    
    public Korisnik(String korisnikID, String username, String password, String email, String role, String poeni) {
        this.korisnikID = korisnikID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = role;
        this.poeni = poeni;
    }
    
    public Korisnik()
    {
        korisnikID="";
        username="";
        password="";
        email="";
        role="";
        poeni="";
        
    }
    
     public String getKorisnikID() {
        return korisnikID;
    }

    public void setKorisnikID(String korisnikID) {
        this.korisnikID = korisnikID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPoeni() {
        return poeni;
    }

    public void setPoeni(String poeni) {
        this.poeni = poeni;
    }
}
