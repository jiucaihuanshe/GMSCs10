package com.gms.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gms.backend.pojo.Storehouse;
import com.gms.backend.service.StoreService;
import com.gms.backend.vo.Node;

@Controller
@RequestMapping("/Store/")
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value="listStorehouse",method=RequestMethod.GET)
	public ModelAndView listStore(){
		ModelAndView mView = new ModelAndView();
		List<Storehouse> stores = storeService.listAllStore();
		mView.addObject("stores", stores);
		mView.setViewName("backend/listStore");
		return mView;
	}
	
	@RequestMapping(value = "addEditStore", method = RequestMethod.GET)
	public ModelAndView addEditStore(Integer id){
		ModelAndView mView = new ModelAndView();
		Storehouse store = null;
		if(id == 0){
			store = new Storehouse();
		}else{
			store = storeService.findStore(id);
		}
		mView.addObject("store", store);
		mView.setViewName("backend/addEditStore");
		return mView;
	}
	
	@RequestMapping(value="doAddEditStore" ,method=RequestMethod.POST)
	@ResponseBody
	public String doAddEditStore(Storehouse store){
		if(store.getId()==0){
			storeService.saveStore(store);
		}else{
			storeService.updateStore(store);
		}
		return "ok";
	}
	
	@RequestMapping(value="deleteStore",method=RequestMethod.POST)
	@ResponseBody
	public String deleteStore(Integer id){
		storeService.deleteStore(id);
		return "";
	}
	
	@RequestMapping(value = "findStore", method = RequestMethod.POST)
	@ResponseBody
	public List<Storehouse> findStore(String name,String telephone){
		List<Storehouse> storeInfo = storeService.findNameAndTelephone(name,telephone);
		return storeInfo;
	}
	
	@RequestMapping(value="findTreeUI",method=RequestMethod.GET)
	@ResponseBody
	public List<Node> findTreeUI(){
		List<Node> node = storeService.findZtreeNode();
		return node;
	}
}
