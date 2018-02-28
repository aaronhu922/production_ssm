package org.hqu.production_ms.mapper;

import static org.junit.Assert.*;

import java.math.BigDecimal;

import org.hqu.production_ms.domain.Custom;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/applicationContext-dao.xml","/spring/applicationContext-service.xml"})
public class CustomMapperTest {
	
	@Autowired
	private CustomMapper customMapper;

	@Before
	public void setUp() throws Exception {
		
		Custom custom = new Custom();
		custom.setCustomId("111112222233333");
		custom.setAddress("test");
		custom.setBalance(new BigDecimal(5000));
		custom.setAddress("d");
		custom.setCustomName("胡永");
		custom.setDueBottle(50);
		custom.setFullName("sldkfj");
		custom.setOwnerTel("12354548");
		custom.setEmail("huyong@14.com");
		customMapper.insert(custom);
	}

	@After
	public void tearDown() throws Exception {
		customMapper.deleteByPrimaryKey("111112222233333");
	}

	@Test
	public void test() {
		Custom custom = customMapper.selectByPrimaryKey("111112222233333");
		assertEquals(5000, custom.getBalance().doubleValue(),0.0);

		custom.setBalance(custom.getBalance().add(new BigDecimal(50.5)));
		customMapper.updateBalanceAndBottleCount(custom);
		
		Custom custom2 = customMapper.selectByPrimaryKey("111112222233333");
		System.out.println( custom2.getBalance().toString());
		assertEquals(5050.5, custom2.getBalance().doubleValue(),0.0);
	}

}
