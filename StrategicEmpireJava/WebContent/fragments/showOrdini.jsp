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
                <button type="button" onclick="scaricaFattura('<%= ordine.getCodOrdine() %>')">Scarica Fattura</button>
            </td>
        </tr>
        <tr id="recapItems_<%= ordine.getCodOrdine() %>" style="display: none;">
            <td colspan="6">
                <table class="table">
                    <thead>
                        <tr>
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
                            <td><%= item.getCod_articolo() %></td>
                            <td><%= item.getPrezzo() %></td>
                            <td><%= item.getQuantita() %></td>
                        </tr>
                        <%             }
                               }
                           } else { %>
                        <tr>
                            <td colspan="3">Nessun articolo trovato.</td>
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

<script>
function scaricaFattura(codiceOrdine) {
    window.location.href = "scaricaFatturaControl?codiceOrdine=" + codiceOrdine;
}

    function mostraArticoli(codiceOrdine) {
        var recapItemsRow = document.getElementById("recapItems_" + codiceOrdine);
        if (recapItemsRow.style.display === "none") {
            recapItemsRow.style.display = "table-row";
        } else {
            recapItemsRow.style.display = "none";
        }
    }
</script>

