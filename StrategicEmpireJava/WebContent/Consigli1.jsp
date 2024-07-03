<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consigli sui Giochi da Tavolo - Pagina 1</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="consigli.css" rel="stylesheet">
</head>
<body>

<main>
    <header>
        <%@ include file="/header/header.jsp"%>
    </header>

    <div class="container my-5">
        <h1 class="text-center mb-4">Consigli sui Giochi da Tavolo - Pagina 1</h1>

        <!-- Cards di Consigli -->
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/400x300" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Strategie Vincenti per Catan</h5>
                        <p class="card-text">Scopri le migliori strategie per dominare il gioco di Catan.</p>
                        <a href="#" class="btn btn-primary stretched-link">Leggi di più</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/400x300" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Come Organizzare una Serata Giochi</h5>
                        <p class="card-text">Suggerimenti su come pianificare una serata perfetta con i giochi da tavolo.</p>
                        <a href="#" class="btn btn-primary stretched-link">Leggi di più</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="https://via.placeholder.com/400x300" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Giochi da Tavolo per Famiglie</h5>
                        <p class="card-text">Scopri i migliori giochi da tavolo adatti a tutta la famiglia.</p>
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
