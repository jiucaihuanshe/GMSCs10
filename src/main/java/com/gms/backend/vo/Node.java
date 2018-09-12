package com.gms.backend.vo;

import java.io.Serializable;

public class Node implements Serializable{
	private static final long serialVersionUID = 5800057726945471506L;
	private Integer id;
	private Integer eid;
	private String name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
