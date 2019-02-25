package org.hqu.production_ms.mapper;

import static org.junit.Assert.assertEquals;

import java.util.Calendar;
import java.util.List;

import org.hqu.production_ms.domain.COrderExample;
import org.hqu.production_ms.domain.COrderExample.Criteria;
import org.hqu.production_ms.domain.vo.CustomMetricsVO;
import org.hqu.production_ms.domain.vo.OrderMetricsVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/applicationContext-dao.xml","/spring/applicationContext-service.xml"})
public class COrderTest {

	@Autowired
	private COrderMapper mapper;
	
	@Autowired
	private CustomMapper customMapper;
	
	@Autowired
	private OrderItemMapper service;

	@Test
	public void test() {
		try {
			
//			customMapper.deleteByPrimaryKey("1");
//			Custom custom = new Custom();
//			custom.setCustomId("1");
//			custom.setAddress("test");
//			custom.setBalance(new BigDecimal(5000));
//			custom.setAddress("d");
//			custom.setCustomName("胡永");
//			custom.setDueBottle(50);
//			custom.setFullName("sldkfj");
//			custom.setOwnerTel("12354548");
//			custom.setEmail("huyong@14.com");
//			customMapper.insert(custom);
//			
//			mapper.deleteByPrimaryKey("00001");
//			
//			COrder order = new COrder();
//			
//			order.setCustomId("1");
//			order.setTotalMoney(new BigDecimal(2000));
//			order.setOrderDate(new Date());
//			order.setRequestDate(new Date());
//			order.setOrderId("00001");
//	
//			mapper.insert(order);
//			
//			List<?> result = mapper.searchOrderByOrderId("00001");
//			assertEquals(1, result.size());
//			
//			service.deleteByOrderId("00001");
//
//			OrderItem record = new OrderItem();
//			record.setOrderId("00001");
//			record.setProductId("00005");
//			record.setQuantity(22);
//			record.setUnit("瓶");
//			record.setUnitPrice(new BigDecimal(10.0));
//			service.insert(record);
//			
//			result = service.selectByByOrderId("00001");
//			assertEquals(1, result.size());
			
//			List<COrderVO> order1 = mapper.searchOrderByOrderIdDeep("00001");
//			for (COrderVO cOrderVO : order1) {
//				assertEquals(1,cOrderVO.getOrderList().size());
//				System.out.println(cOrderVO.getOrderList().get(0).toString());
//			}
//			

//			List<COrderVO> corder = mapper.searchOrderByOrderIdDeep("00001");
//			assertEquals(1, result.size());
//			assertEquals("胡永", corder.get(0).getCustom().getCustomName());
			COrderExample example1 = new COrderExample();
			Criteria criteria = example1.createCriteria();
			criteria.andCustomIdEqualTo("1");
			Calendar calendar = Calendar.getInstance();
			calendar.set(2018, 1, 1);
			criteria.andOrderDateBetween(calendar.getTime(), Calendar.getInstance().getTime());
			criteria.andStatusEqualTo(1);
			
			List<OrderMetricsVO> monthMetrics = mapper.getMonthMetrics(example1);
//			assertEquals(1, monthMetrics.size());
			for (OrderMetricsVO orderMetricsVO : monthMetrics) {
				System.out.println(orderMetricsVO.getMonthName() + " " + orderMetricsVO.getSumOfMoney());
			}
			
			COrderExample example2 = new COrderExample();
			Criteria criteria2 = example2.createCriteria();
			criteria2.andCustomIdEqualTo("1");
			Calendar calendar2 = Calendar.getInstance();
			calendar2.set(2018, 1, 1);
			criteria2.andOrderDateBetween(calendar2.getTime(), Calendar.getInstance().getTime());
			criteria2.andStatusEqualTo(1);
//			criteria.andOrderDateBetween(new Date(2018, 1, 1), new Date(2019, 1, 1));
			System.out.println(example2.toString());
			List<CustomMetricsVO> customMetrics = mapper.getMonthMetricsForCustomer(example2);
			
//			assertEquals(4, customMetrics.size());
			for (CustomMetricsVO orderMetricsVO : customMetrics) {
				System.out.println("customer id is 1, " + orderMetricsVO.getProductId() + " " + orderMetricsVO.getQuantity());
			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
