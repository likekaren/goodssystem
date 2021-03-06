package cn.karen.ssm.mapper;

import java.util.List;






import cn.karen.ssm.po.GoodsCustom;
import cn.karen.ssm.po.GoodsQueryVo;

public interface GoodsMapperCustom {

	// 商品查询列表
		public List<GoodsCustom> findGoodsList(GoodsQueryVo goodsQueryVo)
				throws Exception;
		
	//获取最大的id
		public  Integer getMaxId() throws Exception;
	
		// 查询总条数
		public int findGoodsCount(GoodsQueryVo goodsQueryVo)
				throws Exception;
}
