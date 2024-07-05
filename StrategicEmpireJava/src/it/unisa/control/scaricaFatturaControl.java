package it.unisa.control;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

import it.unisa.bean.OggettiCarrelloBean;
import it.unisa.bean.OrdineBean;

@WebServlet("/scaricaFatturaControl")
public class scaricaFatturaControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String codiceOrdineStr = request.getParameter("codiceOrdine");
        int codiceOrdine = Integer.parseInt(codiceOrdineStr);

        OrdineBean ordineDaScaricare = null;
        List<OrdineBean> ordiniList = (List<OrdineBean>) request.getAttribute("bean");
        for (OrdineBean ordine : ordiniList) {
            if (ordine.getCodOrdine() == codiceOrdine) {
                ordineDaScaricare = ordine;
                break;
            }
        }

        if (ordineDaScaricare != null) {
            PDDocument document = new PDDocument();
            PDPage page = new PDPage(PDRectangle.A4);
            document.addPage(page);

            try (OutputStream outputStream = response.getOutputStream()) {
                PDRectangle pageSize = page.getMediaBox();
                float startX = 50;
                float startY = pageSize.getHeight() - 50;
                float currentY = startY;
                float lineSpacing = 15;

                // Inserisci il contenuto dell'ordine nel PDF
                document.addPage(page);
                document.save(outputStream);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } finally {
                document.close();
            }

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"fattura_ordine_" + codiceOrdine + ".pdf\"");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Ordine non trovato");
        }
    }
}
