<%@ page contentType="text/html; charset=UTF-8" import="java.util.*, it.unisa.bean.OggettiCarrelloBean" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrello</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="CarrelloStyle.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- Font Awesome per icone -->
</head>

<body>

    <%@ include file="/header/header.jsp" %>

    <%
        List<OggettiCarrelloBean> carrellobean = (List<OggettiCarrelloBean>) request.getSession().getAttribute("oggettiCarrello");
    u = (User) session.getAttribute("user");
     boolean loggedIn2 = false;

    if (u != null) {
        loggedIn2 = true;
        name = u.getUsername(); // Supponendo che User abbia un metodo getUsername()
    }    %>
    <style>/* Stile per il popup */
/* Stile per il popup */
.popup-container {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Sfondo trasparente */
    z-index: 1000; /* Z-index alto per sovrapporre altri contenuti */
}

.popup-content {
    position: absolute;
    top: 35%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
    border-radius: 5px;
    text-align: center;
    box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.75); /* Ombra leggera per il popup */
}

.close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 24px;
    cursor: pointer;
    color: #888;
}

.close-btn:hover {
    color: #555;
}
</style>


    <section class="h-100 h-custom" style="background-color: #eee;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <% if (carrellobean != null && !carrellobean.isEmpty()) { %>
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
                                    <button class="btn btn-outline-primary btn-sm me-2"
                                        onclick="decreaseQuantity(<%= oggetto.getCod_articolo() %>)">-</button>
                                    <div style="width: 50px;">
                                        <h5 class="fw-normal mb-0" id="quantity_<%= oggetto.getCod_articolo() %>">&nbsp;&nbsp;&nbsp;<%= oggetto.getQuantita() %></h5>
                                    </div>
                                    <!-- Pulsante "+" per aumentare la quantità -->
                                    <button class="btn btn-outline-primary btn-sm me-2"
                                        onclick="increaseQuantity(<%= oggetto.getCod_articolo() %>)">+</button>
                                    <div style="width: 80px;">
                                        <h5 class="mb-0">&nbsp;&nbsp;<%= oggetto.getPrezzo() %>€</h5>
                                    </div>
                                    <!-- Icona del cestino per rimuovere l'oggetto -->
                                    <a href="CarrelloControl?action=delete&cod_gioco=<%=oggetto.getCod_articolo()%>"
                                        style="color: #cecece;">
                                        <img src="IMMAGINI/cestino.png" alt="Rimuovi" style="width: 20px; height: 20px;">
                                    </a>
                                </div>
                            </div>
                            <hr>
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
                            <a href="#!" type="submit" class="text-white"><i class="fab fa-cc-visa fa-2x me-2"></i></a>
                            <a href="#!" type="submit" class="text-white"><i
                                    class="fab fa-cc-amex fa-2x me-2"></i></a>
                            <a href="#!" type="submit" class="text-white"><i
                                    class="fab fa-cc-paypal fa-2x"></i></a>

                            <form class="mt-4">
                                <div data-mdb-input-init class="form-outline form-white mb-4">
                                    <input type="text" id="typeName" class="form-control form-control-lg" size="17"
                                        placeholder="Nome sulla carta" />
                                    <label class="form-label" for="typeName">Nome sulla carta</label>
                                </div>

                                <div data-mdb-input-init class="form-outline form-white mb-4">
                                    <input type="text" id="typeText" class="form-control form-control-lg" size="17"
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
                                                placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3"
                                                maxlength="3" />
                                            <label class="form-label" for="typeText">Cvv</label>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <!-- Calcolo del Subtotale -->
                            <% double subtotal = 0.0;
                                for (OggettiCarrelloBean oggetto : carrellobean) {
                                    subtotal += oggetto.getPrezzo() * oggetto.getQuantita();
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

                            <button type="button" data-mdb-button-init data-mdb-ripple-init
                                class="btn btn-info btn-block btn-lg" onclick="checkLogin()">
                                <div class="d-flex justify-content-between">
                                    <span><%= totale %>€</span>
                                    <span>Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                </div>
                            </button>
                        </div>
                    </div>
                </div>
                <% } else { %>
                <div class="text-center">
                    <h5>Nessun articolo aggiunto al carrello</h5>
                    <a href="HomePage.jsp" class="btn btn-primary mt-3">Continua lo shopping</a>
                </div>
                <% } %>
            </div>
        </div>
    </section>

    <!-- Popup per avviso login -->
<!-- Popup per avviso login -->
<div id="loginPopup" class="popup-container">
    <div class="popup-content">
        <span class="close-btn" onclick="closePopup()">&times;</span>
        <h2>Attenzione!</h2>
        <p>Per procedere con il checkout, devi effettuare il login o registrarti.</p>
        <a href="Login.jsp" class="btn btn-primary">Login</a>
        <a href="Register.jsp" class="btn btn-secondary">Registrati</a>
    </div>
</div>


    <!-- codice JavaScript per le quantità -->
    <script type="text/javascript">
        function increaseQuantity(codiceArticolo) {
            // Implementazione aumenta quantità
        }

        function decreaseQuantity(codiceArticolo) {
            // Implementazione diminuisci quantità
        }

        function checkLogin() {
            <% if (!loggedIn2) { %>
            // Mostra il popup di avviso
            document.getElementById('loginPopup').style.display = 'block';
            <% } else { %>
            // Fai qualcos'altro quando l'utente è loggato e può procedere
            <% } %>
        }
        function closePopup() {
            document.getElementById('loginPopup').style.display = 'none';
        }

    </script>

    <footer>
        <%@ include file="/footer/footer.jsp" %>
    </footer>

</body>

</html>
