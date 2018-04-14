package org.hqu.production_ms.mapper;

import static org.junit.Assert.assertEquals;

import java.util.Date;
import java.util.List;

import org.hqu.production_ms.domain.COrderExample;
import org.hqu.production_ms.domain.COrderExample.Criteria;
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
			
			List<OrderMetricsVO> monthMetrics = mapper.getMonthMetrics(2018);
			assertEquals(3, monthMetrics.size());
			for (OrderMetricsVO orderMetricsVO : monthMetrics) {
				System.out.println(orderMetricsVO.getMonthName() + " " + orderMetricsVO.getSumOfMoney());
			}
			
			COrderExample example = new COrderExample();
			Criteria criteria = example.createCriteria();
			criteria.andCustomIdEqualTo("1");
			example.addStringCondition(criteria, "year(order_date)=year(curdate())");
//			criteria.andOrderDateBetween(new Date(2018, 1, 1), new Date(2019, 1, 1));
			System.out.println(example.toString());
			monthMetrics = mapper.getMonthMetricsForCustomer(example);
			
			assertEquals(1, monthMetrics.size());
			for (OrderMetricsVO orderMetricsVO : monthMetrics) {
				System.out.println("customer id is 1, " + orderMetricsVO.getMonthName() + " " + orderMetricsVO.getSumOfMoney());
			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
