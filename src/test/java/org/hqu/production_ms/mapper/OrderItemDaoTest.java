package org.hqu.production_ms.mapper;

import static org.junit.Assert.assertEquals;

import java.math.BigDecimal;
import java.util.List;

import org.hqu.production_ms.domain.OrderItem;
import org.hqu.production_ms.domain.OrderItemExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/applicationContext-dao.xml","/spring/applicationContext-service.xml"})

public class OrderItemDaoTest {
	
	@Autowired
	private OrderItemMapper service;

	@Test
	public void test() {
		try {
			List<?> result = service.selectByByOrderId("123333");
			assertEquals(0, result.size());
//			OrderItemExample example = new OrderItemExample();
//			example.createCriteria().andOrderIdEqualTo("test");
//			service.deleteByExample(example);
//			OrderItem record = new OrderItem();
//			record.setOrderId("test");
//			record.setProductId("00005");
//			record.setQuantity(22);
//			record.setUnitPrice(new BigDecimal(10.0));
//			service.insert(record);
//			
//			result = service.selectByByOrderId("123333");
//			assertEquals(3, result.size());
//			result = service.selectByByOrderId("test");
//			assertEquals(1, result.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
