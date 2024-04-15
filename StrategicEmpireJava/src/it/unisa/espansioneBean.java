package it.unisa;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class espansioneBean implements Serializable{
    public String cod_gioco,cod_espansione,nome_espansione,descrizione;
    public Double prezzo;


    public espansioneBean(){
    	cod_gioco = "";
        cod_espansione = "";
        nome_espansione = "";
        descrizione = "";
        prezzo = 0.0;
    }

    public void setCod_espansione(String cod) {
        this.cod_espansione = cod;
    }
    public String getCod_espansione() {
        return this.cod_espansione;
    }
    
    public void setNomeespansione(String nome){
        this.nome_espansione = nome;
    }

    public String getNomeespansione() {
        return nome_espansione;
    }

    public void setCod_gioco(String cod) {
        this.cod_gioco = cod;
    }

    public String getCod_gioco() {
        return cod_gioco;
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
                ", nome_espansione='" + nome_espansione + '\'' +
                ", cod_espansione='" + cod_espansione + '\'' +
                ", prezzo=" + prezzo + '\'' +             
                ", descrizione='" + descrizione +
                '}';
    }
}
