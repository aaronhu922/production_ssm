/**
 * 
 */
package org.hqu.production_ms.service.impl;

import java.util.List;

import org.hqu.production_ms.domain.DueBottle;
import org.hqu.production_ms.domain.DueBottleExample;
import org.hqu.production_ms.domain.customize.CustomResult;
import org.hqu.production_ms.domain.customize.EUDataGridResult;
import org.hqu.production_ms.mapper.DueBottleMapper;
import org.hqu.production_ms.service.DueBottleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author aahu
 *
 */
@Service
public class DueBottleServiceImpl implements DueBottleService {

	@Autowired
	private DueBottleMapper duebottleMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.hqu.production_ms.service.DueBottleService#insert(org.hqu.production_ms.
	 * domain.DueBottle)
	 */
	@Override
	public CustomResult insert(DueBottle dueBottles) throws Exception {
		int r = duebottleMapper.insert(dueBottles);
		if (r > 0) {
			return CustomResult.ok();
		} else {
			return CustomResult.build(101, "新增客户欠瓶数失败");
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.hqu.production_ms.service.DueBottleService#update(org.hqu.production_ms.
	 * domain.DueBottle)
	 */
	@Override
	public CustomResult update(DueBottle dueBottles) throws Exception {
		int r = duebottleMapper.updateByPrimaryKeySelective(dueBottles);
		if (r > 0) {
			return CustomResult.ok();
		} else {
			return CustomResult.build(101, "更新客户欠瓶数失败");
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.hqu.production_ms.service.DueBottleService#updateAll(org.hqu.
	 * production_ms.domain.DueBottle)
	 */
	@Override
	public CustomResult updateAll(DueBottle dueBottles) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.hqu.production_ms.service.DueBottleService#
	 * searchDueBottleByCustomAndProduct(java.lang.String, java.lang.String)
	 */
	@Override
	public DueBottle searchDueBottleByCustomAndProduct(String customID, String productName) throws Exception {
		// TODO Auto-generated method stub
		DueBottleExample dbex = new DueBottleExample();
		dbex.createCriteria().andCustomIdEqualTo(customID).andProductIdEqualTo(productName);

		List<DueBottle> list = duebottleMapper.selectByExample(dbex);
		if (list.isEmpty()) {
			return null;
		} else {
			return list.get(0);
		}
	}

	@Override
	public EUDataGridResult getDueBottlesByCustomID(String customID) throws Exception {

		DueBottleExample dbex = new DueBottleExample();
		dbex.createCriteria().andCustomIdEqualTo(customID);
		List<DueBottle> list = duebottleMapper.selectByExample(dbex);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		// PageInfo<OrderItem> pageInfo = new PageInfo<>(list);
		result.setTotal(list.size());
		return result;
	}
	
	@Override
	public List<DueBottle> getDueBottlesListByCustomID(String customID) throws Exception {

		DueBottleExample dbex = new DueBottleExample();
		dbex.createCriteria().andCustomIdEqualTo(customID);
		List<DueBottle> list = duebottleMapper.selectByExample(dbex);

		return list;
	}

	@Override
	public int getDueBottlesCountByCustomID(String customID) throws Exception {
		// TODO Auto-generated method stub

		int count = duebottleMapper.getSumofQuanlityByCustomID(customID);
		return count;
	}

}
