<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
boolean visualizza = true;
int DES_GIO= 1;
Collection<?> giochi = (Collection<?>) request.getAttribute("giochi");
if (giochi == null) {
    response.sendRedirect("./gioco");
    return;
}
GiocoBean gioco = (GiocoBean) request.getAttribute("gioco");
Cart cart = (Cart) request.getAttribute("cart");
%>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.bean.GiocoBean"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.Cart"%>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="GiocoStyle.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Strategic-Empire</title>
    <style>
        .toast-container {
            position: fixed;
            top: 1rem;
            right: 1rem;
            z-index: 1050;
        }
        .toast {
            min-width: 200px;
            max-width: 300px;
        }
    </style>
</head>

<body>
    <header>
        <%@ include file="/header/header.jsp"%>
    </header>
    <form action="gioco" method="post" id="form-filtro" style="margin-top: 0%;">
        <input type="hidden" name="action" value="filter">
        <table id="game-table" style="width: 100%;">
            <tr>
                <td style="width: 25%;"><select id="game-type" name="tipologia" required style="width: 100%;">
                        <option value="" selected>Tipo di gioco</option>
                        <option value="Tutti">Tutti</option>
                        <option value="tavolo">Tavolo</option>
                        <option value="carte">Carte</option>
                </select></td>
                <td style="width: 25%;"><input type="number" name="N_giocatori" id="num-players" name="num-players" min="1" max="10" placeholder="Numero giocatori" style="width: 100%;"></td>
                <td style="width: 25%;"><input type="number" name="prezzo" id="priceInput" name="num-players" min="1" max="1000" placeholder="Prezzo" style="width: 100%;"></td>
                <td style="width: 25%;">
                    <button type="submit" class="submit-button" style="width: 100%;">Filtra</button>
                </td>
            </tr>
        </table>
    </form>

    <div id="liveAlertPlaceholder"></div>
    <%
        boolean showAllGames = true; // Imposta a true se vuoi mostrare tutti i giochi inizialmente
        if (request.getAttribute("giochiFiltrati") != null) {
            showAllGames = false; // Se ci sono giochi filtrati, non mostrare tutti i giochi
        }
    %>

    <div class="row" id="allGames" <% if (!showAllGames) { %>style="display: none;"<% } else { %>style="margin-left: 3%; margin-right:3%;margin-top:2%;"<% } %>">
        <!-- Questo è l'elenco di tutti i giochi -->
        <% 
        if (giochi != null && giochi.size() != 0) { 
            Iterator<?> it = giochi.iterator(); 
            while (it.hasNext()) { 
                GiocoBean bean = (GiocoBean) it.next(); 
        %>
        <div class="col-sm-3 mb-3" style="width: 25%;">
        <div class="card">


<a class="no-underline card-link" href="DettagliControl?cod_gioco=<%=bean.getCod_Gioco()%>&DES=<%=DES_GIO%>">
                <div class="card-body">
                    <img src="<%=bean.getImmagineCop()%>" class="card-img-top">
                    <h5 class="card-title"><%=bean.getNomegioco()%></h5>
                    <p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
                    <a href="javascript:void(0);" class="add-to-cart" data-cod-gioco="<%=bean.getCod_Gioco()%>" data-nomegioco="<%=bean.getNomegioco()%>" data-prezzo="<%=bean.getPrezzo()%>">
                        <img src="IMMAGINI/carrelloICON.png" class="icon-carrello">
                    </a>
                </div>
            </a>
        </div>
    </div>
        <% 
            }
        } else { 
        %>
        <div class="col-sm-12 mb-3">
            <p>Nessun gioco disponibile</p>
        </div>
        <% } %>
    </div>
<div class="toast-container position-fixed top-0 end-0 p-3">
    <div id="cartToast" class="toast align-items-center border border-success" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex bg-white rounded p-2">
            <div class="toast-body">
                <span id="toastMessage">Oggetto aggiunto al carrello!</span>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle text-success ms-2" viewBox="0 0 16 16">
                    <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0ZM6.406 11.328L4.47 9.414a.5.5 0 1 1 .707-.708l1.666 1.667 3.75-3.75a.5.5 0 0 1 .708.708l-4.167 4.167a.5.5 0 0 1-.708 0Z" />
                </svg>
            </div>
        </div>
    </div>
</div>



    <script>
        $(document).ready(function() {
            $('.add-to-cart').off('click').on('click', function(event) {
                event.preventDefault(); // Prevenire la navigazione
                var codGioco = $(this).data('cod-gioco');
                var nomeGioco = $(this).data('nomegioco');
                var prezzo = $(this).data('prezzo');

                $.ajax({
                    url: 'CarrelloControl',
                    method: 'POST',
                    data: {
                        action: 'AddGioco',
                        cod_gioco: codGioco
                    },
                    success: function(response) {
                        $('#toastMessage').text(`Oggetto aggiunto al carrello!`);
                        var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                        toastElement.show();
                        setTimeout(function() {
                            toastElement.hide();
                        }, 1500); // Nasconde il toast dopo 1 secondo
                    },
                    error: function(xhr, status, error) {
                        $('#toastMessage').text('Errore durante l\'aggiunta del gioco al carrello.');
                        var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                        toastElement.show();
                        setTimeout(function() {
                            toastElement.hide();
                        }, 1500); // Nasconde il toast dopo 1 secondo
                    }
                });
            });
        });
    </script>

    <div class="row" id="allGames" <%if (showAllGames) {%>
        style="display: none;" <%} else {%>
        style="margin-left: 3%; margin-right:3%;margin-top:2%;"<%}%>">
        <!-- Questo è l'elenco dei giochi filtrati -->
        <%
        Collection<?> giochiFiltrati = (Collection<?>) request.getAttribute("giochiFiltrati");
        if (giochiFiltrati != null && !giochiFiltrati.isEmpty()) {
            Iterator<?> it = giochiFiltrati.iterator();
            while (it.hasNext()) {
                GiocoBean bean = (GiocoBean) it.next();
        %>
        <div class="col-sm-3 mb-3" style="width: 25%;">
            <div class="card">
				<a class="no-underline card-link" href="DettagliControl?cod_gioco=<%=bean.getCod_Gioco()%>&DES=<%=DES_GIO%>">
                    <div class="card-body">
                        <img src="<%=bean.getImmagineCop()%>" class="card-img-top">
                        <h5 class="card-title"><%=bean.getNomegioco()%></h5>
                        <p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
                        <!-- HTML -->
                        <div class="carrello-container">
                            <a href="CarrelloControl?cod_gioco=<%=bean.getCod_Gioco()%>" class="carrello-link">
                                <img src="IMMAGINI/carrelloICON.png" class="icon-carrello">
                            </a>
                            <div class="popup">
                                <span class="popup-text">Ciao</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <%
        }
        } else {
        %>
        <div class="col-sm-12 mb-3">
            <p>Nessun gioco filtrato</p>
        </div>
        <%
        }
        %>
    </div>

    <%@ include file="/footer/footer.jsp"%>
</body>
</html>
