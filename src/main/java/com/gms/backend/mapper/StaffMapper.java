package com.gms.backend.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gms.backend.pojo.Employee;

public interface StaffMapper {

	List<Employee> findAllStaff();

	Employee findStaff(int id);

	int saveStaff(Employee staff);

	void updateStaff(Employee staff);

	void deleteStaff(Integer id);

	List<Employee> findNameAndTelephone(@Param("name")String name,@Param("telephone") String telephone);

}
