<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notizie e Aggiornamenti - Nostro Sito di Giochi</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    <link href="css/News.css" rel="stylesheet">
</head>
<body>
<header>
    <%@ include file="/header/header.jsp"%>
</header>

<main>
    <!-- Carosello di Immagini -->
    <div id="imageCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="IMMAGINI/IMMAGINI_NEWS/FOTO SITO.png" class="d-block w-100" alt="Game Image 1">
                <div class="carousel-caption d-none d-md-block text-center">
                    <h5 class="carousel-title">Scopri Nuove Avventure</h5>
                    <p class="carousel-text">Acquista ora e vivi un viaggio emozionante attraverso mondi fantastici!</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="IMMAGINI/IMMAGINI_NEWS/SfondoNews1.jpg" class="d-block w-100" alt="Game Image 2">
                <div class="carousel-caption d-none d-md-block text-center">
                    <h5 class="carousel-title">Esplora Regni Perduti</h5>
                    <p class="carousel-text">Scopri antichi segreti e misteri nascosti. Acquista oggi stesso!</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="IMMAGINI/IMMAGINI_NEWS/SfondoNews2.jpg" class="d-block w-100" alt="Game Image 3">
                <div class="carousel-caption d-none d-md-block text-center">
                    <h5 class="carousel-title">Combatti Battaglie Galattiche</h5>
                    <p class="carousel-text">Vivi l'epicità del conflitto intergalattico. Acquista ora!</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="IMMAGINI/IMMAGINI_NEWS/SfondoNews3.JPG" class="d-block w-100" alt="Game Image 4">
                <div class="carousel-caption d-none d-md-block text-center">
                    <h5 class="carousel-title">Costruisci Terre di Fantasia</h5>
                    <p class="carousel-text">Esplora e conquista terre incantate. Acquista oggi!</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#imageCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#imageCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

<!-- Card delle News -->
<div class="container">
    <div class="row g-4 justify-content-center">
        <div class="col-md-4">
            <div class="card h-100 shadow-sm border-0">
                <img src="IMMAGINI/IMMAGINI_GIOCHI/Escape-Room.png" alt="Escape Room" class="card-img-top">
                <div class="card-body text-center">
                    <h5 class="card-title">Escape Room</h5>
                    <p class="card-text">Se non avete mai provato una Escape Room, preparatevi a un esperienza di gioco incredibile, e credeteci: saranno i 60 minuti piu elettrizzanti della vostra vita!</p>
                    <a href="http://localhost:7750/StrategicEmpire/DettagliControl?cod_gioco=g014&DES=1" class="btn btn-primary w-100 mt-auto">Leggi di piu</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow-sm border-0">
                <img src="IMMAGINI/IMMAGINI_GIOCHI/cartedagioco.png" alt="Carte regionali" class="card-img-top">
                <div class="card-body text-center">
                    <h5 class="card-title">Carte da Gioco Regionali</h5>
                    <p class="card-text">Non perdetevi, in esclusiva solo per voi le carte da gioco regionali firmate Cranio Creation!</p>
                    <a href="http://localhost:7750/StrategicEmpire/DettagliControl?cod_gioco=g017&DES=1" class="btn btn-primary w-100 mt-auto">Leggi di piu</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow-sm border-0">
                <img src="IMMAGINI/IMMAGINI_GIOCHI/Concordia.png" alt="Concordia" class="card-img-top">
                <div class="card-body text-center">
                    <h5 class="card-title">Concordia</h5>
                    <p class="card-text">Vi aspettano migliaia di combinazioni possibili per un divertimento senza fine!</p>
                    <a href="http://localhost:7750/StrategicEmpire/DettagliControl?cod_gioco=g015&DES=1" class="btn btn-primary w-100 mt-auto">Leggi di piu</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow-sm border-0">
                <img src="IMMAGINI/IMMAGINI_GIOCHI/Sunrise-Lane.png" alt="Sunrise Lane" class="card-img-top">
                <div class="card-body text-center">
                    <h5 class="card-title">Sunrise Lane</h5>
                    <p class="card-text">Sunrise Lane, adatto a tutta la famiglia. Accaparratevi i terreni piu prestigiosi e costruite splendide case per ottenere la vittoria!</p>
                    <a href="http://localhost:7750/StrategicEmpire/DettagliControl?cod_gioco=g013&DES=1" class="btn btn-primary w-100 mt-auto">Leggi di piu</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow-sm border-0">
                <img src="IMMAGINI/IMMAGINI_GIOCHI/MyShelfiePuzzle.png" alt="MyShelfiePuzzle" class="card-img-top">
                <div class="card-body text-center">
                    <h5 class="card-title">Boardgame Puzzle - My Shelfie</h5>
                    <p class="card-text">Puzzle da 1000 pz. raffigurante la cover di My Shelfie.</p>
                    <a href="http://localhost:7750/StrategicEmpire/DettagliControl?cod_gioco=g016&DES=1" class="btn btn-primary w-100 mt-auto">Leggi di piu</a>
                </div>
            </div>
        </div>
    </div>
</div>




    <!-- Newsletter -->
    <div class="newsletter-container text-center my-5">
        <h2 class="newsletter-title">Iscriviti alla nostra Newsletter</h2>
        <form action="#" method="post" class="d-inline-block">
            <div class="input-group">
                <input type="email" class="form-control" id="email" name="email" placeholder="Inserisci la tua email" required>
                <button type="submit" class="btn btn-primary">Iscriviti</button>
            </div>
        </form>
    </div>
</main>

<footer>
    <%@ include file="/footer/footer.jsp"%>
</footer>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
<script src="News.js"></script>
</body>
</html>

