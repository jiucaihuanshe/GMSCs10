package com.gms.backend.service;

public interface AccountService {
	int login(String username, String password);

	int changePassword(int id, String password);
}
