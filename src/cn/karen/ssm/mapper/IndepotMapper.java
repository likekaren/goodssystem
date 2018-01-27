package cn.karen.ssm.mapper;

import cn.karen.ssm.po.Indepot;
import cn.karen.ssm.po.IndepotExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface IndepotMapper {
    int countByExample(IndepotExample example);

    int deleteByExample(IndepotExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Indepot record);

    int insertSelective(Indepot record);

    List<Indepot> selectByExample(IndepotExample example);

    Indepot selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Indepot record, @Param("example") IndepotExample example);

    int updateByExample(@Param("record") Indepot record, @Param("example") IndepotExample example);

    int updateByPrimaryKeySelective(Indepot record);

    int updateByPrimaryKey(Indepot record);
}