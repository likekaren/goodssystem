package cn.karen.ssm.mapper;

import cn.karen.ssm.po.Depot;
import cn.karen.ssm.po.DepotExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DepotMapper {
    int countByExample(DepotExample example);

    int deleteByExample(DepotExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Depot record);

    int insertSelective(Depot record);

    List<Depot> selectByExample(DepotExample example);

    int updateByExampleSelective(@Param("record") Depot record, @Param("example") DepotExample example);

    int updateByExample(@Param("record") Depot record, @Param("example") DepotExample example);
}