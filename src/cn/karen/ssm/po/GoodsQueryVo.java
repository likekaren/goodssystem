package cn.karen.ssm.po;


public class GoodsQueryVo {

	//商品信息
	private GoodsCustom goodsCustom;
	private PageQuery pageQuery;
	public GoodsCustom getGoodsCustom() {
		return goodsCustom;
	}

	public void setGoodsCustom(GoodsCustom goodsCustom) {
		this.goodsCustom = goodsCustom;
	}
	
	
	public PageQuery getPageQuery() {
		return pageQuery;
	}

	public void setPageQuery(PageQuery pageQuery) {
		this.pageQuery = pageQuery;
	}
}
