package it.unisa;
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
    public int n_giocatori;

    public GiocoBean(){
        cod_gioco = "";
        nome_gioco = "";
        edizione = "";
        tipologia = "";
        prezzo = 0.0;
        descrizione = "";
        n_giocatori = 0;
    }

    public void setCod_gioco(String cod) {
        this.cod_gioco = cod;
    }
    public String getCod_Gioco() {
        return this.cod_gioco;
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

    public void setN_giocatori(int n){
        this.n_giocatori = n;
    }
    public int getN_giocatori() {
        return n_giocatori;
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
                ", n_Giocatori=" + n_giocatori +
                '}';
    }
}
