package it.unisa.bean;
import java.io.Serializable;


public class OggettiCarrelloBean implements Serializable {
    private String cod_articolo;
    private String nome_articolo;
    private Double prezzo;
    private Integer quantita;
    private String immagineCopertina;

    public OggettiCarrelloBean() {
        this.cod_articolo = "";
        this.nome_articolo = "";
        this.prezzo = 0.0;
        this.quantita = 1;
        this.immagineCopertina = "";
    }

    public String getCod_articolo() {
        return cod_articolo;
    }

    public String getNome_articolo() {
        return nome_articolo;
    }

    public Double getPrezzo() {
        return prezzo;
    }

    public Integer getQuantita() {
        return quantita;
    }

    public String getImmagineCopertina() {
        return immagineCopertina;
    }

    public void setCod_articolo(String cod_articolo) {
        this.cod_articolo = cod_articolo;
    }

    public void setNome_articolo(String nome_articolo) {
        this.nome_articolo = nome_articolo;
    }

    public void setPrezzo(Double prezzo) {
        this.prezzo = prezzo;
    }

    public void setQuantita(Integer quantita) {
        this.quantita = quantita;
    }

    public void setImmagineCopertina(String immagineCopertina) {
        this.immagineCopertina = immagineCopertina;
    }
}
