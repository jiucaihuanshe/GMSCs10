package com.gms.backend.controller;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gms.utils.ContextUtil;

@Controller
@RequestMapping("/Admin/")
public class AdminController {
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mView = new ModelAndView();
		mView.addObject("staff_name", SecurityUtils.getSubject().getSession().getAttribute("staff_name"));
		mView.addObject("staff_id", SecurityUtils.getSubject().getSession().getAttribute("staff_id"));
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
