package com.gms.backend.service;

import java.util.List;

import com.gms.backend.pojo.Employee;

public interface StaffService {

	List<Employee> findAllStaff();

	Employee findStaff(int id);

	int saveStaff(Employee staff);

	int updateStaff(Employee staff);

	void deleteStaff(Integer id);

	List<Employee> findNameAndTelephone(String name, String telephone);
}
