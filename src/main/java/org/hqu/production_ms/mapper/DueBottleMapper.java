package org.hqu.production_ms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hqu.production_ms.domain.DueBottle;
import org.hqu.production_ms.domain.DueBottleExample;

public interface DueBottleMapper {
	
    long countByExample(DueBottleExample example);

    int deleteByExample(DueBottleExample example);

    int deleteByPrimaryKey(Long uid);

    int insert(DueBottle record);

    int insertSelective(DueBottle record);

    List<DueBottle> selectByExample(DueBottleExample example);    

    DueBottle selectByPrimaryKey(Long uid);

    int updateByExampleSelective(@Param("record") DueBottle record, @Param("example") DueBottleExample example);

    int updateByExample(@Param("record") DueBottle record, @Param("example") DueBottleExample example);

    int updateByPrimaryKeySelective(DueBottle record);

    int updateByPrimaryKey(DueBottle record);
    
    int getSumofQuanlityByCustomID(String customID);
}