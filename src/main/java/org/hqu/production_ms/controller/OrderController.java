package org.hqu.production_ms.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.hqu.production_ms.domain.COrder;
import org.hqu.production_ms.domain.OrderItem;
import org.hqu.production_ms.domain.customize.CustomResult;
import org.hqu.production_ms.domain.customize.EUDataGridResult;
import org.hqu.production_ms.domain.vo.COrderVO;
import org.hqu.production_ms.service.OrderItemService;
import org.hqu.production_ms.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	

	@Autowired
	private OrderItemService orderItemService;

	@RequestMapping("/get/{orderId}")
	@ResponseBody
	public COrderVO getItemById(@PathVariable String orderId) throws Exception {
		COrderVO cOrder = orderService.get(orderId);
		return cOrder;
	}

	@RequestMapping("/get_data")
	@ResponseBody
	public List<COrderVO> getData() throws Exception {
		List<COrderVO> list = orderService.find();
		return list;
	}

	@RequestMapping("/find")
	public String find() throws Exception {
		return "order_list";
	}

	@RequestMapping("/add")
	public String add() throws Exception {
		return "order_add";
	}

	@RequestMapping("/edit")
	public String edit() throws Exception {
		return "order_edit";
	}

	@RequestMapping("/list")
	@ResponseBody
	public EUDataGridResult getList(Integer page, Integer rows, COrder cOrder) throws Exception {
		EUDataGridResult result = orderService.getList(page, rows, cOrder);
		return result;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	private CustomResult insert(@Valid COrder cOrder, BindingResult bindingResult) throws Exception {
		CustomResult result;
		if (bindingResult.hasErrors()) {
			FieldError fieldError = bindingResult.getFieldError();
			System.out.println(fieldError.getDefaultMessage());
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		if (orderService.get(cOrder.getOrderId()) != null) {
			result = new CustomResult(0, "该订单编号已经存在，请更换订单编号！", null);
		} else {
			result = orderService.insert(cOrder);
		}
		if (result.getStatus() == 200) {
			// continue to insert orderlist
			
			List<OrderItem> orderItems = getOrderItems(cOrder.getOrderList());
			for (OrderItem orderItem : orderItems) {
				orderItem.setOrderId(cOrder.getOrderId());
				result = orderItemService.insert(orderItem);
				if(result.getStatus()!=200) break;
			}
		}
		
		return result;
	}

	protected List<OrderItem> getOrderItems(String orderList) {
		// TODO Auto-generated method stub
		String[] items = orderList.split(",");
		int length = items.length;
		List<OrderItem> productsList = new ArrayList<>();
		OrderItem item = null;
		for (int i = 0; i < length; i++) {			
			if (i % 4 == 0) {
				item = new OrderItem();
				item.setProductId(items[i]);				
			} else if (i % 4 == 1) {
				item.setUnit(items[i]);
			} else if (i % 4 == 2) {
				item.setQuantity(Integer.parseInt(items[i]));
			} else {
				item.setUnitPrice(new BigDecimal(items[i]));
				productsList.add(item);
			}
		}

		return productsList;
	}

	@RequestMapping(value = "/update")
	@ResponseBody
	private CustomResult update(@Valid COrder cOrder, BindingResult bindingResult) throws Exception {
		if (bindingResult.hasErrors()) {
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		return orderService.update(cOrder);
	}

	@RequestMapping(value = "/update_all")
	@ResponseBody
	private CustomResult updateAll(@Valid COrder cOrder, BindingResult bindingResult) throws Exception {
		if (bindingResult.hasErrors()) {
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		return orderService.updateAll(cOrder);
	}

	@RequestMapping(value = "/update_note")
	@ResponseBody
	private CustomResult updateNote(@Valid COrder cOrder, BindingResult bindingResult) throws Exception {
		if (bindingResult.hasErrors()) {
			FieldError fieldError = bindingResult.getFieldError();
			return CustomResult.build(100, fieldError.getDefaultMessage());
		}
		return orderService.updateNote(cOrder);
	}

	@RequestMapping(value = "/delete")
	@ResponseBody
	private CustomResult delete(String id) throws Exception {
		CustomResult result = orderService.delete(id);
		return result;
	}

	@RequestMapping(value = "/delete_batch")
	@ResponseBody
	private CustomResult deleteBatch(String[] ids) throws Exception {
		CustomResult result = orderService.deleteBatch(ids);
		return result;
	}

	@RequestMapping(value = "/change_status")
	@ResponseBody
	public CustomResult changeStatus(String[] ids) throws Exception {
		CustomResult result = orderService.changeStatus(ids);
		return result;
	}

	// 根据订单id查找
	@RequestMapping("/search_order_by_orderId")
	@ResponseBody
	public EUDataGridResult searchOrderByOrderId(Integer page, Integer rows, String searchValue) throws Exception {
		EUDataGridResult result = orderService.searchOrderByOrderId(page, rows, searchValue);
		return result;
	}

	// 根据客户名称查找
	@RequestMapping("/search_order_by_orderCustom")
	@ResponseBody
	public EUDataGridResult searchOrderByOrderCustom(Integer page, Integer rows, String searchValue) throws Exception {
		EUDataGridResult result = orderService.searchOrderByCustomName(page, rows, searchValue);
		return result;
	}

	// 根据产品名称查找
	@RequestMapping("/search_order_by_orderProduct")
	@ResponseBody
	public EUDataGridResult searchOrderByProductName(Integer page, Integer rows, String searchValue) throws Exception {
		EUDataGridResult result = orderService.searchOrderByProductName(page, rows, searchValue);
		return result;
	}
}
