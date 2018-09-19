package com.gms.backend.vo;

import java.io.Serializable;
import java.math.BigDecimal;

public class MerchInfo implements Serializable{
	private static final long serialVersionUID = 3500959180906538865L;
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
	
	private String name;	//unit单位
	private String mname;	//商品类别名称

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}
}
