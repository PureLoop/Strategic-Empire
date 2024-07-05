<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="it.unisa.bean.OggettiCarrelloBean" %>
<%@ page import="it.unisa.bean.OrdineBean" %>
<%@ page import="it.unisa.bean.User" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fattura</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .invoice-container {
            padding: 30px;
            margin: 20px auto;
            max-width: 900px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background: #fff;
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .invoice-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            border-bottom: 2px solid #eee;
            padding-bottom: 20px;
        }
        .invoice-header h1 {
            margin: 0;
            font-size: 2.5rem;
            font-weight: bold;
            color: #333;
        }
        .invoice-header img {
            max-height: 120px;
            width: auto;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .invoice-details, .invoice-footer {
            margin-bottom: 20px;
        }
        .invoice-details h5, .invoice-footer h5 {
            margin-bottom: 10px;
        }
        .invoice-details p, .invoice-footer p {
            margin: 0;
        }
        .invoice-items table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .invoice-items table th, .invoice-items table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .invoice-items table th {
            background-color: #f8f9fa;
            color: #333;
        }
        .invoice-items table td {
            background-color: #ffffff;
        }
        .invoice-footer {
            text-align: right;
            font-weight: bold;
            font-size: 1.2rem;
            border-top: 2px solid #eee;
            padding-top: 10px;
        }
        .invoice-footer h5 {
            margin: 0;
            font-size: 1.4rem;
            color: #333;
        }
        .btn-print {
            margin-top: 20px;
        }
        .quantity-summary {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-top: 20px;
            background-color: #f1f1f1;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .quantity-summary h5 {
            margin-bottom: 10px;
            font-size: 1.2rem;
        }
        .quantity-summary p {
            margin: 0;
            font-size: 1.1rem;
            color: #555;
        }
        @media print {
            .no-print {
                display: none;
            }
        }
    </style>
    <%
User u = (User) session.getAttribute("user");

OrdineBean ordine =  (OrdineBean)session.getAttribute("ordine");

%>
</head>
<body>
    <div class="invoice-container">
        <div class="invoice-header">
            <div>
                <h1>Fattura</h1>
                <p><strong>Data:</strong> <%= ordine != null ? ordine.getData() : "N/A" %></p>
                <p><strong>Numero Fattura:</strong> <%= ordine != null ? ordine.getCodOrdine() : "N/A" %></p>
            </div>
            <img src="logo.png" alt="Logo" />
        </div>
        <div class="invoice-details">
            <div class="row">
                <div class="col-sm-6">
                    <h5>Mittente</h5>
                    <p><strong>StrategicEmpire S.R.L.</strong></p>
                    <p>Via Esempio 123</p>
                    <p>00100 Roma (RM)</p>
                    <p>Partita IVA: 12345678901</p>
                    <p>Telefono: 0123456789</p>
                    <p>Email: StrategicEmpire@gmail.com</p>
                </div>
                <div class="col-sm-6">
                    <h5>Destinatario</h5>
                    <p><strong><%= ordine != null ? ordine.getCodiceUtente() : "N/A" %></strong></p>
                    <p id="recipientAddress">Via Roma 1</p>
                    <p id="recipientCity">00100 Roma (RM)</p>
                    <p id="recipientPhone">Telefono: 0987654321</p>
                    <p id="recipientEmail">Email: mario.rossi@esempio.com</p>
                </div>
            </div>
        </div>
        <div class="invoice-items">
            <h5>Dettagli Fattura</h5>
            <table>
                <thead>
                    <tr>
                        <th>Descrizione</th>
                        <th>Quantità</th>
                        <th>Prezzo Unitario</th>
                        <th>Totale</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        double totalePrezzo = 0;
                        int quantitaTotale = 0;
                        if (ordine != null) {
                            for (OggettiCarrelloBean item : ordine.getListItems()) {
                                double totaleArticolo = item.getQuantita() * item.getPrezzo();
                                totalePrezzo += totaleArticolo;
                                quantitaTotale += item.getQuantita();
                    %>
                    <tr>
                        <td>Descrizione Articolo</td> <!-- Sostituisci con la descrizione reale se disponibile -->
                        <td><%= item.getQuantita() %></td>
                        <td><%= String.format("%.2f", item.getPrezzo()) %></td>
                        <td><%= String.format("%.2f", totaleArticolo) %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div class="quantity-summary">
            <h5>Riepilogo</h5>
            <p><strong>Quantità Totale:</strong> <%= ordine != null ? quantitaTotale : "N/A" %></p>
            <p><strong>Totale Fattura:</strong> <%= ordine != null ? String.format("%.2f", totalePrezzo+10) : "N/A" %></p>
        </div>
        <div class="no-print btn-print">
            <button class="btn btn-primary" onclick="window.print()">Stampa / Scarica</button>
        </div>
    </div>
</body>
</html>
