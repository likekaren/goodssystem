package cn.karen.ssm.service.impl;

import java.util.List;







import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;






import cn.karen.ssm.mapper.GoodsMapper;
import cn.karen.ssm.mapper.GoodsMapperCustom;
import cn.karen.ssm.po.Goods;
import cn.karen.ssm.po.GoodsCustom;
import cn.karen.ssm.po.GoodsQueryVo;
import cn.karen.ssm.service.GoodsService;

public class GoodsServiceImpl implements GoodsService {
	
	//注入mapper
	@Autowired
	private GoodsMapperCustom goodsMapperCustom;
	
	@Autowired
	private GoodsMapper goodsMapper;

	//商品查询列表
	@Override
	public List<GoodsCustom> findGoodsList(GoodsQueryVo goodsQueryVo)
			throws Exception {
		
		return goodsMapperCustom.findGoodsList(goodsQueryVo);
	}

	@Override
	public GoodsCustom findGoodsById(int id) throws Exception {
		
		Goods goods = goodsMapper.selectByPrimaryKey(id);
		//在这里随着需求的变量，需要查询商品的其它的相关信息，返回到controller
		
		GoodsCustom goodsCustom = new GoodsCustom();
		//将items的属性拷贝到itemsCustom
		BeanUtils.copyProperties(goods, goodsCustom);
		
		return goodsCustom;
	}

	@Override
	public void updateGoods(Integer id,GoodsCustom goodsCustom) throws Exception {
		//写业务代码
		
		//对于关键业务数据的非空校验
		if(id == null){
			//抛出异常，提示调用接口的用户，id不能为空
			//...
		}
		//itemsMapper.updateByPrimaryKey(itemsCustom);
		goodsMapper.updateByPrimaryKey(goodsCustom);
		
	}
	public void insertGoods(GoodsCustom goodsCustom) throws Exception {
		//写业务代码
		
		//对于关键业务数据的非空校验
	
		//itemsMapper.updateByPrimaryKey(itemsCustom);
		goodsMapper.insert(goodsCustom);
		
	}

	@Override
	public Integer getMaxId() throws Exception {
		// TODO Auto-generated method stub
		return goodsMapperCustom.getMaxId();
	}

	@Override
	public void deleteGoods(Integer id) {
		// TODO Auto-generated method stub
		goodsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<GoodsCustom> findGoodsResultList(GoodsCustom goodsCustom) {
		// TODO Auto-generated method stub
		try {
			return goodsMapperCustom.findGoodsResultList(goodsCustom);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


}
