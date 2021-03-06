package org.hqu.production_ms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hqu.production_ms.domain.COrder;
import org.hqu.production_ms.domain.COrderExample;
import org.hqu.production_ms.domain.vo.COrderVO;
import org.hqu.production_ms.domain.vo.CustomMetricsVO;
import org.hqu.production_ms.domain.vo.OrderMetricsVO;

public interface COrderMapper {
	
	//扩展的mapper接口方法
	List<COrderVO> find(COrder cOrder);
	
	List<OrderMetricsVO> getMonthMetrics(COrderExample example);
	
	List<CustomMetricsVO> getMonthMetricsForCustomer(COrderExample example);
	
	List<OrderMetricsVO> getYearMetrics(String customid);
	
	List<OrderMetricsVO> getCustomYearMetrics(String custom);


	//根据订单id查找订单信息
	List<COrderVO> searchOrderByOrderId(String orderId);
	
	List<COrderVO> searchOrderByOrderIdDeep(String orderId);
	
	List<COrderVO> searchOrderByCustomName(String customName);
	
	List<COrderVO> searchOrderByProductName(String productName);
	
	int deleteBatch(String[] ids);
	
	int changeStatus(String[] ids);
	
	int updateNote(COrder cOrder);
	
	//逆向工程生成的mapper接口
    int countByExample(COrderExample example);

    int deleteByExample(COrderExample example);

    int deleteByPrimaryKey(String orderId);

    int insert(COrder record);

    int insertSelective(COrder record);

    List<COrderVO> selectByExample(COrderExample example);

    COrderVO selectByPrimaryKey(String orderId);

    int updateByExampleSelective(@Param("record") COrder record, @Param("example") COrderExample example);

    int updateByExample(@Param("record") COrder record, @Param("example") COrderExample example);

    int updateByPrimaryKeySelective(COrder record);

    int updateByPrimaryKey(COrder cOrder);

    
    
}