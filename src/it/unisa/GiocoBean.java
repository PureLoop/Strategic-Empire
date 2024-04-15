package it.unisa;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class GiocoBean implements Serializable{
    public String cod_gioco,nome,edizione,tipologia,descrizione;
    public Double prezzo;
    public int n_Giocatori;

    public GiocoBean(){
        cod_gioco = "";
        nome = "";
        edizione = "";
        tipologia = "";
        descrizione = "";
        prezzo = 0.0;
        n_Giocatori = 0;
    }

    public void setCod_gioco(String cod) {
        this.cod_gioco = cod;
    }
    public String getCod_Gioco() {
        return this.cod_gioco;
    }
    
    public void setNome(String nome){
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setEdizione(String edizione) {
        this.edizione = edizione;
    }
    
    public String getEdizione() {
        return edizione;
    }

    public void setN_Giocatori(int n){
        this.n_Giocatori = n;
    }
    public int getN_Giocatori() {
        return n_Giocatori;
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
                ", nome='" + nome + '\'' +
                ", edizione='" + edizione + '\'' +
                ", tipologia='" + tipologia + '\'' +
                ", descrizione='" + descrizione + '\'' +
                ", prezzo=" + prezzo +
                ", n_Giocatori=" + n_Giocatori +
                '}';
    }
}
