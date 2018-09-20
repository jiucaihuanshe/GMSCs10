package com.gms.backend.pojo;

import java.io.Serializable;
import java.util.Date;

public class Storage implements Serializable{
	private static final long serialVersionUID = -3417710124599555450L;
	private Integer id;
	private String barCode;
	private Integer sid;
	private Integer sum;
	private String remark;
	private Date productionDate;	//生成日期
	private Date expiryDate;	//有效期
	
}
