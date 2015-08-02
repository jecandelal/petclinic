package com.richardhell.petclinic.controller.comercial.atencion.reporte;

import com.richardhell.petclinic.helper.ExcelHelper;
import com.richardhell.petclinic.model.Visita;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class ReporteAtencion extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {

        List<Visita> visitas = (List<Visita>) model.get("visitas");

        List<String> rows = new ArrayList<String>();
        StringBuilder sb = new StringBuilder();
        sb.append("PROPIETARIO|")
                .append("MASCOTA|")
                .append("VETERINARIO|")
                .append("FECHA INGRESO|")
                .append("FECHA SALIDA|")
                .append("PROXIMA VISITA|")
                .append("MOTIVO|")
                .append("DIAGNOSTICO|")
                .append("TRATAMIENTO|")
                .append("DIETA");
        rows.add(sb.toString());

        for (Visita visita : visitas) {
            StringBuilder sbb = new StringBuilder();
            sbb.append(visita.getMascota().getPropietario().getPersona().getNombreCompleto()).append("|")
                    .append(visita.getMascota().getNombre()).append("|")
                    .append(visita.getVeterinario().getPersona().getNombreCompleto()).append("|")
                    .append(visita.getFechaIngreso()).append("|")
                    .append(visita.getFechaSalida()).append("|")
                    .append(visita.getProximaVisita()).append("|")
                    .append(visita.getMotivo()).append("|")
                    .append(visita.getDiagnostico()).append("|")
                    .append(visita.getTratamiento()).append("|")
                    .append(visita.getDieta());

            rows.add(sbb.toString());
        }

        this.createSheet(workbook, rows, "Reporte de Visitas");
        response.setHeader("Content-Disposition", "attachment; filename=\"Reporte de Visitas.xls\"");
    }

    private void createSheet(HSSFWorkbook workBook, List<String> rows, String sheetName) {

        CellStyle cellHeader = ExcelHelper.getStyleHeader(workBook);
        CellStyle cellBody = ExcelHelper.getStyleBody(workBook);

        Sheet sheet = workBook.createSheet(sheetName);

        for (int i = 0; i < rows.size(); i++) {
            String fila = (String) rows.get(i);
            StringTokenizer st = new StringTokenizer(fila, "|");
            Row row = sheet.createRow((short) i);
            int j = 0;

            while (st.hasMoreTokens()) {
                String token = st.nextToken();
                if (i == 0) {
                    this.createCell(row, j, token, cellHeader);
                } else {

                    this.createCell(row, j, token, cellBody);
                }
                j++;
            }
            row.setHeightInPoints((2 * sheet.getDefaultRowHeightInPoints()));
        }

        for (int i = 0; i < 20; i++) {
            sheet.autoSizeColumn((short) i);
        }

    }

    private void createCell(Row row, int i, String value, CellStyle style) {
        Cell cell = row.createCell(i);
        cell.setCellValue(value + " ");
        if (style != null) {
            cell.setCellStyle(style);
        }
    }

}
