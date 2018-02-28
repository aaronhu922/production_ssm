package org.hqu.production_ms.service;

import java.util.List;

import org.hqu.production_ms.domain.OrderItem;
import org.hqu.production_ms.domain.customize.CustomResult;
import org.hqu.production_ms.domain.customize.EUDataGridResult;

public interface OrderItemService {
	
	CustomResult insert(OrderItem orderItem) throws Exception;

	//更新部分字段，用的是updateSelective判断非空的字段进行更新
    CustomResult update(OrderItem orderItem) throws Exception;
    
    //更新全部字段，不判断非空，直接进行更新
    CustomResult updateAll(OrderItem orderItem) throws Exception;    


    //根据订单id查找订单详细信息
    EUDataGridResult searchOrderItemByOrderId(String orderId) throws Exception;

	List<OrderItem> getOrderItemsByOrderId(String orderId) throws Exception;

}
