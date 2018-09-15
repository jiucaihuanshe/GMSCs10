package com.gms.backend.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gms.backend.pojo.Employee;
import com.gms.backend.pojo.EmployeeDuty;
import com.gms.backend.vo.DutyInfo;
import com.gms.backend.vo.EmployeeDutyInfo;

public interface StaffMapper {

	List<Employee> findAllStaff();

	EmployeeDutyInfo findStaff(int id);

	int saveStaff(Employee staff);

	void updateStaff(Employee staff);

	void deleteStaff(Integer id);

	List<Employee> findNameAndTelephone(@Param("name")String name,@Param("telephone") String telephone);

	List<EmployeeDuty> findTreeUI();

	void saveDuty(EmployeeDuty eDuty);

	void updateDuty(EmployeeDuty eDuty);

	List<Map<String, Object>> findDuty();

	DutyInfo findDutyId(int id);

	void deleteDuty(int id);

	int findDutyCount(int id);
}
