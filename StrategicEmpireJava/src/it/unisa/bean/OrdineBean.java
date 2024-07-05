package it.unisa.bean;

import java.util.Collection;

public class OrdineBean {
    private String codiceUtente;
    private String carta;
    private String codSconto;
    private int codOrdine;
    private String data;
    private Collection<OggettiCarrelloBean> listItems = null;
    
    public OrdineBean() {
        codiceUtente = "";
        carta = "";
        codSconto = "";
        data = "";
    }

    public String getCodiceUtente() {
        return codiceUtente;
    }

    public void setCodiceUtente(String codiceUtente) {
        this.codiceUtente = codiceUtente;
    }

    public String getCarta() {
        return carta;
    }

    public void setCarta(String carta) {
        this.carta = carta;
    }

    public String getCodSconto() {
        return codSconto;
    }

    public void setCodSconto(String codSconto) {
        this.codSconto = codSconto;
    }

    public int getCodOrdine() {
        return codOrdine;
    }

    public void setCodOrdine(int codOrdine) {
        this.codOrdine = codOrdine;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
    
    public Collection<OggettiCarrelloBean> getListItems() {
        return listItems;
    }

    public void setListItems(Collection<OggettiCarrelloBean> listItems) {
        this.listItems = listItems;
    }
}

