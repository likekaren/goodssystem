package cn.karen.ssm.controller;

import java.awt.print.Pageable;
import java.text.SimpleDateFormat;




import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;













import cn.karen.ssm.mapper.GoodsMapper;
import cn.karen.ssm.mapper.GoodsMapperCustom;
import cn.karen.ssm.po.Goods;
import cn.karen.ssm.po.GoodsCustom;
import cn.karen.ssm.po.GoodsExample;
import cn.karen.ssm.po.GoodsExample.Criterion;
import cn.karen.ssm.po.GoodsQueryVo;
import cn.karen.ssm.service.GoodsService;


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
@RequestMapping("/goods")
public class GoodsController {
	
	//注入service
	@Autowired
	private GoodsService goodsService;
	
	private GoodsMapper goodsMapper;

	@RequestMapping("/queryGoods")
	public ModelAndView queryGoods(HttpServletRequest request) throws Exception {
		
		System.out.println(request.getParameter("id"));
	
		//调用service查询商品列表
		List<GoodsCustom> goodsList = goodsService.findGoodsList(null);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("goodsList", goodsList);
		// 指定逻辑视图名
		modelAndView.setViewName("goodsList");

		return modelAndView;
	}
	
	//商品修改页面显示
	//使用method=RequestMethod.GET限制使用get方法
//	@RequestMapping(value="/editItems",method={RequestMethod.GET})
//	public ModelAndView editItems()throws Exception{
//		
//		ModelAndView modelAndView = new ModelAndView();
//		
//		//调用 service查询商品信息
//		ItemsCustom itemsCustom = itemsService.findItemsById(1);
//		//将模型数据传到jsp
//		modelAndView.addObject("item", itemsCustom);
//		//指定逻辑视图名
//		modelAndView.setViewName("editItem");
//		
//		return modelAndView;
//		
//	}
	
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
		@RequestMapping(value="/addGoods",method={RequestMethod.GET})
	
		public String addGoods(Model model) throws Exception {
//			GoodsExample example = new GoodsExample();
//			GoodsExample.Criteria criteria = example.createCriteria();
//			List<Goods> gdList = goodsMapper.selectByExample(example);
//			model.addAttribute("gdList", gdList);
//			GoodsCustom goodsCustom = new GoodsCustom();
//			model.addAttribute("goods",goodsCustom);
			
			return "addGoods";
		}

		// 添加提交
		@RequestMapping("/addGoodsSubmit")
		public String addGoodsSubmit(GoodsCustom goodsCustom)
				throws Exception {
			
			int id = goodsService.getMaxId()+1;
			goodsCustom.setId(id);
			//GoodsCustom custom = goodsQueryVo.getGoodsCustom();
				goodsService.insertGoods(goodsCustom);
				return "redirect:queryGoods.action";

		}
	
		//商品删除
		@RequestMapping("/deleteGoods")
		public String deleteGoods(Integer id) throws Exception{
			
			goodsService.deleteGoods(id);
			
			return "redirect:queryGoods.action";
		}
		//商品条件查询
		@RequestMapping(value="/tjqueryGoods",method={RequestMethod.POST})
		public String tjqueryGoods(Model model,GoodsCustom goodsCustom)throws Exception{
			if(goodsCustom.getGoodsname()!= null|| goodsCustom.getUserid()!= null || goodsCustom.getDepotid()!=null
					|| goodsCustom.getAreaid()!= null || goodsCustom.getZoneid()!=null){
				//List<GoodsCustom>resultList = goodsService.findGoodsResultList(goodsCustom);
				
//				ModelAndView modelAndView = new ModelAndView();
//				modelAndView.addObject("goodsList", resultList);
				
				
				
				/*model.addAttribute("goodsList", resultList);
				
				//回显
				
				model.addAttribute("goods",goodsCustom);*/
				

				
				
			}
			
			return "goodsList";
			
		}
		
}
