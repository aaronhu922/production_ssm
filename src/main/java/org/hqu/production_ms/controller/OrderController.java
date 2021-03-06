package org.hqu.production_ms.controller;

import java.time.LocalDate;
import java.util.List;

import javax.validation.Valid;

import org.hqu.production_ms.domain.COrder;
import org.hqu.production_ms.domain.Custom;
import org.hqu.production_ms.domain.DueBottle;
import org.hqu.production_ms.domain.OrderItem;
import org.hqu.production_ms.domain.OrderMetricForm;
import org.hqu.production_ms.domain.Product;
import org.hqu.production_ms.domain.customize.CustomResult;
import org.hqu.production_ms.domain.customize.EUDataGridResult;
import org.hqu.production_ms.domain.vo.COrderVO;
import org.hqu.production_ms.service.CustomService;
import org.hqu.production_ms.service.DueBottleService;
import org.hqu.production_ms.service.OrderItemService;
import org.hqu.production_ms.service.OrderService;
import org.hqu.production_ms.service.ProductService;
import org.hqu.production_ms.util.IDUtils;
import org.hqu.production_ms.util.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private OrderService orderService;

	@Autowired
	private ProductService productService;

	@Autowired
	private CustomService customService;

	@Autowired
	private OrderItemService orderItemService;

	@Autowired
	private DueBottleService dueBottleService;

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

	@RequestMapping("/metric")
	public String getMetrics() throws Exception {
		return "order_metric";
	}

	@RequestMapping(value = "/monthmetrics", method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult getMetricsByMonth( @Valid OrderMetricForm orderMetricForm, BindingResult bindingResult) throws Exception {
			// logger.info("year is " + year);
		EUDataGridResult result = orderService.getMonthMetrics(orderMetricForm.getCustomId(),
				orderMetricForm.getStartDate(), orderMetricForm.getEndDate());
		return result;
	}

	@RequestMapping(value = "/custom_order_metrics", method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult getCustomMetricsByMonth( @Valid OrderMetricForm orderMetricForm, BindingResult bindingResult)
			throws Exception {

		// logger.info("form params: " + orderMetricForm.getCustomId() +
		// orderMetricForm.getStartDate()
		// + orderMetricForm.getEndDate());
		EUDataGridResult result = orderService.getMonthMetricsForCustomer(orderMetricForm.getCustomId(),
				orderMetricForm.getStartDate(), orderMetricForm.getEndDate());
		return result;
	}

	@RequestMapping(value = "/custom_yearmetrics")
	@ResponseBody
	public EUDataGridResult getCustomMetricsByYear(Integer page, Integer rows, String custom) throws Exception {

		EUDataGridResult result = orderService.getYearMetricsForCustomer(page, rows, custom);
		return result;
	}

	@RequestMapping("/yearmetrics")
	@ResponseBody
	public EUDataGridResult getMetricsByYear(Integer page, Integer rows, String customId) throws Exception {
		EUDataGridResult result = orderService.getYearMetrics(page, rows, customId);
		return result;
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
		cOrder.setOrderId(IDUtils.genOrderId());
		if (orderService.get(cOrder.getOrderId()) != null) {
			result = new CustomResult(0, "该订单编号已经存在，请更换订单编号！", null);
		} else {
			result = orderService.insert(cOrder);
		}
		if (result.getStatus() == 200) {
			// continue to insert orderlist

			List<OrderItem> orderItems = JsonUtils.getOrderItems(cOrder.getOrderList());
			for (OrderItem orderItem : orderItems) {
				orderItem.setOrderId(cOrder.getOrderId());
				result = orderItemService.insert(orderItem);
				if (result.getStatus() != 200) {
					logger.warn("产品列表存储错误，需要删除订单。");
					result = new CustomResult(1, "产品列表存储错误，需要删除订单!", null);
					return result;
				}

				Product prodoct = productService.getProductByProductName(orderItem.getProductId());
				if (prodoct != null && prodoct.getProductType().equals("3")) {
					DueBottle db = dueBottleService.searchDueBottleByCustomAndProduct(cOrder.getCustomId(),
							orderItem.getProductId());
					if (db == null) {
						DueBottle bottleCount = new DueBottle();
						bottleCount.setCustomId(cOrder.getCustomId());
						bottleCount.setProductId(orderItem.getProductId());
						bottleCount.setQuantity(0 - orderItem.getQuantity());
						dueBottleService.insert(bottleCount);
						logger.warn("客户  " + cOrder.getCustomId() + " 现欠  " + orderItem.getProductId()
								+ -orderItem.getQuantity() + "个");
					} else {
						int curr = db.getQuantity();
						db.setQuantity(curr - orderItem.getQuantity());
						dueBottleService.update(db);
						logger.warn("更新欠瓶数， 客户  " + cOrder.getCustomId() + "原欠  " + orderItem.getProductId() + curr
								+ " 个， 现欠瓶数为" + (curr - orderItem.getQuantity()));

					}
				}
			}

			// 获取客户总欠瓶数
			int countofBottle = 0;
			try {
				countofBottle = dueBottleService.getDueBottlesCountByCustomID(cOrder.getCustomId());
				logger.warn("客户  " + cOrder.getCustomId() + " 现欠瓶总数为  " + countofBottle + "个");
			} catch (Exception e) {
				logger.warn("No record of due bottles for Customer " + cOrder.getCustomId() + ", 欠瓶数为 0.");
				e.printStackTrace();
			}
			Custom custom = customService.get(cOrder.getCustomId());
			custom.setDueBottle(countofBottle);
			switch (cOrder.getPaymentType()) {
			case 2:
			case 3: {
				logger.warn("Customer " + custom.getCustomName() + " 本订单之前余额：  " + custom.getBalance() + ", 本订单金额： "
						+ cOrder.getTotalMoney());
				custom.setBalance(custom.getBalance().subtract(cOrder.getTotalMoney()));
				customService.updateBalanceAndBottleCount(custom);
				logger.warn("Customer " + custom.getCustomName() + " 现在余额：  " + custom.getBalance());
				break;
			}

			default:
				logger.warn("This order is paid by cash, total money is " + cOrder.getTotalMoney());
				customService.updateBalanceAndBottleCount(custom);
				break;
			}

		}

		return result;
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
