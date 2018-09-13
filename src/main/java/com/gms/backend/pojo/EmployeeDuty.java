package com.gms.backend.pojo;

import java.io.Serializable;

/**
 * 职务表
 * @author wangchaofan
 *
 */
public class EmployeeDuty implements Serializable{
	private static final long serialVersionUID = -3322799050420029788L;
	private Integer id;
	private Integer parentId;
	private String name;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
