package org.hqu.production_ms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hqu.production_ms.domain.DueBottle;
import org.hqu.production_ms.domain.OrderItem;
import org.hqu.production_ms.domain.vo.COrderVO;
import org.hqu.production_ms.service.DueBottleService;
import org.hqu.production_ms.service.OrderItemService;
import org.hqu.production_ms.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * A Spring controller that allows the users to download a PDF document
 * generated by the iText library.
 *
 * @author www.codejava.net
 *
 */
@Controller
public class PdfFileController {
	private static final Logger logger = LoggerFactory.getLogger(PdfFileController.class);

	@Autowired
	private OrderItemService orderItemService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private DueBottleService dueBottleService;
	/**
	 * Handle request to the default page
	 */
	// @RequestMapping(value = "/", method = RequestMethod.GET)
	// public String viewHome() {
	// return "home";
	// }
	//
	/**
	 * Handle request to download a PDF document
	 */
	@RequestMapping(value = "/order/downloadPDF/{ids}")
	public ModelAndView downloadPDF(@PathVariable String ids) {
		// create some sample data
//		logger.warn("download pdf for order: " + ids);
		Map<String, Object> model = new HashMap<>();
		List<OrderItem> listOrderItems = null;
		List<DueBottle> listBottles = null;
		COrderVO order = null;
		try {
			listOrderItems = orderItemService.getOrderItemsByOrderId(ids);
			order = orderService.searchOrderByOrderIdDeep(ids);
			listBottles = dueBottleService.getDueBottlesListByCustomID(order.getCustomId());
		} catch (Exception e) {
			logger.error("Failed to get orderitems for order: " + ids);
			e.printStackTrace();
		}

		if(listOrderItems!=null)
		model.put("listOrderItems", listOrderItems);
		if(order!=null)
		model.put("order", order);
		if(listBottles!=null)
		model.put("listBottles", listBottles);
			

		// return a view which will be resolved by an excel view resolver
		return new ModelAndView("pdfView", model);
	}
}
