drop schema progettoTSWAggiornato;
ALTER USER 'root'@'localhost' IDENTIFIED BY '1212';
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
	Username varchar(20) primary key,
	nome varchar(16) not null,
    cognome varchar(16) not null,
    pw varchar(128) not null,
    saltPW varchar(128) not null,
    email varchar(50)not null,
    ruolo varchar(14) not null check(ruolo in("cliente","amministratore")),
    indirizzo varchar(50) default null,
    ncivico int(3) default null
);
create table carta(
	numero varchar(16) primary key not null,
    scadenza int(4) not null,
    cvv int (3) not null,
    Username varchar(20) references utente(Username),
    nome varchar(32) not null
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

create table recap(
	oggetto int auto_increment primary key,
	num_ordine varchar(10) not null references ordine(cod_ordine),
    acq_gio	   varchar(10) default null references acq_gioco(cod_gioco),
    acq_esp    varchar(10) default null references acq_espansione(cod_espansione),
    acq_acc    varchar(10) default null references acq_accessorio(cod_accessorio)
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
    data date not null,
    cod_sconto varchar(10) default null references sconto(cod_sconto)
		on delete cascade
        on update cascade,
	cod_utente varchar(20) not null references utente(Username)
		on delete cascade
        on update cascade
);

create table acq_accessorio(
	cod_accessorio varchar(10),
    quantita int,
    nome_ut varchar(20),
    primary key(cod_accessorio,nome_ut),
    foreign key(cod_accessorio) references accessorio(cod_accessorio) 
		on delete cascade
        on update cascade,
	foreign key(nome_ut) references utente(Username)

);

create table acq_gioco(
cod_gioco varchar(10),
    quantita int,
    nome_ut varchar(20),
    primary key(cod_gioco,nome_ut),
    foreign key(cod_gioco) references gioco(cod_gioco) 
		on delete cascade
        on update cascade,
	foreign key(nome_ut) references utente(Username)

);

create table acq_espansione(
    cod_espansione varchar(10),
	quantita int,
    nome_ut varchar(20),
    primary key(cod_espansione, nome_ut),
    foreign key(cod_espansione) references espansione(cod_espansione) 
		on delete cascade
        on update cascade,
	foreign key(nome_ut) references utente(Username)
);
