// Effetto di Smooth Scroll per i link della navbar
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
    });
});

// Pulsanti di "Leggi di più"
document.querySelectorAll('.read-more').forEach(button => {
    button.addEventListener('click', function(e) {
        e.preventDefault();
        // Esempio di cosa potrebbe fare il pulsante "Leggi di più"
        const moreContent = this.nextElementSibling;
        if (moreContent) {
            moreContent.style.display = moreContent.style.display === 'none' ? 'block' : 'none';
        }
    });
});
