package com.gms.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gms.backend.service.StockService;

@Controller
@RequestMapping("/Stock/")
public class StockController {

	@Autowired
	private StockService stockService;
	
	@RequestMapping(value="listMerchandise",method=RequestMethod.GET)
	public ModelAndView listMerchandise(){
		ModelAndView mView = new ModelAndView();
		mView.setViewName("backend/listMerchandise");
		return mView;
	}
	
	@RequestMapping(value="listIntoStock" ,method = RequestMethod.GET)
	public ModelAndView listIntoStock(){
		ModelAndView mView = new ModelAndView();
		mView.setViewName("backend/listIntoStock");
		return mView;
	}
}
