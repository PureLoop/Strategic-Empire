use progettoTSW;
insert into accessorio(cod_accessorio,nome_accessorio,tipologia,prezzo,descrizione) values 
	("acc01","Dadi Rossi","altri brand",15,"Set di dadi rossi"),
    ("acc02","Dadi Verdi","altri brand",20,"Set di dadi verdi"),
    ("acc03","Dadi blu Drago","esclusivi",30,"Set di dadi blu con rifiniture ai bordi a forma di drago");
insert into gioco(cod_gioco,nome_gioco,edizione,tipologia,prezzo,descrizione,n_giocatori) values
	("g001","Barrage","1 edezione","tavolo",80,"Barrage vi permetterà di viaggiare indietro nel tempo in un 1930 alternativo in cui un estremo utilizzo delle risorse fossili ha portato al completo esaurimento del carbone utilizzato come fonte di energia. La società è ormai sull’orlo di una crisi globale quando un gruppo di lungimiranti imprenditori decide di investire un cospicuo ammontare di fondi per lo sviluppo di una nuova fonte energetica rinnovabile e pulita, l’energia idroelettrica.",4),
    ("g002","AutoBahn","1 edizione","tavolo",50,"Sviluppate l’autostrada tedesca (Autobahn), costruendo e potenziando la rete autostradale federale per migliorare la vostra posizione nella società della BundesAutobahn.
Espandete la rete, realizzate differenti progetti e competete con gli altri giocatori per esportare merci e costruire stazioni di servizio; promuovete i vostri impiegati per ottimizzare la vostra strategia e migliorate la vostra plancia giocatore per sbloccare nuovi dipartimenti e aprire nuove strade verso la vittoria.
Riuscirete a sviluppare al meglio le storiche autostrade della Germania e a dare il maggior contributo all'Autobahn?",4);
insert into espansione(cod_espansione,nome_espansione,descrizione,cod_gioco,prezzo) values
("esp001","Barrage 5 giocatore","Arricchisci la tua copia di Barrage con una nuova mappa progettata specificamente per 5 giocatori e scopri le nuove connessioni, studiate per consentire nuove strategie di piazzamento senza alterare il flusso di gioco.","g001",25.5);
insert into img_gioco(cod_img_gioco,img) values
    ("g001Img1",load_file("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pogettoTSW\\IMMAGINI_CATALOGO\\IMMAGINI_GIOCHI\\Barrage_BOX-3D.png")),
	("g001Img2",load_file("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pogettoTSW\\IMMAGINI_CATALOGO\\IMMAGINI_GIOCHI\\Barrage_ESPLOSO.png")),
    ("g002Img1",load_file("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pogettoTSW\\IMMAGINI_CATALOGO\\IMMAGINI_GIOCHI\\Autobahn_3D.png")),
    ("g002Img2",load_file("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pogettoTSW\\IMMAGINI_CATALOGO\\IMMAGINI_GIOCHI\\Autobahn_esploso.png"));
insert into img_acc(cod_img_acc,img) values
     ("acc01Img1",load_file("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pogettoTSW\\IMMAGINI_CATALOGO\\IMMAGINI_ACCESSORI\DADI_ROSSI1.jpg"))
	,("acc02Img1",load_file("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pogettoTSW\\IMMAGINI_CATALOGO\\IMMAGINI_ACCESSORI\\DADI_VERDI1.jpg")),
    ("acc03Img1",load_file("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pogettoTSW\\IMMAGINI_CATALOGO\\IMMAGINI_ACCESSORI\\DADI_BLU_DRAGO.jpg"));
insert into img_esp(cod_img_esp,img) values
    ("esp001Img1",load_file("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pogettoTSW\\IMMAGINI_CATALOGO\\IMMAGINI_ESPANSIONI\\Barrage_5Th-Giocatore_scatola.png")),
	("esp001Img2",load_file("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\pogettoTSW\\IMMAGINI_CATALOGO\\IMMAGINI_ESPANSIONI\\Barrage_5gioc_esploso.png"));
insert into imgToEsp(cod_espansione,cod_img_esp) values 
    ("esp001","esp001Img1"),
    ("esp001","esp001Img2");
insert into imgToGame(cod_gioco,cod_img_gioco) values 
    ("g001","g001Img1"),
    ("g001","g001Img2"),
    ("g002","g001Img1"),
    ("g002","g001Img2");
insert into imgToAcc(cod_acc,cod_img_acc) values
	("acc01","acc01Img1"),
    ("acc02","acc02Img1"),
    ("acc03","acc03Img1");
insert into componente(nomeComponente) values 
	("Regolamento"),("Carte"),("Plance"),
    ("Schede consegne"),("Impiegati"),("Camion in legno"),
    ("Tabellone"),
    ("Mappa"),("Tracciato Energia"),
    ("Tessere"),("Basi Neutrali"),("Basi")
    ,("Ingegneri"),("Elevazioni");
    insert into composizioneGioco(nome_componente,cod_gioco,n_componente) values
	("Regolamento","g002",1),("Carte","g002",69),("Plance","g002",6)
    ,("Schede consegne","g002",6),("Impiegati","g002",100),("Camion in legno","g002",8),("Tabellone","g002",1),
    ("Mappa","g001",1),("Tracciato Energia","g001",1),("Tessere","g001",100),
    ("Basi Neutrali","g001",3),("Basi","g001",5),("Ingegneri","g001",100),("Elevazioni","g001",5); 
insert into sconto(nome_sconto,cod_sconto,perc_sconto) values
	("saldi primaverili","sco001",25),
    ("buono sconto di benvenuto!","sco002",50);
/*
insert into pagamento(cod_pagamento,status_pagamento,data_pagamento,cod_ordine) values
	("buy001",")
*/
insert into utente(username,pw,email,ruolo) values
	("Antoadmin","ant003","antonioceruso@gmail.com""amministratore"),("Scippoadmin","messi","luiginasta01@gmail.com","amministratore"),
	("AnnaTagliamonte","aaa00","annatagliamonte@gmail.com","cliente"),("AldoDamiano","Aldo001","aldodamianogta@gmail.com","cliente");