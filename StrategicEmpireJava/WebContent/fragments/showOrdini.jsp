<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="it.unisa.bean.OrdineBean" %>
<%@ page import="it.unisa.bean.OggettiCarrelloBean" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista Ordini</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha512-FI2HjRUxjYpO7ZnuN5N2t1Ee5CBEoHkRy8uav4t3hZf2sT5nS5TNtNtIefc0rU6YU+j1eL4pb4yD4he/7xm+9A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        /* Stili aggiuntivi */
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .table {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        .btn {
            padding: 0.3rem 1rem;
            font-size: 0.9rem;
        }

        .btn-outline-secondary {
            color: #6c757d;
            border-color: #6c757d;
        }

        .btn-outline-secondary:hover {
            color: #ffffff;
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .review-popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            display: none;
        }

        .review-content {
            background-color: #ffffff;
            width: 60%;
            max-width: 600px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 1.5rem;
            cursor: pointer;
            color: #888888;
        }

        .close:hover {
            color: #555555;
        }
    </style>
</head>
<body>
<div class="container mt-3">
    <h3 class="text-center mb-4">Lista Ordini</h3>
    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Codice Ordine</th>
                <th scope="col">Codice Utente</th>
                <th scope="col">Carta</th>
                <th scope="col">Codice Sconto</th>
                <th scope="col">Data</th>
                <th scope="col">Azioni</th>
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
                    <button type="button" class="btn btn-outline-secondary btn-sm" onclick="mostraArticoli('<%= ordine.getCodOrdine() %>')">
                        <i class="fas fa-list"></i> Mostra Articoli
                    </button>
                    <button type="button" class="btn btn-outline-secondary btn-sm ml-2" onclick="scaricaFattura('<%= ordine.getCodOrdine() %>')">
                        <i class="fas fa-file-invoice"></i> Visualizza Fattura
                    </button>
                    <button type="button" class="btn btn-outline-secondary btn-sm ml-2" onclick="inviaRecensione('<%= ordine.getCodOrdine() %>', '<%= ordine.getCodiceUtente() %>')">
                        <i class="fas fa-star"></i> Recensione
                    </button>
                </td>
            </tr>
            <tr id="recapItems_<%= ordine.getCodOrdine() %>" style="display: none;">
                <td colspan="6">
                    <table class="table">
                        <thead class="thead-light">
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
</div>

<!-- Pop-up per la recensione -->
<div id="recensionePopup" class="review-popup">
    <div class="review-content">
        <span class="close" onclick="closePopup()">&times;</span>
        <div id="zonaRecensione"></div>
    </div>
</div>

<!-- JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function scaricaFattura(codOrdine) {
        var url = "Fattura.jsp";
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
        });
    }

    function mostraArticoli(codiceOrdine) {
        var recapItemsRow = document.getElementById("recapItems_" + codiceOrdine);
        if (recapItemsRow.style.display === "none") {
            recapItemsRow.style.display = "table-row";
        } else {
            recapItemsRow.style.display = "none";
        }
    }

    function inviaRecensione(codiceOrdine, username) {
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
                $('#recensionePopup').fadeIn(); // Animazione di fade-in per il pop-up della recensione
            },
            error: function(xhr, status, error) {
                console.error('Errore durante l\'invio della recensione:', status, error);
            }
        });
    }

    function closePopup() {
        $('#recensionePopup').fadeOut(); // Animazione di fade-out per chiudere il pop-up
    }
</script>
</body>
</html>
