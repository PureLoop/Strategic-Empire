<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="it.unisa.bean.ScontoBean" %>
<%@ page import="java.util.Collection" %>
<%

    // Recupera la lista degli sconti dall'attributo di richiesta
    Collection<ScontoBean> sconti = (Collection<ScontoBean>) request.getAttribute("sconti");
%>
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>Nome Sconto</th>
            <th>Percentuale Sconto</th>
            <th>Azione</th>
        </tr>
    </thead>
    <tbody>
        <%
            if (sconti != null && !sconti.isEmpty()) {
                for (ScontoBean sconto : sconti) {
        %>
        <tr>
            <td><%= sconto.getNomeSconto() %></td>
            <td><%= sconto.getPercentuale() %> %</td>
            <td>
                <button class="btn btn-danger btn-sm" onclick="deleteSconto('<%= sconto.getNomeSconto() %>')">Cancella</button>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">Nessun sconto disponibile</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function deleteSconto(nomeSconto) {
        if (confirm("Sei sicuro di voler cancellare questo sconto?")) {
            $.ajax({
                type: "POST",
                url: "ScontoControl",
                data: {
                    action: "deleteSconto",
                    nomeSconto: nomeSconto
                },
                success: function(response) {
                    alert("Sconto cancellato con successo.");
                    // Esegui una nuova chiamata per aggiornare la lista degli sconti
                    showDiscount();
                },
                error: function(xhr, status, error) {
                    console.error("Errore durante l'invio della richiesta: " + error);
                }
            });
        }
    }
</script>

<style>
/* Stili per la responsività */
@media (max-width: 768px) {
    .table {
        font-size: 0.9em;
    }
    .btn-sm {
        font-size: 0.8em;
    }
}
@media (max-width: 480px) {
    .table {
        font-size: 0.8em;
    }
    .btn-sm {
        font-size: 0.7em;
    }
}
</style>
