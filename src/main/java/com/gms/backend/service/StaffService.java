package com.gms.backend.service;

import java.util.List;
import java.util.Map;

import com.gms.backend.pojo.Employee;
import com.gms.backend.pojo.EmployeeDuty;

public interface StaffService {

	List<Employee> findAllStaff();

	Employee findStaff(int id);

	int saveStaff(Employee staff);

	int updateStaff(Employee staff);

	void deleteStaff(Integer id);

	List<Employee> findNameAndTelephone(String name, String telephone);

	List<EmployeeDuty> findTreeUI();

	void saveDuty(EmployeeDuty eDuty);

	void updateDuty(EmployeeDuty eDuty);

	List<Map<String, Object>> findDuty();
}
