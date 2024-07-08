package it.unisa.bean;

public class ScontoBean {
    private String codSconto;
    private String nomeSconto;
    private double percentuale;

    // Constructor
    public ScontoBean() {
        this.codSconto = "";
        this.nomeSconto = "";
        this.percentuale = 0;
    }


    // Getter and Setter for codSconto
    public String getCodSconto() {
        return codSconto;
    }

    public void setCodSconto(String codSconto) {
        this.codSconto = codSconto;
    }

    // Getter and Setter for nomeSconto
    public String getNomeSconto() {
        return nomeSconto;
    }

    public void setNomeSconto(String nomeSconto) {
        this.nomeSconto = nomeSconto;
    }

    // Getter and Setter for percentuale
    public double getPercentuale() {
        return percentuale;
    }

    public void setPercentuale(double percentuale) {
        this.percentuale = percentuale;
    }

    // toString method
    @Override
    public String toString() {
        return "ScontoBean{" +
                "codSconto='" + codSconto + '\'' +
                ", nomeSconto='" + nomeSconto + '\'' +
                ", percentuale=" + percentuale +
                '}';
    }
}
