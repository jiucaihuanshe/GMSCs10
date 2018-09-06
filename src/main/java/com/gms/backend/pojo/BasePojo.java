package com.gms.backend.pojo;

import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.gms.utils.DateTimeFormatConverter;

public class BasePojo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Date addon;
	private Integer addby;
	private Date editon;
	private Integer editby;
	private Date deleteon;
	private Integer deleteby;
	private Short deleteFlag;

	@JsonSerialize(using = DateTimeFormatConverter.class)
	public Date getAddon() {
		return addon;
	}

	public void setAddon(Date addon) {
		this.addon = addon;
	}

	@JsonSerialize(using = DateTimeFormatConverter.class)
	public Date getEditon() {
		return editon;
	}

	@JsonSerialize(using = DateTimeFormatConverter.class)
	public void setEditon(Date editon) {
		this.editon = editon;
	}

	public Date getDeleteon() {
		return deleteon;
	}

	public void setDeleteon(Date deleteon) {
		this.deleteon = deleteon;
	}

	public Short getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Short deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Integer getAddby() {
		return addby;
	}

	public void setAddby(Integer addby) {
		this.addby = addby;
	}

	public Integer getEditby() {
		return editby;
	}

	public void setEditby(Integer editby) {
		this.editby = editby;
	}

	public Integer getDeleteby() {
		return deleteby;
	}

	public void setDeleteby(Integer deleteby) {
		this.deleteby = deleteby;
	}

}
