package com.gms.backend.vo;

import java.io.Serializable;

public class UnitInfo implements Serializable{
	private static final long serialVersionUID = -8085069376186101202L;
	private Integer id;
	private String name;
	private Integer count;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
}
