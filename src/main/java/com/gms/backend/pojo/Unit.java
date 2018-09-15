package com.gms.backend.pojo;

import java.io.Serializable;

public class Unit implements Serializable{
	private static final long serialVersionUID = -8627130299171724919L;
	private Integer id;
	private String name;
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
}
