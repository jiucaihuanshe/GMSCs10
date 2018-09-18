package com.gms.backend.pojo;

import java.io.Serializable;

public class MerchandiseType implements Serializable{
	private static final long serialVersionUID = 2930779891851092279L;
	private Integer tid;
	private Integer tarentId;
	private String tname;
	private String tremark;
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public Integer getTarentId() {
		return tarentId;
	}
	public void setTarentId(Integer tarentId) {
		this.tarentId = tarentId;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTremark() {
		return tremark;
	}
	public void setTremark(String tremark) {
		this.tremark = tremark;
	}
}
