<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notizie e Aggiornamenti - Nostro Sito di Giochi</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
</head>
<body>

<main>
    <header>
          <%@ include file="/header/header.jsp"%>
    </header>

    <div class="container my-5">
        <h1 class="text-center mb-4">Notizie e Aggiornamenti</h1>
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card mb-4">
                    <img src="https://via.placeholder.com/800x400" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h2 class="card-title">Titolo dell'articolo 1</h2>
                        <p class="card-text">Breve descrizione dell'articolo. Clicca sul link sottostante per leggere di più.</p>
                        <a href="#" class="btn btn-primary">Leggi di più</a>
                    </div>
                </div>
                <!-- Ripeti questa struttura per ogni articolo -->
            </div>
        </div>
    </div>
    <section class="intro py-5" style="background: rgba(122, 28, 171, 0.03);">
        <div class="container">
            <h2 class="font-sharp mb-5">
                Siamo una casa editrice di giochi da tavolo...<br>
                <strong>anzi, molto di più!</strong>
            </h2>
            <a href="StrategicEmpire/ChiSiamo.jsp" class="btn-purple text-center">Scopri chi siamo</a>
        </div>
    </section>
    <div class="container my-5">
        <h1 class="text-center mb-4">Notizie e Aggiornamenti</h1>
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card mb-4">
                    <img src="https://via.placeholder.com/800x400" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h2 class="card-title">Titolo dell'articolo 1</h2>
                        <p class="card-text">Breve descrizione dell'articolo. Clicca sul link sottostante per leggere di più.</p>
                        <a href="#" class="btn btn-primary">Leggi di più</a>
                    </div>
                </div>
                <!-- Ripeti questa struttura per ogni articolo -->
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
