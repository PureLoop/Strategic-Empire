package it.unisa.bean;
import java.io.Serializable;


public class OggettiCarrelloBean implements Serializable {
    private String cod_articolo;
    private String nome_articolo;
    private Double prezzo;
    private Integer quantita;
    private String immagineCopertina;
    private boolean selezionato;

    public OggettiCarrelloBean() {
        this.cod_articolo = "";
        this.nome_articolo = "";
        this.prezzo = 0.0;
        this.quantita = 1;
        this.immagineCopertina = "";
        this.selezionato = true;
    }

    public String getCod_articolo() {
        return cod_articolo;
    }
    
    public boolean getSelezionato() {
        return selezionato;
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
    
    public void setSelezionato (boolean t) {
        this.selezionato = t;
    }
    
    @Override
    public String toString() {
        return "OggettiCarrelloBean{" +
                "cod_articolo='" + cod_articolo + '\'' +
                ", nome_articolo='" + nome_articolo + '\'' +
                ", prezzo=" + prezzo +
                ", quantita=" + quantita +
                ", immagineCopertina='" + immagineCopertina + '\'' +
                ", selezionato=" + selezionato +
                '}';
    }
}
