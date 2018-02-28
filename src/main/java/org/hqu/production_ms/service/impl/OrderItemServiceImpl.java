package org.hqu.production_ms.service.impl;

import java.util.List;

import org.hqu.production_ms.domain.OrderItem;
import org.hqu.production_ms.domain.customize.CustomResult;
import org.hqu.production_ms.domain.customize.EUDataGridResult;
import org.hqu.production_ms.mapper.OrderItemMapper;
import org.hqu.production_ms.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class OrderItemServiceImpl implements OrderItemService {
	
	@Autowired
	OrderItemMapper orderItemMapper;

	@Override
	public CustomResult insert(OrderItem orderItem) throws Exception {
		int i = orderItemMapper.insert(orderItem);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "新增订单和产品失败，请检查重新生成订单！");
		}
	}

	@Override
	public CustomResult update(OrderItem orderItem) throws Exception {
		int i = orderItemMapper.updateByPrimaryKeySelective(orderItem);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "修改订单产品失败");
		}
	}

	@Override
	public CustomResult updateAll(OrderItem orderItem) throws Exception {
		int i = orderItemMapper.updateByPrimaryKey(orderItem);
		if(i>0){
			return CustomResult.ok();
		}else{
			return CustomResult.build(101, "修改订单产品失败");
		}
	}

	@Override
	public EUDataGridResult searchOrderItemByOrderId(String orderId) throws Exception {
		//分页处理
//		PageHelper.startPage(0, 999);
		List<OrderItem> list = orderItemMapper.selectByByOrderId(orderId);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
//		PageInfo<OrderItem> pageInfo = new PageInfo<>(list);
		result.setTotal(list.size());
		return result;
	}
	
	@Override
	public List<OrderItem> getOrderItemsByOrderId(String orderId) throws Exception {
		List<OrderItem> list = orderItemMapper.selectByByOrderId(orderId);
		return list;
	}

}
