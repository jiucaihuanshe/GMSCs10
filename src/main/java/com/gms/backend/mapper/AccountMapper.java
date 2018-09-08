package com.gms.backend.mapper;

import com.gms.backend.pojo.Administrator;

public interface AccountMapper {

	Administrator findLogin(String username);

	void saveUser(Administrator user);

	int changePassword(Administrator user);

}
