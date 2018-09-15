package com.gms.backend.service;

import java.util.List;
import java.util.Map;

import com.gms.backend.pojo.Employee;
import com.gms.backend.pojo.EmployeeDuty;
import com.gms.backend.vo.DutyInfo;
import com.gms.backend.vo.EmployeeDutyInfo;

public interface StaffService {

	List<Employee> findAllStaff();

	EmployeeDutyInfo findStaff(int id);

	int saveStaff(Employee staff);

	int updateStaff(Employee staff);

	void deleteStaff(Integer id);

	List<Employee> findNameAndTelephone(String name, String telephone);

	List<EmployeeDuty> findTreeUI();

	void saveDuty(EmployeeDuty eDuty);

	void updateDuty(EmployeeDuty eDuty);

	List<Map<String, Object>> findDuty();

	DutyInfo findDutyId(int id);

	void deleteDuty(int id);

	boolean findDutyCount(int id);
}
