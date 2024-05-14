drop schema progettoTSWAggiornato;
create schema progettoTSWAggiornato;
use progettoTSWAggiornato;
create table espansione(
	cod_espansione varchar(10) primary key,
    nome_espansione varchar(20) not null,
    descrizione varchar(500) not null,
    prezzo numeric(4,2) not null,
    cod_gioco varchar(10) references gioco_da_tavolo(cod_gioco)
		on delete cascade
        on update cascade
);

create table utente(
	cod_utente varchar(10) primary key,
	username varchar(16) not null,
    pw varchar(16) not null,
    email varchar(50) not null,
    ruolo varchar(14) not null check(ruolo in("cliente","amministratore"))
);

create table img_gioco(
	cod_img_gioco varchar(10) primary key,
    copertina boolean,
    img_name varchar(500) not null,
    cod_gioco varchar(10) references gioco(cod_gioco)
);
create table img_acc(
	cod_img_acc varchar(10) primary key,
    copertina boolean,
    img_name varchar(500) not null,
    cod_acc varchar(10) references accessorio(cod_acc)
);
create table img_esp(
	cod_img_esp varchar(10) primary key,
    copertina boolean,
    img_name varchar(500) not null,
    cod_esp varchar(10) references espansione(cod_espansione)
);

create table componente(
	nomeComponente varchar(50) primary key
);

create table accessorio(
	cod_accessorio varchar(10) primary key,
    nome_accessorio varchar(30) not null,
    tipologia varchar(15) not null check(tipologia in('esclusivi','altri brand')),
    prezzo numeric(4,2) not null,
    descrizione varchar(100) not null
);

create table gioco(
	cod_gioco varchar(10) primary key,
    nome_gioco varchar(50) not null,
    edizione varchar(20) default null,
    tipologia varchar(10) not null check(tipologia in('tavolo','carte')),
    prezzo numeric(10,2) not null,
    descrizione varchar(1500) not null,
    n_giocatori_min int not null,
    n_giocatori_max int not null
    );
create table carrello(
	cod_carrello varchar(10) primary key,
    cod_sconto varchar(10) references sconto(cod_sconto)
   
    );
create table sconto(
	nome_sconto varchar(50) not null,
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
    data date not null,
	email_utente varchar(25) not null references utente(email),
    cod_sconto varchar(10) default null references sconto(cod_sconto)
		on delete cascade
        on update cascade,
	cod_utente varchar(10) not null references utente(cod_utente)
		on delete cascade
        on update cascade
);

create table acq_accessorio(
	cod_accessorio varchar(10),
    cod_carrello varchar(10),
    primary key(cod_accessorio,cod_carrello),
    foreign key(cod_accessorio) references accessorio(cod_accessorio) 
		on delete cascade
        on update cascade,
    foreign key(cod_carrello) references carrello(cod_carrello)
		on delete cascade
        on update cascade
);

create table acq_gioco(
cod_gioco varchar(10),
    cod_carrello varchar(10),
    primary key(cod_gioco,cod_carrello),
    foreign key(cod_gioco) references gioco(cod_gioco) 
		on delete cascade
        on update cascade,
    foreign key(cod_carrello) references carrello(cod_carrello)
		on delete cascade
        on update cascade
);

create table acq_espansione(
cod_espansione varchar(10),
    cod_carrello varchar(10),
    primary key(cod_espansione,cod_carrello),
    foreign key(cod_espansione) references espansione(cod_espansione) 
		on delete cascade
        on update cascade,
    foreign key(cod_carrello) references carrello(cod_carrello)
		on delete cascade
        on update cascade
);

create table composizioneGioco(
	nome_componente varchar(50),
    cod_gioco varchar(10),
    n_componente int,
    primary key(nome_componente,cod_gioco),
    foreign key(nome_componente) references componente(nomeComponente)
		on delete cascade
        on update cascade,
	foreign key(cod_gioco) references gioco(cod_gioco)
		on delete cascade
        on update cascade
)