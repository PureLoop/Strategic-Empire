<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notizie e Aggiornamenti - Nostro Sito di Giochi</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    <link href="News.css" rel="stylesheet">
</head>
<body>
<main>
    <header>
        <%@ include file="/header/header.jsp"%>
    </header>

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
                    <img src="IMMAGINI/IMMAGINI_NEWS/AvventureEpiche.jpg" alt="Avventure Epiche" class="card-img-top">
                    <div class="card-body text-center">
                        <h5 class="card-title">Avventure Epiche</h5>
                        <p class="card-text">Un nuovo gioco di avventure epiche con componenti di alta qualità e storie coinvolgenti.</p>
                        <a href="#" class="btn btn-primary w-100 mt-auto">Leggi di più</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-0">
                    <img src="IMMAGINI/IMMAGINI_NEWS/ReamiPerduti.jpg" alt="Reami Perduti" class="card-img-top">
                    <div class="card-body text-center">
                        <h5 class="card-title">Reami Perduti</h5>
                        <p class="card-text">Esplora terre misteriose e scopri antichi segreti con questo gioco di strategia. Affronta pericoli nascosti in ogni angolo.</p>
                        <a href="#" class="btn btn-primary w-100 mt-auto">Leggi di più</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-0">
                    <img src="IMMAGINI/IMMAGINI_NEWS/BattaglieGalattiche.jpg" alt="Battaglie Galattiche" class="card-img-top">
                    <div class="card-body text-center">
                        <h5 class="card-title">Battaglie Galattiche</h5>
                        <p class="card-text">Combatti epiche battaglie spaziali con flotte di astronavi personalizzabili. Vivi l'epicità del conflitto intergalattico.</p>
                        <a href="#" class="btn btn-primary w-100 mt-auto">Leggi di più</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-0">
                    <img src="IMMAGINI/IMMAGINI_NEWS/SunriseLane.png" alt="Sunrise Lane" class="card-img-top">
                    <div class="card-body text-center">
                        <h5 class="card-title">Sunrise Lane</h5>
                        <p class="card-text">Sunrise Lane, adatto a tutta la famiglia. Accaparratevi i terreni più prestigiosi e costruite splendide case per ottenere la vittoria!</p>
                        <a href="#" class="btn btn-primary w-100 mt-auto">Leggi di più</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm border-0">
                    <img src="IMMAGINI/IMMAGINI_NEWS/TerreDiFantasia.png" alt="Terre di Fantasia" class="card-img-top">
                    <div class="card-body text-center">
                        <h5 class="card-title">Terre di Fantasia</h5>
                        <p class="card-text">Costruisci il tuo impero in un mondo fantasy ricco di magia e creature mitiche. Esplora e conquista terre incantate.</p>
                        <a href="#" class="btn btn-primary w-100 mt-auto">Leggi di più</a>
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

    <footer>
        <%@ include file="/footer/footer.jsp"%>
    </footer>
</main>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>

