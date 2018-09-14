package com.gms.backend.vo;

import java.io.Serializable;

public class DutyInfo implements Serializable{
	private static final long serialVersionUID = 6660051522012098733L;
	private Integer id;
	private Integer parentId;
	private String name;
	private String parentName;
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
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
}
