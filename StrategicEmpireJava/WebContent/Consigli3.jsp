<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recensioni e Suggerimenti - Consigli di Gioco</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="consigli.css" rel="stylesheet">
</head>
<body>

<main>
    <header>
        <%@ include file="header/header.jsp"%>
    </header>

    <div class="container my-5">
        <h1 class="text-center mb-4">Recensioni e Suggerimenti - Consigli di Gioco</h1>

        <!-- Card Recensioni -->
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/400x300" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Recensione: Avventure Epiche</h5>
                        <p class="card-text">Scopri cosa rende Avventure Epiche un gioco da tavolo unico.</p>
                        <a href="#" class="btn btn-primary stretched-link">Leggi di più</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/400x300" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Recensione: Regni Perduti</h5>
                        <p class="card-text">Scopri perché Regni Perduti è uno dei giochi più amati del momento.</p>
                        <a href="#" class="btn btn-primary stretched-link">Leggi di più</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/400x300" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Recensione: Battaglie Galattiche</h5>
                        <p class="card-text">Scopri il fascino delle Battaglie Galattiche nel mondo dei giochi da tavolo.</p>
                        <a href="#" class="btn btn-primary stretched-link">Leggi di più</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <%@ include file="/footer/footer.jsp"%>
    </footer>
</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
