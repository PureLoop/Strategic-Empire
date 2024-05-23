<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.OggettiCarrelloBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrello</title>
    <link href="CarrelloStyle.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

    <!-- Header -->
    <%@ include file="header/header.jsp" %>

    <!-- Carrello -->
    
    <%
        List<OggettiCarrelloBean> carrellobean = (List<OggettiCarrelloBean>) request.getSession().getAttribute("oggettiCarrello");
        int count = 0;
        if (carrellobean != null && !carrellobean.isEmpty()) {
    %>
    <section class="h-100 h-custom" style="background-color: #eee;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-7">
                    <h5 class="mb-3"><a href="HomePage.jsp" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>Continua lo shopping</a></h5>
                    <hr>
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <p class="mb-1">Carrello</p>
                            <p class="mb-0">Hai <%= carrellobean.size() %> articoli nel tuo carrello</p>
                        </div>
                        <div>
                            <p class="mb-0"><span class="text-muted">Ordina per:</span> <a href="#!" class="text-body">prezzo <i class="fas fa-angle-down mt-1"></i></a></p>
                        </div>
                    </div>
                    
                    <!-- Tabella del carrello -->
                     <div class="card mb-3">
        <div class="card-body">
            <% if (!carrellobean.isEmpty()) { %>
                <% for (OggettiCarrelloBean oggetto : carrellobean) { %>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex flex-row align-items-center">
                            <div>
                                <img src="<%= oggetto.getImmagineCopertina() %>" class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                            </div>
                            <div class="ms-3">
                                <h5><%= oggetto.getNome_articolo() %></h5>
                                
                            </div>
                        </div>
<div class="d-flex flex-row align-items-center">
    <!-- Pulsante "-" per diminuire la quantità -->
    <button class="btn btn-outline-primary btn-sm me-2" onclick="decreaseQuantity('<%= oggetto.getCod_articolo() %>')">-</button>
    <div style="width: 50px;">
        <h5 class="fw-normal mb-0" id="quantity_<%= oggetto.getCod_articolo() %>">&nbsp;&nbsp;&nbsp;<%= oggetto.getQuantita() %></h5>
    </div>
    <!-- Pulsante "+" per aumentare la quantità -->
    <button class="btn btn-outline-primary btn-sm me-2" onclick="increaseQuantity('<%= oggetto.getCod_articolo()%>')">+</button>
    <div style="width: 80px;">
        <h5 class="mb-0">&nbsp;&nbsp;<%= oggetto.getPrezzo() %>€</h5>
    </div>
    <!-- Icona del cestino per rimuovere l'oggetto -->
    <a href="CarrelloControl?action=delete&cod_gioco=<%=oggetto.getCod_articolo()%>" style="color: #cecece;">
        <img src="IMMAGINI/cestino.png" alt="Rimuovi" style="width: 20px; height: 20px;">
    </a>                                    
</div>
                    </div>
                    <hr>
                <% } %>
            <% } else { %>
                <p>Nessun articolo nel carrello</p>
            <% } %>
        </div>
    </div>
   </div>
                
                <!-- Riepilogo del carrello -->
                
<div class="col-lg-5">
    <div class="card bg-primary text-white rounded-3">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h5 class="mb-0">Riepilogo del carrello</h5>
                <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                    class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
            </div>

		 <p class="small mb-2">Tipo di carte</p>
                    <a href="#!" type="submit" class="text-white"><i
                        class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                    <a href="#!" type="submit" class="text-white"><i
                        class="fab fa-cc-visa fa-2x me-2"></i></a>
                    <a href="#!" type="submit" class="text-white"><i
                        class="fab fa-cc-amex fa-2x me-2"></i></a>
                    <a href="#!" type="submit" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>

                    <form class="mt-4">
                      <div data-mdb-input-init class="form-outline form-white mb-4">
                        <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                          placeholder="Nome sulla carta" />
                        <label class="form-label" for="typeName">Nome sulla carta</label>
                      </div>

                      <div data-mdb-input-init class="form-outline form-white mb-4">
                        <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
                          placeholder="1234 5678 9012 3457" minlength="19" maxlength="19" />
                        <label class="form-label" for="typeText">Numero della carta</label>
                      </div>

                      <div class="row mb-4">
                        <div class="col-md-6">
                          <div data-mdb-input-init class="form-outline form-white">
                            <input type="text" id="typeExp" class="form-control form-control-lg"
                              placeholder="MM/YYYY" size="7" id="exp" minlength="7" maxlength="7" />
                            <label class="form-label" for="typeExp">Scadenza:</label>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div data-mdb-input-init class="form-outline form-white">
                            <input type="password" id="typeText" class="form-control form-control-lg"
                              placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" />
                            <label class="form-label" for="typeText">CVV</label>
                          </div>
                        </div>
                      </div>

                    </form>

            <!-- Calcolo del Subtotale -->
            <% double subtotal = 0.0;
                for (OggettiCarrelloBean oggetto : carrellobean) {
                    subtotal += oggetto.getPrezzo();
                }
            %>

            <div class="d-flex justify-content-between">
                <p class="mb-2">Subtotale</p>
                <p class="mb-2"><%= subtotal %>€</p>
            </div>

            <!-- Aggiunta del costo di spedizione -->
            <% double costoSpedizione = 10.0; // Puoi sostituire con la logica effettiva per il calcolo del costo di spedizione %>
            

            <div class="d-flex justify-content-between">
                <p class="mb-2">Spedizione</p>
                <p class="mb-2"><%= costoSpedizione %>€</p>
            </div>

            <!-- Calcolo del totale -->
            <% double totale = subtotal + costoSpedizione;
            %>

            <div class="d-flex justify-content-between mb-4">
                <p class="mb-2">Totale (incl. tasse)</p>
                <p class="mb-2"><%= totale %>€</p>
            </div>

            <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-block btn-lg">
                <div class="d-flex justify-content-between">
                    <span><%= totale %>€</span>
                    <span>Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                </div>
            </button>
        </div>
    </div>
</div>     
            </div>
        </div>
    </section>
    <% 
        }
    %>
    <script>
    function decreaseQuantity(codiceArticolo) {
        $.ajax({
            type: "POST",
            url: "update_quantity.jsp",
            data: {
                codiceArticolo: codiceArticolo,
                operation: "decrease"
            },
            success: function(response) {
                // Aggiorna il valore della quantità lato client
                var quantityElement = document.getElementById("quantity_" + codiceArticolo);
                quantityElement.innerText = "   " + response.newQuantity;
            },
            error: function(xhr, status, error) {
                console.error("Errore durante l'aggiornamento della quantità:", error);
            }
        });
    }

    function increaseQuantity(codiceArticolo) {
        $.ajax({
            type: "POST",
            url: "update_quantity.jsp",
            data: {
                codiceArticolo: codiceArticolo,
                operation: "increase"
            },
            success: function(response) {
                // Aggiorna il valore della quantità lato client
                var quantityElement = document.getElementById("quantity_" + codiceArticolo);
                quantityElement.innerText = "   " + response.newQuantity;
            },
            error: function(xhr, status, error) {
                console.error("Errore durante l'aggiornamento della quantità:", error);
            }
        });
    }
    </script>
    <!-- Script Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-THvoJBkDy/OYL21xGvYCgGvGKHpufsfLGsqO/A4i4fqMICT6B6Cd82jgF6T5uik6" crossorigin="anonymous"></script>
</body>
</html>

