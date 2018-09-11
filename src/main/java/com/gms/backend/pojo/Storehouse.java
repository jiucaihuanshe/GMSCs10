package com.gms.backend.pojo;

import java.io.Serializable;
/**
 * 仓库表
 * @author wangchaofan
 *
 */
public class Storehouse implements Serializable{
	private static final long serialVersionUID = -5183575588007610632L;
	private Integer id;
	private String name;
	private String telephone;
	private String address;
	private Integer eid;	//负责人id(员工id)
	private String remark;
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
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
