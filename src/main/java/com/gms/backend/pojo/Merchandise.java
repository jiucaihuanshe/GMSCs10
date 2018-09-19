package com.gms.backend.pojo;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 商品表
 * @author wangchaofan
 *
 */
public class Merchandise implements Serializable{
	private static final long serialVersionUID = 3415464876144761551L;
	private Integer id;
	private String barCode;	//条形码编号
	private String tradeName;	//商品名称
	private Integer uid;	//单位编号
	private BigDecimal purchasePrice;	//进货价格
	private BigDecimal presellPrice;	//预售价格
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
	public String getBarCode() {
		return barCode;
	}
	public void setBarCode(String barCode) {
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
	public BigDecimal getPurchasePrice() {
		return purchasePrice;
	}
	public void setPurchasePrice(BigDecimal purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	public BigDecimal getPresellPrice() {
		return presellPrice;
	}
	public void setPresellPrice(BigDecimal presellPrice) {
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
