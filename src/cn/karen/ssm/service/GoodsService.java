package cn.karen.ssm.service;

import java.util.List;







import cn.karen.ssm.po.GoodsCustom;
import cn.karen.ssm.po.GoodsQueryVo;


/**
 * 
 * <p>Title: goodsService</p>
 * <p>Description:商品service接口 </p>
 * <p>Company: www.itcast.com</p> 
 * @author	传智.燕青
 * @date	2015-3-20下午3:02:15
 * @version 1.0
 */
public interface GoodsService {
	
	//商品查询列表
	public List<GoodsCustom> findGoodsList(GoodsQueryVo goodsQueryVo)
			throws Exception;
	
	//根据商品id查询商品信息
	public GoodsCustom findGoodsById(int id) throws Exception;
	
	//更新商品信息
	/**
	 * 定义service接口，遵循单一职责，将业务参数细化 （不要使用包装类型，比如map）
	 * <p>Title: updategoods</p>
	 * <p>Description: </p>
	 * @param id 修改商品的id
	 * @param goodsCustom 修改商品的信息
	 * @throws Exception
	 */
	public void updateGoods(Integer id,GoodsCustom goodsCustom)throws Exception;

	
	
	//商品添加
	
	public void insertGoods(GoodsCustom goodsCustom) throws Exception;
	//获取最大的id
	public Integer getMaxId() throws Exception;

	//删除
	public void deleteGoods(Integer id);

	public List<GoodsCustom> findGoodsResultList(GoodsCustom goodsCustom);
}
