package com.gms.backend.pojo;

import java.io.Serializable;

/**
 * 商品表
 * @author wangchaofan
 *
 */
public class Merchandise implements Serializable{
	private static final long serialVersionUID = 3415464876144761551L;
	private Integer id;
	private Integer barCode;	//条形码编号
	private String tradeName;	//商品名称
	private Integer uid;	//单位编号
	private Double purchasePrice;	//进货价格
	private Double presellPrice;	//预售价格
	private Double discount;	//折扣率
	private Integer mid;	//商品类别编号
	private String remark;	//备注
	private Short deleteFlag;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBarCode() {
		return barCode;
	}
	public void setBarCode(Integer barCode) {
		this.barCode = barCode;
	}
	public String getTradeName() {
		return tradeName;
	}
	public void setTradeName(String tradeName) {
		this.tradeName = tradeName;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Double getPurchasePrice() {
		return purchasePrice;
	}
	public void setPurchasePrice(Double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	public Double getPresellPrice() {
		return presellPrice;
	}
	public void setPresellPrice(Double presellPrice) {
		this.presellPrice = presellPrice;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
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
