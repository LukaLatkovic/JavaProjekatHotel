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
public class Hotel {

    public Hotel(String hotelID, String naziv, String opis, String idMenadzera, String adresa, String telefon) {
        this.hotelID = hotelID;
        this.naziv = naziv;
        this.opis = opis;
        this.idMenadzera = idMenadzera;
        this.adresa = adresa;
        this.telefon = telefon;
    }

    public String getHotelID() {
        return hotelID;
    }

    public void setHotelID(String hotelID) {
        this.hotelID = hotelID;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getIdMenadzera() {
        return idMenadzera;
    }

    public void setIdMenadzera(String idMenadzera) {
        this.idMenadzera = idMenadzera;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }
    
    public Hotel()
    {
        hotelID="";
        naziv="";
        opis="";
        idMenadzera="";
        adresa="";
        telefon="";
    }
            
    

    private String hotelID;
    private String naziv;
    private String opis;
    private String idMenadzera;
    private String adresa;
    private String telefon;
    
}
