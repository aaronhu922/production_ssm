package org.hqu.production_ms.view;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hqu.production_ms.domain.DueBottle;
import org.hqu.production_ms.domain.OrderItem;
import org.hqu.production_ms.domain.vo.COrderVO;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * This view class generates a PDF document 'on the fly' based on the data
 * contained in the model.
 * 
 * @author www.codejava.net
 *
 */
public class PDFBuilder extends AbstractITextPdfView {

	final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// get data model which is passed by the Spring container
		List<OrderItem> listItems = (List<OrderItem>) model.get("listOrderItems");
		List<DueBottle> listBottles = (List<DueBottle>) model.get("listBottles");
		// define font for table header row
		COrderVO order = (COrderVO) model.get("order");

		BaseFont baseFont = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
		// Font font = FontFactory.getFont(FontFactory.HELVETICA);
		Font font = new Font(baseFont, 15, Font.NORMAL);
		Font font1 = new Font(baseFont, 18, Font.NORMAL);

		// font.setColor(BaseColor.WHITE);
		Paragraph pa0 = new Paragraph("淄博锦庄气体有限公司销售单", font1);
		pa0.setAlignment(Element.ALIGN_CENTER);

		doc.add(pa0);
		PdfPTable ordertable = new PdfPTable(6);
		ordertable.setWidthPercentage(100.0f);
		ordertable.setWidths(new float[] { 1.50f, 2.0f, 1.5f, 2.0f, 1.5f, 2.0f });
		ordertable.setSpacingBefore(10);

		ordertable.addCell(new Phrase("客户名称：", font));
		ordertable.addCell(new Phrase(order.getCustom().getCustomName(), font));

		ordertable.addCell(new Phrase("订单日期：", font));
		ordertable.addCell(sdf.format(order.getOrderDate()));

		ordertable.addCell(new Phrase("订单号：", font));
		ordertable.addCell(order.getOrderId());

		// ordertable.addCell(new Phrase("客户地址：", font));
		// ordertable.addCell(new Phrase(order.getCustom().getAddress(), font));
		//
		// ordertable.addCell(new Phrase("客户电话：", font));
		// ordertable.addCell(order.getCustom().getOwnerTel());

		doc.add(ordertable);

		doc.add(new Paragraph("产品列表：", font));

		PdfPTable table = new PdfPTable(5);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] { 1.0f, 2.0f, 2.0f, 2.0f, 2.0f });
		table.setSpacingBefore(10);

		// define table header cell
		PdfPCell cell = new PdfPCell();
		// cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		cell.setPadding(5);

		// write table header
		cell.setPhrase(new Phrase("序号", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("产品名称", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("单价", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("数量", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("总价", font));
		table.addCell(cell);

		// write table row data
		int i = 1;
		for (OrderItem item : listItems) {
			table.addCell(String.valueOf(i++));
			table.addCell(new Phrase(item.getProductId(), font));
			table.addCell(item.getUnit());
			table.addCell(String.valueOf(item.getQuantity()));
			table.addCell(String.valueOf(item.getUnitPrice()));
		}

		doc.add(table);

		Paragraph pa = new Paragraph("订单总额(元)：" + String.valueOf(order.getTotalMoney()), font);
		pa.setAlignment(Element.ALIGN_RIGHT);
		doc.add(pa);

		if (listBottles != null && listBottles.size() > 0) {
			// Add bottles table
			doc.add(new Paragraph("气瓶统计管理：", font));

			PdfPTable bottleTable = new PdfPTable(3);
			bottleTable.setWidthPercentage(100.0f);
			bottleTable.setWidths(new float[] { 1.0f, 1.0f, 1.0f });
			bottleTable.setSpacingBefore(10);

			// define table header cell
			PdfPCell hcell = new PdfPCell();
			// hcell.setBackgroundColor(BaseColor.LIGHT_GRAY);
			hcell.setPadding(5);

			// write table header
			hcell.setPhrase(new Phrase("序号", font));
			bottleTable.addCell(hcell);

			hcell.setPhrase(new Phrase("容器类别", font));
			bottleTable.addCell(hcell);

			hcell.setPhrase(new Phrase("数量", font));
			bottleTable.addCell(hcell);

			// write table row data
			int index = 1;
			for (DueBottle item : listBottles) {
				if (item.getQuantity() != 0) {
					bottleTable.addCell(String.valueOf(index++));
					bottleTable.addCell(new Phrase(item.getProductId(), font));
					bottleTable.addCell(String.valueOf(item.getQuantity()));
				}
			}

			doc.add(bottleTable);
		}

		doc.add(new Paragraph("备注：", font));

		doc.add(new Paragraph(order.getNote(), font));

		doc.add(new Paragraph("[白联]：存根    [粉联]：客户     [蓝联]：财务     [黄联]：充装台 ", font));

		// doc.addCreationDate();

	}

}
