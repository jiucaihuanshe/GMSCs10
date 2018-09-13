package com.gms.backend.service.impl;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gms.backend.mapper.AccountMapper;
import com.gms.backend.mapper.StaffMapper;
import com.gms.backend.pojo.Administrator;
import com.gms.backend.pojo.Employee;
import com.gms.backend.pojo.EmployeeDuty;
import com.gms.backend.service.StaffService;

@Service
public class StaffServiceImpl implements StaffService {

	@Autowired
	private StaffMapper staffMapper;
	@Autowired
	private AccountMapper accountMapper;
	@Override
	public List<Employee> findAllStaff() {
		List<Employee> staffs = staffMapper.findAllStaff();
		return staffs;
	}
	@Override
	public Employee findStaff(int id) {
		Employee staff = staffMapper.findStaff(id);
		return staff;
	}
	@Override
	public int saveStaff(Employee staff) {
		staffMapper.saveStaff(staff);
		int staffid = staff.getId();
		String telephone = staff.getTelephone();
		String username = staff.getName();
		
		Administrator user = new Administrator();
		user.setId(staffid);
		user.setUsername(username);
		ByteSource source = ByteSource.Util.bytes(telephone.getBytes());
		String salt = UUID.randomUUID().toString();
		SimpleHash simpleHash = new SimpleHash("MD5", source, salt);
		user.setPassword(simpleHash.toHex());
		user.setSalt(salt);
		user.setAddby(1);
		accountMapper.saveUser(user);
		return 1;
	}
	@Override
	public int updateStaff(Employee staff) {
		staffMapper.updateStaff(staff);
		return 1;
	}
	@Override
	public void deleteStaff(Integer id) {
		staffMapper.deleteStaff(id);
	}
	@Override
	public List<Employee> findNameAndTelephone(String name, String telephone) {
		List<Employee> userInfo = staffMapper.findNameAndTelephone(name,telephone);
		return userInfo;
	}
	@Override
	public List<EmployeeDuty> findTreeUI() {
		List<EmployeeDuty> eDuties = staffMapper.findTreeUI();
		return eDuties;
	}
	@Override
	public void saveDuty(EmployeeDuty eDuty) {
		staffMapper.saveDuty(eDuty);
	}
	@Override
	public void updateDuty(EmployeeDuty eDuty) {
		staffMapper.updateDuty(eDuty);
	}
	@Override
	public List<Map<String, Object>> findDuty() {
		List<Map<String, Object>> eDuties = staffMapper.findDuty();
		return eDuties;
	}
}
