package com.gms.backend.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gms.backend.mapper.AccountMapper;
import com.gms.backend.pojo.Administrator;
import com.gms.backend.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	private AccountMapper accountMapper;
	@Override
	public int login(String username, String password) {
		Administrator user = accountMapper.findLogin(username);
		return 0;
	}

}
