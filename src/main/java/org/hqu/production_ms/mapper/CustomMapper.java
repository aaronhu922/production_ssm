package org.hqu.production_ms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hqu.production_ms.domain.Custom;
import org.hqu.production_ms.domain.CustomExample;
import org.hqu.production_ms.domain.vo.CustomMetricsVO;

public interface CustomMapper {	
	
	List<CustomMetricsVO> getDueBottlesForCustomer(String customid);
	
	//扩展的mapper接口方法
	int deleteBatch(String[] ids);
	
	int changeStatus(String[] ids);
	
	int updateNote(Custom record);
	
	int updateBalanceAndBottleCount(Custom record);
	
	List<Custom> searchCustomByCustomName(String customName);
	
	List<Custom> searchCustomByCustomId(String customId);
	
	//逆向工程生成的mapper接口
    int countByExample(CustomExample example);

    int deleteByExample(CustomExample example);

    int deleteByPrimaryKey(String customId);

    int insert(Custom record);

    int insertSelective(Custom record);

    List<Custom> selectByExample(CustomExample example);

    Custom selectByPrimaryKey(String customId);

    int updateByExampleSelective(@Param("record") Custom record, @Param("example") CustomExample example);

    int updateByExample(@Param("record") Custom record, @Param("example") CustomExample example);

    int updateByPrimaryKeySelective(Custom record);

    int updateByPrimaryKey(Custom record);
}