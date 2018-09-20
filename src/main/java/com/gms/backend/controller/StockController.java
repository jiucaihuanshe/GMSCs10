package com.gms.backend.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gms.backend.pojo.MerchandiseType;
import com.gms.backend.service.StockService;
import com.gms.backend.vo.JsonResult;
import com.gms.backend.vo.MerchInfo;
import com.gms.backend.vo.TypeInfo;

@Controller
@RequestMapping("/Stock/")
public class StockController {

	@Autowired
	private StockService stockService;
	
	@RequestMapping(value="listMerchandise",method=RequestMethod.GET)
	public ModelAndView listMerchandise(){
		ModelAndView mView = new ModelAndView();
		List<MerchInfo> mList = stockService.findAllStock();
		mView.addObject("merchs", mList);
		mView.setViewName("backend/listMerchandise");
		return mView;
	}
	
	@RequestMapping(value="listIntoStock" ,method = RequestMethod.GET)
	public ModelAndView listIntoStock(){
		ModelAndView mView = new ModelAndView();
		List<MerchInfo> mList = stockService.findAllStock();
		mView.addObject("merchs", mList);
		mView.setViewName("backend/listIntoStock");
		return mView;
	}
	
	@RequestMapping(value="addEditMerch",method=RequestMethod.GET)
	public ModelAndView addEditMerch(int id){
		ModelAndView mView = new ModelAndView();
		MerchInfo merchInfo =null;
		if(id==0){
			merchInfo = new MerchInfo();
		}else{
			merchInfo = stockService.findMerchId(id);
		}
		mView.addObject("merch", merchInfo);
		mView.setViewName("backend/addEditMerch");
		return mView;
	}
	
	@RequestMapping(value="doAddEditMerch",method=RequestMethod.POST)
	@ResponseBody
	public String doAddEditMerch(MerchInfo merchInfo){
		if(merchInfo.getId()==0){
			stockService.saveMerch(merchInfo);
		}else{
			stockService.updateMerch(merchInfo);
		}
		return "ok";
	}
	
	@RequestMapping(value="findType",method=RequestMethod.GET)
	@ResponseBody
	public JsonResult findType(){
		List<Map<String, Object>> tType = stockService.findType();
		return new JsonResult(1, "ok", tType);
	}
	
	@RequestMapping(value="findTreeUI",method=RequestMethod.GET)
	@ResponseBody
	public List<TypeInfo> findTreeUI(){
		List<TypeInfo> mTypes = stockService.findTreeUI();
		return mTypes;
	}
	
	@RequestMapping(value="addEditStock",method=RequestMethod.GET)
	public ModelAndView addEditStock(int id){
		ModelAndView mView = new ModelAndView();
		TypeInfo typeInfo =null;
		if(id==0){
			typeInfo = new TypeInfo();
		}else{
			typeInfo = stockService.findTypeId(id);
		}
		mView.addObject("type", typeInfo);
		mView.setViewName("backend/merchandiseType");
		return mView;
	}
	
	@RequestMapping(value="doAddEditType",method=RequestMethod.POST)
	@ResponseBody
	public String doAddEditType(MerchandiseType mType){
		if(mType.getId()==0){
			stockService.saveType(mType);
		}else{
			stockService.updateType(mType);
		}
		return "ok";
	}
	
	@RequestMapping(value="findTypeCount",method=RequestMethod.GET)
	@ResponseBody
	public int findTypeCount(int id){
		boolean isCount = stockService.findTypeCount(id);
		if (isCount) {
			return 1;
		} else {
			return 0;
		}
	}
	
	@RequestMapping(value="deleteType",method=RequestMethod.GET)
	@ResponseBody
	public String deleteType(int id){
		stockService.deleteType(id);
		return "ok";
	}
	
	@RequestMapping(value="findMerchUI",method=RequestMethod.GET)
	@ResponseBody
	public List<TypeInfo> findMerchUI(){
		List<TypeInfo> typeInfos = stockService.findMerchUI();
		return typeInfos;
	}
	
	@RequestMapping(value="deleteStock",method=RequestMethod.POST)
	@ResponseBody
	public String deleteStock(int id){
		stockService.deleteStock(id);
		return "ok";
	}
	
	@RequestMapping(value="findStock",method=RequestMethod.POST)
	@ResponseBody
	public List<MerchInfo> findStock(String barCode,String tradeName){
		List<MerchInfo> mList = stockService.findStock(barCode,tradeName);
		return mList;
	}
}
