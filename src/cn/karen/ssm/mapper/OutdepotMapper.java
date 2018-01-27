package cn.karen.ssm.mapper;

import cn.karen.ssm.po.Outdepot;
import cn.karen.ssm.po.OutdepotExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OutdepotMapper {
    int countByExample(OutdepotExample example);

    int deleteByExample(OutdepotExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Outdepot record);

    int insertSelective(Outdepot record);

    List<Outdepot> selectByExample(OutdepotExample example);

    Outdepot selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Outdepot record, @Param("example") OutdepotExample example);

    int updateByExample(@Param("record") Outdepot record, @Param("example") OutdepotExample example);

    int updateByPrimaryKeySelective(Outdepot record);

    int updateByPrimaryKey(Outdepot record);
}