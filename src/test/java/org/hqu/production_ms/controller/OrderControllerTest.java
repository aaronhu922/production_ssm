package org.hqu.production_ms.controller;

import static org.junit.Assert.assertEquals;

import java.math.BigDecimal;
import java.util.List;

import org.hqu.production_ms.domain.OrderItem;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/applicationContext-dao.xml","/spring/applicationContext-service.xml"})
public class OrderControllerTest {

	
	OrderController oc = new OrderController();
	@Test
	public void test() {
		String s = "test,12,2,24";
		List<OrderItem> items = oc.getOrderItems(s);
		assertEquals(1, items.size());	
		assertEquals("test", items.get(0).getProductId());
		assertEquals(new BigDecimal(24), items.get(0).getUnitPrice());

	}

}
