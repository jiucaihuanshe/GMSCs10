package com.gms.backend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Admin/")
public class AdminController {
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("backend/main");
		return mView;
	}
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(){
		ModelAndView mView = new ModelAndView();
		mView.setViewName("backend/index");
		return mView;
	}
}
