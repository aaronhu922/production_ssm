/**
 * 
 */
package org.hqu.production_ms.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.hqu.production_ms.domain.DueBottle;
import org.hqu.production_ms.domain.DueBottleExample;
import org.hqu.production_ms.service.DueBottleService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author aahu
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/spring/applicationContext-dao.xml", "/spring/applicationContext-service.xml" })
public class DueBottleMapperTest {

	@Autowired
	private DueBottleMapper dueBottleMapper;

	private long uid = 0;

	// @Autowired
	// private DueBottleService dueBottleService;

	@Before
	public void setUp() throws Exception {

		DueBottle db = new DueBottle();
		db.setCustomId("00001");
		db.setProductId("氧气瓶");
		db.setQuantity(10);

		dueBottleMapper.insert(db);
	}

	@Test
	public void test() throws Exception {
		// DueBottle db1 = dueBottleMapper.searchDueBottleByCustomAndProduct("00001",
		// "氧气瓶");
		// Custom custom = customMapper.selectByPrimaryKey("111112222233333");
		DueBottleExample dbex = new DueBottleExample();
		dbex.createCriteria().andCustomIdEqualTo("00001").andProductIdEqualTo("氧气瓶");

		List<DueBottle> list = dueBottleMapper.selectByExample(dbex);
		assertTrue(list.size() > 0);
		DueBottle db1 = list.get(0);
		uid = db1.getUid();
		assertEquals(10, db1.getQuantity(), 0);

	}
	
	@Test
	public void testNull() throws Exception {

		DueBottleExample dbex = new DueBottleExample();
		dbex.createCriteria().andCustomIdEqualTo("000011").andProductIdEqualTo("氧气瓶1");

		List<DueBottle> list = dueBottleMapper.selectByExample(dbex);
		assertFalse(list.size() > 0);
//		DueBottle db1 = list.get(0);		
//		assertNull(db1);
//		assertEquals(10, db1.getQuantity(), 0);

	}

	@After
	public void tearDown() throws Exception {
		dueBottleMapper.deleteByPrimaryKey(uid);
	}
}
