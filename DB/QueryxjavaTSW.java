//Query TSW
//Query insert INTO delle entità
private static final String  = "INSERT INTO gioco(cod_gioco, nome_gioco,edizione,tipologia,prezzo,descrizione,n_giocatori) VALUES (?,?,?,?,?,?,?)";

private static final String  = "INSERT INTO accessorio(cod_accessorio, nome_accessorio,tipologia,prezzo,descrizione) VALUES (?,?,?,?,?)";

private static final String  = "INSERT INTO espansione(cod_espansione, nome_espansione,descrizione,cod_gioco,prezzo) VALUES (?,?,?,?,?)";

//Query di select 

private static final String QUERY = "SELECT * FROM gioco";
private static final String QUERY = "SELECT * FROM accessorio";
private static final String QUERY = "SELECT * FROM espansione";

//Query di rimozione di un elemento

String query = "DELETE FROM gioco WHERE cod_gioco= ?";

String query = "DELETE FROM accessorio WHERE cod_accessorio = ?";

String query = "DELETE FROM espansione WHERE cod_espansione= ?";