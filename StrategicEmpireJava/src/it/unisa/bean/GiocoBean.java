package it.unisa.bean;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class GiocoBean implements Serializable{
	private static final long serialVersionUID = 1L;
    public String cod_gioco,nome_gioco,edizione,tipologia,descrizione;
    public Double prezzo;
    public int n_giocatori_min,n_giocatori_max,quantita;
    public String immagineCopertina, img2;
    public boolean preferito;

    public GiocoBean(){
        cod_gioco = "";
        nome_gioco = "";
        edizione = "";
        tipologia = "";
        prezzo = 0.0;
        descrizione = "";
        n_giocatori_min = 0;
        n_giocatori_max = 0;
        quantita = 0;
        preferito = false;
    }

    public void setQuantita(int q) {
    	this.quantita = q;
    }
    
    public int getQuantita() {
    	return quantita;
    }
    
    public boolean getPreferito() {
    	return preferito;
    }
    public void setImmagineCop(String img) {
    	this.immagineCopertina = img;
    }
    
    public String getImmagineCop() {
    	return immagineCopertina;
    }
    
    public void setImmagine2(String img) {
    	this.img2 = img;
    }
    
    public String getImmagine2() {
    	return img2;
    }
    public void setCod_gioco(String cod) {
        this.cod_gioco = cod;
    }
    public String getCod_Gioco() {
        return this.cod_gioco;
    }
    
    
    public void setPreferito(boolean preferito) {
    	this.preferito = preferito;
    }
    
    public void setNomegioco(String nome){
        this.nome_gioco = nome;
    }

    public String getNomegioco() {
        return nome_gioco;
    }

    public void setEdizione(String edizione) {
        this.edizione = edizione;
    }
    
    public String getEdizione() {
        return edizione;
    }

    public void setN_giocatori_min(int n){
        this.n_giocatori_min = n;
    }
    public int getN_giocatori_min() {
        return n_giocatori_min;
    }
    
    public void setN_giocatori_max(int n){
        this.n_giocatori_max = n;
    }
    public int getN_giocatori_max() {
        return n_giocatori_max;
    }

    public void setTipologia(String tipologia) {
        this.tipologia = tipologia;
    }

    public String getTipologia() {
        return tipologia;
    }

    public Double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(Double prezzo) {
        this.prezzo = prezzo;
    }
    
    public void setDescrizione(String descrizione){
        this.descrizione = descrizione;
    }

    public String getDescrizione() {
        return descrizione;
    }

    @Override
    public String toString() {
        return "GiocoBean{" +
                "cod_gioco='" + cod_gioco + '\'' +
                ", nome='" + nome_gioco + '\'' +
                ", edizione='" + edizione + '\'' +
                ", tipologia='" + tipologia + '\'' +
                ", descrizione='" + descrizione + '\'' +
                ", prezzo=" + prezzo +
                ", n_Giocatori_min=" + n_giocatori_min +
                ", n_Giocatori_max=" + n_giocatori_max +
                '}';
    }
}
