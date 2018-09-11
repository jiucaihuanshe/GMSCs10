package com.gms.backend.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 进货表
 * @author wangchaofan
 *
 */
public class IntoStock implements Serializable{
	private static final long serialVersionUID = -2788822802497901365L;
	private Integer id;
	private Integer oid;	//供货商id
	private Integer shid;	//仓库id 默认1
	private Double amount;	//总额
	private Integer eid;	//经办人(员工id)
	private Date created;
	private String remark;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getShid() {
		return shid;
	}
	public void setShid(Integer shid) {
		this.shid = shid;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
