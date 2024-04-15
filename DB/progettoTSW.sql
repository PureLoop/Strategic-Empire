create schema progettoTSW;
use progettoTSW;
drop schema progettoTSW;
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
	username varchar(16) not null,
    pw varchar(16) not null,
    email varchar(25) primary key,
    ruolo varchar(14) not null check(ruolo in("cliente","amministratore"))
);

create table img_acc(
	cod_img_acc varchar(10) primary key,
    img MEDIUMBLOB
);

create table img_gioco(
	cod_img_gioco varchar(10) primary key,
    img MEDIUMBLOB
);

create table img_esp(
	cod_img_esp varchar(10) primary key,
    img mediumblob
);

create table imgToEsp(
	cod_espansione varchar(10),
    cod_img_esp varchar(10),
    primary key(cod_espansione,cod_img_esp),
    foreign key(cod_espansione) references espansione(cod_espansione)
		on delete cascade
        on update cascade,
	foreign key(cod_img_esp) references img_esp(cod_img_esp)
		on delete cascade
        on update cascade
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
    nome_gioco varchar(20) not null,
    edizione varchar(20) default null,
    tipologia varchar(10) not null check(tipologia in('tavolo','carte')),
    prezzo numeric(4,2) not null,
    descrizione varchar(1000) not null,
    n_giocatori int
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

create table imgToAcc(
	cod_acc varchar(10),
    cod_img_acc varchar(10),
    primary key(cod_acc,cod_img_acc),
    foreign key(cod_acc) references accessorio(cod_accessorio)
		on delete cascade
        on update cascade,
	foreign key(cod_img_acc) references img_acc(cod_img_acc)
		on delete cascade
        on update cascade
);

create table imgToGame(
	cod_gioco varchar(10),
    cod_img_gioco varchar(10),
    primary key(cod_gioco,cod_img_gioco),
    foreign key(cod_gioco) references gioco(cod_gioco)
		on delete cascade
        on update cascade,
	foreign key(cod_img_gioco) references img_gioco(cod_img_gioco)
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