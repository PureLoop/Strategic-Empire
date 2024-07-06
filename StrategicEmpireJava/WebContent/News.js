// News.js
$(document).ready(function() {
    var carouselInterval = setInterval(function() {
        $('#imageCarousel').carousel('next');
    }, 7000);

    $('#imageCarousel').on('slid.bs.carousel', function() {
        clearInterval(carouselInterval);
        carouselInterval = setInterval(function() {
            $('#imageCarousel').carousel('next');
        }, 7000);
    });
});

