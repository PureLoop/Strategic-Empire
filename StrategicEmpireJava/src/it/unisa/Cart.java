package it.unisa;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<GiocoBean> giochi;
	
	public Cart() {
		giochi = new ArrayList<GiocoBean>();
	}
	
	public void addGioco(GiocoBean gioco) {
		giochi.add(gioco);
	}
	
	public void deleteProduct(GiocoBean gioco) {
		for(GiocoBean g : giochi) {
			if(g.getCod_Gioco() == gioco.getCod_Gioco()) {
				giochi.remove(g);
				break;
			}
			
		}
		
 	}
	
	
	public List<GiocoBean> getGiochi() {
		return  giochi;
	}
}
