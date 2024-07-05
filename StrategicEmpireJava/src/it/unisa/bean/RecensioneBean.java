package it.unisa.bean;

import java.sql.Date;

public class RecensioneBean {
	public int valutazione, codOrdine,cod_review;
	public String titolo,descrizione, username;
	public Date data;
	public RecensioneBean() {
		valutazione = 0;
		titolo = "";
		descrizione = "";
		cod_review =0;
		username= "";
		codOrdine = 0;
	}
	
	public void setCodOrdine(int val) {
		this.codOrdine = val;
	}
	
	public int getCodOrdine() {
		return codOrdine;
	}
	
	public void setValutazione(int val) {
		this.valutazione = val;
	}
	
	public int getValutazione() {
		return valutazione;
	}
	
	public void setCod_Review(int cod) {
		this.cod_review = cod;
	}
	
	public int getCod_Review() {
		return cod_review;
	}
	
	public void setDescrizione(String desc) {
		this.descrizione = desc;
	}
	
	public String getDescrizione() {
		return descrizione;
	}
	
	public void setTitolo(String tit) {
		this.titolo = tit;
	}
	
	public String getTitolo() {
		return titolo;
	}
	
	public void setData(Date data) {
		this.data = data;
	}
	
	public Date getData() {
		return data;
	}
	
	public void setUsername(String user) {
		username = user;
	}
	
	public String getUsername() {
		return username;
	}
}
