/**
 * 
 */
package org.hqu.production_ms.controller;

import org.hqu.production_ms.domain.customize.EUDataGridResult;
import org.hqu.production_ms.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author aahu
 *
 */

@Controller
@RequestMapping("/orderItem")
public class OrderItemController {
	
	@Autowired
	private OrderItemService orderItemService;
	
	//根据订单id查找
	@RequestMapping("/get_orderitems_by_orderId")
	@ResponseBody
	public EUDataGridResult searchOrderByOrderId(String searchValue) throws Exception{
		EUDataGridResult result = orderItemService.searchOrderItemByOrderId(searchValue);
		return result;
	}

}
