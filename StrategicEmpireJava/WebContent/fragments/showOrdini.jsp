<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="it.unisa.bean.OrdineBean" %>
<%@ page import="it.unisa.bean.OggettiCarrelloBean" %>


<table class="table">
    <thead>
        <tr>
            <th scope="col">Codice Ordine</th>
            <th scope="col">Codice Utente</th>
            <th scope="col">Carta</th>
            <th scope="col">Codice Sconto</th>
            <th scope="col">Data</th>
            <th scope="col">Articoli</th>
            <th scope="col">Fattura</th>
        </tr>
    </thead>
    <tbody>
        <% List<OrdineBean> ordiniList = (List<OrdineBean>) request.getAttribute("bean");
           if (ordiniList != null) {
               for (OrdineBean ordine : ordiniList) {
                   List<OggettiCarrelloBean> recapItems = new ArrayList<>(ordine.getListItems());
        %>
        <tr>
            <td><%= ordine.getCodOrdine() %></td>
            <td><%= ordine.getCodiceUtente() %></td>
            <td><%= ordine.getCarta() %></td>
            <td><%= ordine.getCodSconto() %></td>
            <td><%= ordine.getData() %></td>
            <td>
                <button type="button" onclick="mostraArticoli('<%= ordine.getCodOrdine() %>')">Mostra Articoli</button>
            </td>
            <td>
                <labe type="text" onclick="scaricaFattura('<%= ordine.getCodOrdine() %>')">Visualizza Fattura</button>
            </td>
            <td>
                <button type="button" onclick="inviaRecensione('<%= ordine.getCodOrdine() %>', '<%= ordine.getCodiceUtente() %>')">Recensione</button>
            </td>
        </tr>
        <tr id="recapItems_<%= ordine.getCodOrdine() %>" style="display: none;">
            <td colspan="7">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Immagine</th>
                            <th scope="col">Codice Articolo</th>
                            <th scope="col">Prezzo</th>
                            <th scope="col">Quantità</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (recapItems != null && !recapItems.isEmpty()) {
                               for (OggettiCarrelloBean item : recapItems) {
                                   if (item != null && item.getCod_articolo() != null) {
                        %>
                        <tr>
                            <td>
                                <img src="<%= item.getImmagineCopertina() %>" alt="Immagine Articolo" style="width: 50px; height: 50px;">
                            </td>
                            <td><%= item.getCod_articolo() %></td>
                            <td><%= item.getPrezzo() %></td>
                            <td><%= item.getQuantita() %></td>
                        </tr>
                        <%             }
                               }
                           } else { %>
                        <tr>
                            <td colspan="4">Nessun articolo trovato.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </td>
        </tr>
        <%     }
           }
        %>
    </tbody>
</table>
<!-- Pop-up per la recensione -->
<div id="recensionePopup" class="review-popup" style="display: none;">
    <div class="review-content">
        <span class="close" onclick="closePopup()">&times;</span>
        <div id="zonaRecensione"></div>
    </div>
</div>
<script>
function scaricaFattura(codOrdine) {
	 var url = "Fattura.jsp";
	    // Naviga verso l'URL costruito
    $.ajax({
        url: 'AreaPersonaleControl',
        method: 'GET',
        data: {
            action: 'scaricaFattura',
            codOrdine: codOrdine
        },
        xhrFields: {
            responseType: 'blob'
        },
        success: function(data, status, xhr) {
    	    window.location.href = url;

        },
        error: function(xhr, status, error) {
            console.error('Errore durante la generazione della fattura:', status, error);
        }
    })}
        function mostraArticoli(codiceOrdine) {
            var recapItemsRow = document.getElementById("recapItems_" + codiceOrdine);
            if (recapItemsRow.style.display === "none") {
                recapItemsRow.style.display = "table-row";
            } else {
                recapItemsRow.style.display = "none";
            }
        }

        function inviaRecensione(codiceOrdine, username) {
        	console.log(codiceOrdine,username);
            $.ajax({
                url: 'AreaPersonaleControl',
                method: 'POST',
                data: {
                    action: 'recensione',
                    codOrdine: codiceOrdine,
                    username: username
                },
                success: function(response) {
                    $('#zonaRecensione').html(response);
                    $('#recensionePopup').css('display', 'block'); // Mostra il pop-up con la recensione
                },
                error: function(xhr, status, error) {
                    console.error('Errore durante l\'invio della recensione:', status, error);
                }
            });
        }

        function closePopup() {
            $('#recensionePopup').css('display', 'none'); // Chiudi il pop-up
        }
    </script>
</body>
</html>
