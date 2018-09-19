package com.gms.backend.vo;

import java.io.Serializable;

public class TypeInfo implements Serializable{
	private static final long serialVersionUID = 4576926334988029432L;
	private Integer id;
	private Integer parentId;
	private String name;
	private String tarentName;
	private String remark;
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
	public String getTarentName() {
		return tarentName;
	}
	public void setTarentName(String tarentName) {
		this.tarentName = tarentName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
