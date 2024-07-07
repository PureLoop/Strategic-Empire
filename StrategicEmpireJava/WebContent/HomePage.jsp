<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head>
    <script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="generator" content="Hugo 0.122.0">
    <title>Home-Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }

      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }

      .carousel-item {
        height: 65vh;
        min-height: 300px;
        background: no-repeat center center scroll;
        background-size: cover;
      }

      .featurette-image {
        width: 100%;
        height: auto;
      }
      
      .overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Opacità e colore dell'overlay */
}
 /* Stili globali */
        body {
            background:#fff;
            color: #333;
        }

        header {
            background: rgba(0, 0, 0, 0.7);
            padding: 10px 0;
        }

        .navbar {
            margin-bottom: 0;
        }

        .logo {
            font-size: 2em;
            font-weight: bold;
            color: #fff;
        }

        .featurette-heading {
            color: #fff;
        }

        .lead {
            color: #dcdcdc;
        }

        /* Stili per i riquadri "wow" */
        .wow-section {
            display: flex;
            justify-content: space-around;
            margin-top: 50px;
        }

        .wow-box {
            position: relative;
            width: 30%;
            height: 250px;
            background-color: rgba(206, 234, 251, 0.7); /* Sfondo celestino */
        border: 2px solid #4CAF50; /* Bordo verde */
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .wow-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s;
        }

        .wow-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .wow-box:hover img {
            transform: scale(1.05);
        }

        .wow-box h2 {
            position: absolute;
            bottom: 20px;
            left: 20px;
            color: #fff;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .wow-box:hover h2 {
            background-color: rgba(0, 0, 0, 0.7);
        }

        .wow-box a {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: block;
            z-index: 1;
        }
        /* Stili per la sezione spedizione e assistenza */
        .shipping-section {
            background-color: rgba(255, 255, 255, 0.2);
            padding: 50px 0;
            text-align: center;
            margin-top: 50px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .shipping-section h2 {
            color: #fff;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .shipping-section p {
            color: #dcdcdc;
            font-size: 1.1em;
            line-height: 1.6;
        }

        .shipping-section .featurette-image {
            width: 80%;
            max-width: 500px;
            margin-top: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
         /* Stili per la sezione "dove trovarci" */
        .location-section {
            background-color: rgba(255, 255, 255, 0.2);
            padding: 50px 0;
            text-align: center;
            margin-top: 50px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .location-section h2 {
            color: #333;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .location-section p {
            color: #666;
            font-size: 1.1em;
            line-height: 1.6;
        }

        .location-section .featurette-image {
            width: 80%;
            max-width: 500px;
            margin-top: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        /* Stili per il divider */
      .featurette-divider {
        margin: 80px 0;
        border-top: 1px solid #ddd;
      }

      /* Stili per il button */
      .btn-primary {
        background-color: #4CAF50;
        border-color: #4CAF50;
      }

      .btn-primary:hover {
        background-color: #45a049;
        border-color: #45a049;
      }
      /* Stili per le cards delle sezioni */
.assistance-card,
.location-card,
.shipping-card {
  background-color: rgba(206, 234, 251, 0.7);
  border: 2px solid #4CAF50;
  padding: 20px;
  margin-bottom: 20px;
  transition: transform 0.3s ease;
}

.assistance-card:hover,
.location-card:hover,
.shipping-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Stili per il testo e titoli delle cards */
.card-title {
  font-size: 1.5em;
  font-weight: bold;
  color: #333;
}

.card-text {
  color: #666;
}

/* Stili per le immagini nelle cards */
.featurette-image {
  max-width: 100%;
  height: auto;
  border-radius: 5px;
}
      
      

</style>

    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
  </head>
  <body>
    <main>
      <header>
        <%@ include file="/header/header.jsp" %>
      </header>
      <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active" style="background-image: url('IMMAGINI/IMMAGINI_HOME/Carousel1.jpg');">
           <div class="overlay"></div>
            <div class="container">
              <div class="carousel-caption text-start">
                <h1>Scopri nuovi mondi e storie fantastiche</h1>
                <p class="opacity-75">Esplora il nostro catalogo di giochi di ruolo. Immergiti in mondi e storie fantasy che metteranno a dura prova le tue capacit&agrave da player.</p>
                <p><a class="btn btn-lg btn-primary" href="GiocoView.jsp">Scopri</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item" style="background-image: url('IMMAGINI/IMMAGINI_HOME/Carousel2.jpg');">
           <div class="overlay"></div>
            <div class="container">
              <div class="carousel-caption">
                <h1>Riscopri la bellezza di giocare in compagnia</h1>
                <p>Divertiti insieme ai tuoi amici con i pi&ugrave variegati party games e giochi di carte.</p>
                <p><a class="btn btn-lg btn-primary" href="GiocoView.jsp">Scopri</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item" style="background-image: url('IMMAGINI/IMMAGINI_HOME/Carousel3.jpg');">
           <div class="overlay"></div>
            <div class="container">
              <div class="carousel-caption text-end">
                <h1>Strategia e molto ingegno</h1>
                <p>Consulta il nostro catalogo di giochi strategici e gestionali, gestisci le tue risorse, sviluppa le pi&ugrave ingegnose strategie per schiacciare i tuoi avversari.</p>
                <p><a class="btn btn-lg btn-primary" href="GiocoView.jsp">Scopri</a></p>
              </div>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

 <!-- Sezione "wow" per giochi, espansioni e accessori -->
        <div class="container wow-section">
            <div class="wow-box" style="background-image: url('IMMAGINI/IMMAGINI_HOME/Games.jpg');">
                <a href="Games.jsp"></a>
                <h2>Giochi</h2>
            </div>

            <div class="wow-box" style="background-image: url('IMMAGINI/IMMAGINI_HOME/Expansions.jpg');">
                <a href="Expansions.jsp"></a>
                <h2>Espansioni</h2>
            </div>

            <div class="wow-box" style="background-image: url('IMMAGINI/IMMAGINI_HOME/Accessories.jpg');">
                <a href="Accessories.jsp"></a>
                <h2>Accessori</h2>
            </div>
        </div>
        
         <!-- Sezione assistenza -->
        <div class="container shipping-section">
            <div class="row">
                <div class="col-md-6">
                    <img src="IMMAGINI/IMMAGINI_HOME/callCenter.jpg" class="featurette-image img-fluid mx-auto" alt="Assistenza">
                </div>
                <div class="col-md-6">
                    <h2>Assistenza clienti dedicata</h2>
                    <p>Il nostro team di supporto è disponibile 7 giorni su 7 per rispondere a tutte le tue domande e fornire assistenza dettagliata sui nostri prodotti e servizi.</p>
                </div>
            </div>
        </div>

        <!-- Sezione "Dove trovarci" -->
        <div class="container location-section">
            <div class="row">
                <div class="col-md-6">
                    <h2>Dove trovarci fisicamente</h2>
                    <p>Vieni a trovarci nei nostri punti vendita in molte fiere del fumetto e eventi in tutta Italia. Approfitta delle nostre offerte esclusive e del supporto diretto del nostro team.</p>
                </div>
                <div class="col-md-6">
                    <img src="IMMAGINI/IMMAGINI_HOME/standBG.jpeg" class="featurette-image img-fluid mx-auto" alt="Stand">
                </div>
            </div>
        </div>
         <!-- Sezione spedizione -->
        <div class="container shipping-section">
            <div class="row">
                <div class="col-md-6">
                    <h2>Spedizioni veloci e affidabili</h2>
                    <p>Approfitta delle nostre spedizioni express in tutta Italia. Garantiamo consegne veloci e sicure, con opzioni di spedizione gratuita per ordini superiori a 75&euro;.</p>
                </div>
                <div class="col-md-6">
                    <img src="IMMAGINI/IMMAGINI_HOME/spedizione.jpeg" class="featurette-image img-fluid mx-auto" alt="Spedizione">
                </div>
            </div>
        </div>

    
      
      <div class="container">
        <% 
	        u = (User) session.getAttribute("user");
	        loggedIn = (u != null);
          String logoutMessage = request.getParameter("logout");
          if ("true".equals(logoutMessage)) {
        %>
        <div class="alert alert-success mt-3" role="alert">
        
          Logout effettuato con successo.
        </div>
        <% } %>

        <!-- Resto del contenuto della homepage -->
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->
    </main>

    <!-- FOOTER -->
    <footer>
      <%@ include file="/footer/footer.jsp" %>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gyb2MI6jVQDAgg6B0x3YRPH7rOhFnk9pNNRTtV5z6NR1xfWlC2" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-Q6E3U3t8ST3x0C1WZOm8W9lpQ7JoAxYoBrrcBz7+HFiZ9jrHjJJ0quv+KXlF5kVx" crossorigin="anonymous"></script>
<script>
    // Passa l'informazione di login al client
    const loggedIn = <%= loggedIn %>;

    // Funzione per svuotare il local storage se l'utente non è loggato
    function checkLoginAndClearLocalStorage() {
        if (!loggedIn) {
            localStorage.clear();
            console.log("Local storage svuotato perché l'utente non è loggato.");
        }
    }

    // Chiamata alla funzione
    checkLoginAndClearLocalStorage();
</script>
  </body>
</html>
