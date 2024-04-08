create schema progettoTSW;
use progettoTSW;
create table espansione(
	cod_Espansione varchar(10) primary key,
    nome_espansione varchar(20) not null,
    descrizione varchar(50) not null,
    immagine_esp BLOB,
    cod_gioco varchar(10) references gioco_da_tavolo(cod_gioco)
		on delete cascade
        on update cascade
);

create table accessorio(
	cod_accessorio varchar(10) primary key,
    nome_accessorio varchar(30) not null,
    tipologia varchar(15) not null check(tipologia in('esclusivi','altri brand')),
    prezzo numeric(4,2) not null,
    descrizione varchar(50) not null,
    immagine_acc BLOB
);

create table gioco(
	cod_gioco varchar(10) primary key,
    nome_gicoo varchar(20) not null,
    edizione varchar(20) default null,
    tipologia varchar(10) not null check(tipologia in('tavolo','carte')),
    prezzo numeric(4,2) not null,
    descrizione varchar(50) not null,
    immagine_gioco BLOB,
    n_giocatori int,
    n_componenti int
);

create table sconto(
	nome_sconto varchar(20) not null,
    cod_sconto varchar(10) primary key,
    perc_sconto numeric(3) not null
);

create table pagamento(
	cod_pagamento varchar(10) primary key,
    status_pagamento boolean not null,
    data_pagamento datetime not null,
    cod_ordine varchar(10) references ordine(cod_ordine)
		on delete cascade
        on update cascade
);

create table ordine(
	cod_ordine varchar(10) primary key,
    n_articoli int not null,
    totale numeric(5,2) not null,
    cod_sconto varchar(10) default null references sconto(cod_sconto)
		on delete cascade
        on update cascade,
	email_utente varchar(25) not null references utente(email)
		on delete cascade
        on update cascade
);

create table acq_accessorio(
	cod_accessorio varchar(10),
    cod_ordine varchar(10),
    primary key(cod_accessorio,cod_ordine),
    foreign key(cod_accessorio) references accessorio(cod_accessorio) 
		on delete cascade
        on update cascade,
    foreign key(cod_ordine) references ordine(cod_ordine)
		on delete cascade
        on update cascade
);

create table acq_gioco(
cod_gioco varchar(10),
    cod_ordine varchar(10),
    primary key(cod_gioco,cod_ordine),
    foreign key(cod_gioco) references gioco(cod_gioco) 
		on delete cascade
        on update cascade,
    foreign key(cod_ordine) references ordine(cod_ordine)
		on delete cascade
        on update cascade
);

create table utente(
	username varchar(16) not null,
    pw varchar(16) not null,
    email varchar(25) primary key,
    ruolo varchar(14) not null check(ruolo in("cliente","amministratore"))
);
