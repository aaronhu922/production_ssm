/**
 * 
 */
package org.hqu.production_ms.service;

import org.hqu.production_ms.domain.DueBottle;
import org.hqu.production_ms.domain.customize.CustomResult;
import org.hqu.production_ms.domain.customize.EUDataGridResult;

/**
 * @author aahu
 *
 */
public interface DueBottleService {
	

	
	CustomResult insert(DueBottle dueBottles) throws Exception;

	//更新部分字段，用的是updateSelective判断非空的字段进行更新
    CustomResult update(DueBottle dueBottles) throws Exception;
    
    //更新全部字段，不判断非空，直接进行更新
    CustomResult updateAll(DueBottle dueBottles) throws Exception;    


    //根据客户信息和产品查找对应的欠瓶记录
    DueBottle searchDueBottleByCustomAndProduct(String customID, String productName) throws Exception;

	int getDueBottlesCountByCustomID(String customID);    
    
	EUDataGridResult getDueBottlesByCustomID(String customID) throws Exception;
}
