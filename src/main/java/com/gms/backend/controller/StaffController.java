package com.gms.backend.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gms.backend.pojo.Employee;
import com.gms.backend.pojo.EmployeeDuty;
import com.gms.backend.service.StaffService;
import com.gms.backend.vo.DutyInfo;
import com.gms.backend.vo.EmployeeDutyInfo;
import com.gms.backend.vo.JsonResult;

/**
 * 员工表 需要有保存和修改，删除(标记为1) 判断delete_flag=0
 * 点击员工信息之后可以看到员工信息。
 * 根据员工的信息或者电话号码进行查找
 * @author wangchaofan
 *
 */

@Controller
@RequestMapping("/Staff/")
public class StaffController {
	@Autowired
	private StaffService staffService;
	
	@RequestMapping(value = "listStaff", method = RequestMethod.GET)
	public ModelAndView listStaff() {
		ModelAndView mView = new ModelAndView();
		List<Employee> staffs = staffService.findAllStaff();
		mView.addObject("staffs", staffs);
		mView.setViewName("backend/listStaff");
		return mView;
	}
	
	@RequestMapping(value = "addEditStaff", method = RequestMethod.GET)
	public ModelAndView addEditStaff(int id) {
		ModelAndView mView = new ModelAndView();

		EmployeeDutyInfo staff = null;
		if (id == 0) {
			staff = new EmployeeDutyInfo();
		} else {
			staff = staffService.findStaff(id);
		}
		mView.addObject("staff", staff);

		mView.setViewName("backend/addEditStaff");
		return mView;
	}
	
	@RequestMapping(value = "doAddEditStaff", method = RequestMethod.POST)
	@ResponseBody
	public String doAddEditStaff(Employee staff) {

		if (staff.getId() == 0) {
			staff.setAddby(1);
			staff.setAddon(new Date());
			staffService.saveStaff(staff);
		} else {
			staff.setEditby(1);
			staff.setEditon(new Date());
			staffService.updateStaff(staff);
		}

		return "ok";
	}
	
	@RequestMapping(value = "deleteStaff", method = RequestMethod.POST)
	@ResponseBody
	public String deleteStudentInfo(Integer id) {
		staffService.deleteStaff(id);
		return "";
	}
	
	@RequestMapping(value = "findStaff", method = RequestMethod.POST)
	@ResponseBody
	public List<Employee> findStudent(String name, String telephone) {
		List<Employee> userInfo = staffService.findNameAndTelephone(name, telephone);
		return userInfo;
	}
	
	@RequestMapping(value = "doShowUserInfo", method = RequestMethod.GET)
	public ModelAndView ShowUserInfo(Integer id){
		ModelAndView mView = new ModelAndView();
		EmployeeDutyInfo user = staffService.findStaff(id);
		mView.addObject("modal", user);
		mView.setViewName("backend/userModal");
		return mView;
	}
	
	@RequestMapping(value="addEditDuty",method=RequestMethod.GET)
	public ModelAndView addEditDuty(int id){
		ModelAndView mView = new ModelAndView();
		DutyInfo eDuty = null;
		if(id==0){
			eDuty = new DutyInfo();
		}else{
			eDuty = staffService.findDutyId(id);
		}
		mView.addObject("duty", eDuty);
		mView.setViewName("backend/employeeDuty");
		return mView;
	}
	
	@RequestMapping(value="findTreeUI",method=RequestMethod.GET)
	@ResponseBody
	public List<EmployeeDuty> findTreeUI(){
		List<EmployeeDuty> eDuties = staffService.findTreeUI();
		return eDuties;
	}
	
	@RequestMapping(value="findDuty",method=RequestMethod.GET)
	@ResponseBody
	public JsonResult findDuty(){
		List<Map<String, Object>> eDuties = staffService.findDuty();
		return new JsonResult(1, "ok", eDuties);
	}
	
	@RequestMapping(value="doAddEditDuty",method=RequestMethod.POST)
	@ResponseBody
	public String doAddEditDuty(EmployeeDuty eDuty){
		if(eDuty.getId()==0){
			staffService.saveDuty(eDuty);
		}else{
			staffService.updateDuty(eDuty);
		}
		return "ok";
	}
	
	@RequestMapping(value="findDutyCount",method=RequestMethod.GET)
	@ResponseBody
	public int findDutyCount(int id){
		boolean isCount = staffService.findDutyCount(id);
		if (isCount) {
			return 1;
		} else {
			return 0;
		}
	}
	
	@RequestMapping(value="deleteDuty",method=RequestMethod.GET)
	@ResponseBody
	public String deleteDutyInfo(int id){
		staffService.deleteDuty(id);
		return "ok";
	}
}
