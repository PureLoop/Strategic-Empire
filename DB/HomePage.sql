ALTER USER 'root'@'localhost' IDENTIFIED BY '1212';
use progettoTSWAggiornato;
drop table recensione;
create table recensione(
	cod_review int auto_increment primary key,
    titolo varchar(50),
    descrizione varchar(1000),
    data_review date not null,
    valutazione int not null check(valutazione in(1,2,3,4,5)),
    username varchar(16) references utente(username),
    codOrdine int references ordine(cod_ordine)
);

insert into recensione(cod_review,titolo,descrizione,data_review,valutazione,username) values (1,"Spedizione velocissima!","Sono rimasto  sbalordito dalla velocità con cui i giochi che avevo comprato sono stati spediti e consegnati. Grande cura nell'imballaggio e nella protezione dei prodotti","2024-05-07",5,"cherry");
insert into recensione(cod_review,titolo,descrizione,data_review,valutazione,username) values (2,"Aggiornamenti Costanti sullo Stato dell'Ordine!","Ho apprezzato molto i costanti aggiornamenti sullo stato del mio ordine. Dalla conferma dell'acquisto alla notifica di spedizione, sono stato sempre informato su dove si trovasse il mio pacco e quando sarebbe arrivato. Questa trasparenza è stata estremamente rassicurante e ha reso l'intero processo di acquisto molto piacevole.","2024-05-10",5,"cherry");
insert into recensione(cod_review,titolo,descrizione,data_review,valutazione,username) values (3,"Assistenza Clienti Attenta e Professionale!","Ho avuto un problema con il mio ordine e ho contattato il servizio clienti per assistenza. Sono rimasto colpito dalla loro prontezza nel rispondere e dalla loro disponibilità nel risolvere il mio problema. Hanno gestito la situazione con cortesia e professionalità, dimostrando un vero impegno verso la soddisfazione del cliente. Grazie!","2024-04-03",5,"cherry");
insert into recensione(cod_review,titolo,descrizione,data_review,valutazione,username) values (4,"Facile Processo di Pagamento e Checkout!","Il processo di pagamento e checkout sul vostro sito è stato estremamente semplice e veloce. Le opzioni di pagamento erano varie e sicure, e il processo guidato ha reso tutto molto intuitivo. Ho apprezzato anche la possibilità di salvare le informazioni di pagamento per futuri acquisti, rendendo il processo ancora più conveniente. Ottimo lavoro!","2024-04-28",5,"cherry");
insert into recensione(cod_review,titolo,descrizione,data_review,valutazione,username) values (5,"Sito Web Intuitivo e Facile da Navigare!","Ho apprezzato molto l'esperienza di navigazione sul vostro sito web. È ben strutturato e intuitivo, rendendo facile trovare esattamente ciò che stavo cercando. Le descrizioni dettagliate dei prodotti e le immagini di alta qualità hanno reso la scelta del gioco perfetto un gioco da ragazzi. Continuerò sicuramente a fare acquisti qui!","2024-05-14",5,"cherry");
insert into recensione(cod_review,titolo,descrizione,data_review,valutazione,username,codOrdine) values (6,"Sito Web Intuitivo e Facile da Navigare!","Ho apprezzato molto l'esperienza di navigazione sul vostro sito web. È ben strutturato e intuitivo, rendendo facile trovare esattamente ciò che stavo cercando. Le descrizioni dettagliate dei prodotti e le immagini di alta qualità hanno reso la scelta del gioco perfetto un gioco da ragazzi. Continuerò sicuramente a fare acquisti qui!","2024-05-14",1,"cherry",1);