package com.gms.backend.service.impl;

import java.util.Date;
import java.util.UUID;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gms.backend.mapper.AccountMapper;
import com.gms.backend.pojo.Administrator;
import com.gms.backend.service.AccountService;
import com.gms.utils.ContextUtil;
import com.mysql.fabric.xmlrpc.base.Data;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	private AccountMapper accountMapper;
	@Override
	public int login(String username, String password) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			return 0;
		}
		
		try {
			UsernamePasswordToken token = new UsernamePasswordToken(username, password);
			subject.login(token);
		} catch (Exception e) {
			return 1;
		}
		
		Administrator user = accountMapper.findLogin(username);
		if (user != null) {
			SecurityUtils.getSubject().getSession().setAttribute("staff_id", user.getId());
			SecurityUtils.getSubject().getSession().setAttribute("staff_name", user.getUsername());
		}
		return 0;
	}
	@Override
	public int changePassword(int id, String password) {
		Administrator user = new Administrator();
		ByteSource source = ByteSource.Util.bytes(password.getBytes());
		String salt = UUID.randomUUID().toString();
		SimpleHash simpleHash = new SimpleHash("MD5", source, salt);
		user.setId(id);
		user.setPassword(simpleHash.toHex());
		user.setSalt(salt);
		user.setEditby(1);
		user.setEditon(new Date());
		int rows = accountMapper.changePassword(user);
		return rows;
	}

}
