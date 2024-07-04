package it.unisa.bean;
import java.sql.Date;

import java.io.Serializable;

public class CartaBean implements Serializable {
    private String numero;
    private Date scadenza;
    private int cvv;
    private String username;
    private String nome;

    public CartaBean() {
        this.numero = "";
        this.scadenza = null;
        this.cvv = 0;
        this.username = "";
        this.nome = "";
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public Date getScadenza() {
        return scadenza;
    }

    public void setScadenza(Date scadenza) {
        this.scadenza = scadenza;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "CartaBean{" +
                "numero='" + numero + '\'' +
                ", scadenza=" + scadenza +
                ", cvv=" + cvv +
                ", username='" + username + '\'' +
                ", nome='" + nome + '\'' +
                '}';
    }
}
