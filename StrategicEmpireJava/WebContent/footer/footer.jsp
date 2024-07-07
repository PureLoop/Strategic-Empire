<!DOCTYPE html>
<html lang="en" class="h-100" data-bs-theme="auto">
<head>
    <script src="../assets/js/color-modes.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>Modern Footer Example · Bootstrap v5.3</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css" rel="stylesheet">
    
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
      .footer {
        background-color: #f8f9fa;
        padding-top: 2rem;
        padding-bottom: 2rem;
      }
      .footer a {
        color: #6c757d;
        text-decoration: none;
      }
      .footer a:hover {
        color: #495057;
      }
      .footer .nav-item {
        margin-bottom: 0.5rem;
      }
      .footer h5 {
        font-size: 1rem;
      }
      
      
      .footer {
    background-color: #f8f9fa; /* Assicurati che il background sia chiaro */
    color: #212529; /* Colore del testo scuro */
}

.footer a {
    color: #6c757d; /* Colore dei link */
    text-decoration: none;
}

.footer a:hover {
    color: #495057; /* Colore dei link al passaggio del mouse */
}
    </style>
</head>
<body class="d-flex flex-column h-100">
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
      <symbol id="check2" viewBox="0 0 16 16">
        <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"/>
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
      </symbol>
    </svg>

<!-- Begin page content -->
<footer class="footer mt-auto py-3">
  <div class="container">
    <div class="row">
      <div class="col-md-3 mb-3">
        <h5>Company</h5>
        <ul class="nav flex-column">
          <li class="nav-item"><a href="HomePage.jsp" class="nav-link p-0 text-body-secondary">Home</a></li>
          <li class="nav-item"><a href="catalogo.jsp" class="nav-link p-0 text-body-secondary">Catalogo</a></li>
          <li class="nav-item"><a href="News.jsp" class="nav-link p-0 text-body-secondary">News</a></li>
          <li class="nav-item"><a href="ChiSiamo.jsp" class="nav-link p-0 text-body-secondary">Chi siamo</a></li>
        </ul>
      </div>
      <div class="col-md-3 mb-3">
        <h5>Help</h5>
        <ul class="nav flex-column">
          <li class="nav-item"><a href="AreaPersonale.jsp" class="nav-link p-0 text-body-secondary">Area personale</a></li>
          <li class="nav-item"><a href="Contatti.jsp" class="nav-link p-0 text-body-secondary">Contact Us</a></li>
        </ul>
      </div>
<div class="col-md-3 mb-3 text-center">
    <h5>Follow Us</h5>
    <ul class="nav justify-content-center">
        <li class="nav-item"><a href="https://www.facebook.com/CranioCreations?locale=it_IT" class="nav-link text-body-secondary"><i class="bi bi-facebook"></i></a></li>
        <li class="nav-item"><a href="https://x.com/CranioCreations" class="nav-link text-body-secondary"><i class="bi bi-twitter"></i></a></li>
        <li class="nav-item"><a href="https://www.instagram.com/craniocreations_official/" class="nav-link text-body-secondary"><i class="bi bi-instagram"></i></a></li>
        <li class="nav-item"><a href="https://www.youtube.com/@CranioCreations" class="nav-link text-body-secondary"><i class="bi bi-youtube"></i></a></li>
    </ul>
</div>
<div class="col-md-3 mb-3">
    <h5>Newsletter</h5>
    <form>
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Email address" aria-label="Email address">
            <button class="btn btn-outline-secondary" type="button">Sign Up</button>
        </div>
    </form>
</div>
<div class="d-flex justify-content-between py-3 border-top">
    <p>&copy; 2024 Strategic Empire. Tutti i diritti riservati.</p>
    <ul class="list-unstyled d-flex">
        <li class="ms-3"><a class="link-body-secondary" href="https://x.com/CranioCreations"><i class="bi bi-twitter"></i></a></li>
        <li class="ms-3"><a class="link-body-secondary" href="https://www.instagram.com/craniocreations_official/"><i class="bi bi-instagram"></i></a></li>
        <li class="ms-3"><a class="link-body-secondary" href="https://www.facebook.com/CranioCreations?locale=it_IT"><i class="bi bi-facebook"></i></a></li>
        <li class="ms-3"><a class="link-body-secondary" href="https://www.youtube.com/@CranioCreations"><i class="bi bi-youtube"></i></a></li>
    </ul>
</div>

</footer>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
