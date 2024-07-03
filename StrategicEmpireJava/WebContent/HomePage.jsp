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

      <!-- START THE FEATURETTES -->
      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading fw-normal lh-1">Spedizioni in tutta italia. <span class="text-body-secondary">Pi&ugrave veloce della luce</span></h2>
          <p class="lead">Copertura in tutta Italia grazie alle nostre spedizioni express. Spedizioni a domicilio o negli appositi centri di ritiro. Spedizioni low cost o completamente gratuite per ordini superiori a 75&euro;.</p>
        </div>
        <div class="col-md-5">
          <img src="IMMAGINI/IMMAGINI_HOME/spedizione.jpeg" class="featurette-image img-fluid mx-auto" alt="Spedizione">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 order-md-2">
          <h2 class="featurette-heading fw-normal lh-1">Dove trovarci fisicamente? <span class="text-body-secondary">IN FIERA!!!</span></h2>
          <p class="lead">Oltre al nostro store online, hai la possibilit&agrave di trovarci in moltissime fiere del fumetto e non solo in giro per l'Italia. Vieni a trovarci per chiedere consigli sull'acquisto, avere scontistiche da fiera oppure semplicemente per provare alcuni dei titoli nel nostro catalogo.</p>
        </div>
        <div class="col-md-5 order-md-1">
          <img src="IMMAGINI/IMMAGINI_HOME/standBG.jpeg" class="featurette-image img-fluid mx-auto" alt="Stand">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading fw-normal lh-1">Assistenza 7 giorni su 7 <span class="text-body-secondary">Per ogni tua domanda ci siamo noi!</span></h2>
          <p class="lead">Per qualsiasi dubbio ci siamo Noi!!! Se hai domande, dubbi o neccessiti di supporto, sei nel posto giusto! Il nostro team dedicato &egrave qui per aiutarti in ogni modo possibile. Il nostro team &egrave qui per fornirti tutte le informazioni di cui potresti avere bisogno per utilizzare al meglio i nostri prodotti o servizi.</p>
        </div>
        <div class="col-md-5">
          <img src="IMMAGINI/IMMAGINI_HOME/callCenter.jpg" class="featurette-image img-fluid mx-auto" alt="Assistenza">
        </div>
      </div>

      <div class="container">
        <% 
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
  </body>
</html>
