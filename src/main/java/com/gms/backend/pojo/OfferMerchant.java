package com.gms.backend.pojo;

import java.io.Serializable;

/**
 * 供货商
 * @author wangchaofan
 *
 */
public class OfferMerchant implements Serializable{
	private static final long serialVersionUID = 7104411273705916013L;
	private Integer id;	
	private String name;	//供货商名称
	private String linkman;	//联系人
	private String telephone;
	private String address;
	private String remark;
	private Short deleteFlag;
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
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Short getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(Short deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
}
