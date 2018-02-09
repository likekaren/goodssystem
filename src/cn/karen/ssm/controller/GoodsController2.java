package cn.karen.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.karen.ssm.mapper.GoodsMapper;
import cn.karen.ssm.po.GoodsCustom;
import cn.karen.ssm.po.GoodsQueryVo;
import cn.karen.ssm.po.PageQuery;
import cn.karen.ssm.result.DataGridResultInfo;
import cn.karen.ssm.service.GoodsService;

import com.github.pagehelper.PageInfo;

/**
 * 
 * <p>
 * Title: GoodsController
 * </p>
 * <p>
 * Description:商品管理
 * </p>
 * <p>
 * Company: www.karen.com
 * </p>
 * 
 * @author 李轲
 * @date 
 * @version 1.0
 */
@Controller
//定义url的根路径，访问时根路径+方法的url
@RequestMapping("/goodssystem")
public class GoodsController2 {
	
	//注入service
	@Autowired
	private GoodsService goodsService;
	
	private GoodsMapper goodsMapper;

	@RequestMapping("/querygoods")
	public String querygoods() throws Exception {
		return "/goodsList2";
	}
	
	@RequestMapping("/querygoods_result")
	public @ResponseBody
	DataGridResultInfo querygoods_result(GoodsQueryVo goodsQueryVo,
			Integer rows, Integer page) throws Exception {
		// 非空校验
		goodsQueryVo = goodsQueryVo != null ? goodsQueryVo
				: new GoodsQueryVo();
		// 获取 goodsCustom
		GoodsCustom goodsCustom = goodsQueryVo.getGoodsCustom();
		// 非空 校验
		goodsCustom = goodsCustom != null ? goodsCustom
				: new GoodsCustom();
		//分页支持
		PageQuery pageQuery = new PageQuery(page, rows);
		goodsQueryVo.setPageQuery(pageQuery);
		// 分页查询，向sysuserQueryVo中传入pageQuery
		List<GoodsCustom> list = goodsService
				.findGoodsList(goodsQueryVo);
		PageInfo<GoodsCustom> pageInfo = new PageInfo<>(list);
		int total = (int) pageInfo.getTotal();
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		// 填充 total
		dataGridResultInfo.setTotal(total);
		// 填充 rows
		dataGridResultInfo.setRows(list);
		return dataGridResultInfo;
	}
	
	//方法返回 字符串，字符串就是逻辑视图名，Model作用是将数据填充到request域，在页面展示
	@RequestMapping(value="/editGoods",method={RequestMethod.GET})
	public String editGoods(Model model,Integer id)throws Exception{
		
		//调用 service查询商品信息
		GoodsCustom goodsCustom = goodsService.findGoodsById(id);
		
		model.addAttribute("goods", goodsCustom);
		
		
		//return "editItem_2";
		return "editGoods";
		
	}
	
	//方法返回void
//	@RequestMapping(value="/editItems",method={RequestMethod.GET})
//	public void editItems(
//			HttpServletRequest request,
//			HttpServletResponse response,
//			//@RequestParam(value = "item_id", required = false, defaultValue = "1") Integer id
//			Integer id
//			)
//			throws Exception {
//	
//		//调用 service查询商品信息
//		ItemsCustom itemsCustom = itemsService.findItemsById(id);
//		request.setAttribute("item", itemsCustom);
//		//注意如果使用request转向页面，这里指定页面的完整路径
//		request.getRequestDispatcher("/WEB-INF/jsp/editItem.jsp").forward(request, response);
//		
//	}
	
	//商品修改提交
	
	//itemsQueryVo是包装类型的pojo
	@RequestMapping("/editGoodsSubmit")
//	public String editItemSubmit(Integer id,ItemsCustom itemsCustom,
//			ItemsQueryVo itemsQueryVo)throws Exception{
	public String editGoodsSubmit(Integer id,GoodsCustom goodsCustom)throws Exception{
		
		//调用service接口更新商品信息
		goodsService.updateGoods(id, goodsCustom);
		//请求重定向
		return "redirect:queryGoods.action";
		//转发
//		return "forward:queryItems.action";
	}
	
	//自定义属性编辑器
//	@InitBinder
//	public void initBinder(WebDataBinder binder) throws Exception {
//		// Date.class必须是与controler方法形参pojo属性一致的date类型，这里是java.util.Date
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(
//				new SimpleDateFormat("yyyy-MM-dd HH-mm-ss"), true));
//	}
	// 添加商品信息
		
		@RequestMapping("/addgoods2")
		public String addGoods(Model model) throws Exception {
//			GoodsExample example = new GoodsExample();
//			GoodsExample.Criteria criteria = example.createCriteria();
//			List<Goods> gdList = goodsMapper.selectByExample(example);
//			model.addAttribute("gdList", gdList);
//			GoodsCustom goodsCustom = new GoodsCustom();
//			model.addAttribute("goods",goodsCustom);
			
			return "addgoods2";
		}

		// 添加提交
		@RequestMapping("/addgoodsSubmit")
		public String addGoodsSubmit(GoodsCustom goodsCustom)
				throws Exception {
			
			int id = goodsService.getMaxId()+1;
			goodsCustom.setId(id);
			//GoodsCustom custom = goodsQueryVo.getGoodsCustom();
				goodsService.insertGoods(goodsCustom);
				return "redirect:querygoods.action";

		}
	
		//商品删除
		@RequestMapping("/deleteGoods")
		public String deleteGoods(Integer id) throws Exception{
			
			goodsService.deleteGoods(id);
			
			return "redirect:queryGoods.action";
		}
		
		
}
