package com.gms.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gms.backend.service.AccountService;

@Controller
@RequestMapping("/Account/")
public class AccountController {
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "backend/login";
	}
	
	@RequestMapping(value = "dologin", method = RequestMethod.POST)
	@ResponseBody
	public Integer dologin(String username, String password) {
		int retCode = accountService.login(username, password);
		return retCode;
	}
	
	@RequestMapping("dologout")
	public String dologout() {
		return "redirect:login";
	}
}
