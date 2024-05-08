package it.unisa;

public class RecensioneBean {
	public int valutazione;
	public String titolo,descrizione,cod_review,data, cod_utente;
	
	public RecensioneBean() {
		valutazione = 0;
		titolo = "";
		descrizione = "";
		cod_review = "";
		data = "";
		cod_utente= "";
	}
	
	public void setValutazione(int val) {
		this.valutazione = val;
	}
	
	public int getValutazione() {
		return valutazione;
	}
	
	public void setCod_Review(String cod) {
		this.cod_review = cod;
	}
	
	public String getCod_Review() {
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
	
	public void setData(String data) {
		this.data = data;
	}
	
	public String getData() {
		return data;
	}
	
	public void setCod_Utente(String cod) {
		cod_utente = cod;
	}
	
	public String getCod_Utente() {
		return cod_utente;
	}
}
