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
public class TipSobe {

    public TipSobe(String tipSobeID, String hotelId, String kreveti, String brojSoba, String brojSlobodnih, String opis, String cena) {
        this.tipSobeID = tipSobeID;
        this.hotelId = hotelId;
        this.kreveti = kreveti;
        this.brojSoba = brojSoba;
        this.brojSlobodnih = brojSlobodnih;
        this.opis = opis;
        this.cena = cena;
    }

    public String getTipSobeID() {
        return tipSobeID;
    }

    public void setTipSobeID(String tipSobeID) {
        this.tipSobeID = tipSobeID;
    }

    public String getHotelId() {
        return hotelId;
    }

    public void setHotelId(String hotelId) {
        this.hotelId = hotelId;
    }

    public String getKreveti() {
        return kreveti;
    }

    public void setKreveti(String kreveti) {
        this.kreveti = kreveti;
    }

    public String getBrojSoba() {
        return brojSoba;
    }

    public void setBrojSoba(String brojSoba) {
        this.brojSoba = brojSoba;
    }

    public String getBrojSlobodnih() {
        return brojSlobodnih;
    }

    public void setBrojSlobodnih(String brojSlobodnih) {
        this.brojSlobodnih = brojSlobodnih;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getCena() {
        return cena;
    }

    public void setCena(String cena) {
        this.cena = cena;
    }
    
    public TipSobe()
    {
        tipSobeID="";
        hotelId="";
        kreveti="";
        brojSoba="";
        brojSlobodnih="";
        opis="";
        cena="";
        
    }
    
    private String tipSobeID;
    private String hotelId;
    private String kreveti;
    private String brojSoba;
    private String brojSlobodnih;
    private String opis;
    private String cena;
    
}
