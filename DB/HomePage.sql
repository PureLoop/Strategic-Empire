use progettoTSWAggiornato;
create table recensione(
	cod_review varchar(10) primary key,
    titolo varchar(50),
    descrizione varchar(1000),
    data_review date not null,
    valutazione int not null check(valutazione in(1,2,3,4,5)),
    cod_utente varchar(10) references utente(cod_utente)
);

insert into recensione(cod_review,titolo,descrizione,data_review,valutazione,cod_utente) values ("rev001","Spedizione velocissima!","Sono rimastosbalordito dalla volocità con cui i giochi che avevo comprato sono stati spediti e consegnati. Grande cura nell'imballaggio e nella protezione dei prodotti","2024-05-07",5,"ut1212");