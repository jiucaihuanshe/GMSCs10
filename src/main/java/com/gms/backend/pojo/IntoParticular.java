package com.gms.backend.pojo;

import java.io.Serializable;

/**
 * 进货详细表
 * @author wangchaofan
 *
 */
public class IntoParticular implements Serializable{
	private static final long serialVersionUID = 8810424110415518080L;
	private Integer id;
	private Integer inid;	//进货表id
	private Integer barCode;	//商品表(商品条形码)
	private Integer sum;	//进货数量
	private String remark;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getInid() {
		return inid;
	}
	public void setInid(Integer inid) {
		this.inid = inid;
	}
	public Integer getBarCode() {
		return barCode;
	}
	public void setBarCode(Integer barCode) {
		this.barCode = barCode;
	}
	public Integer getSum() {
		return sum;
	}
	public void setSum(Integer sum) {
		this.sum = sum;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
