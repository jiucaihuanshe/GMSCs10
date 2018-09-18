package com.gms.backend.service;

import java.util.List;
import java.util.Map;

import com.gms.backend.pojo.Merchandise;
import com.gms.backend.pojo.MerchandiseType;
import com.gms.backend.vo.MerchInfo;
import com.gms.backend.vo.TypeInfo;

public interface StockService {

	List<Map<String, Object>> findType();

	List<TypeInfo> findTreeUI();

	void saveType(MerchandiseType mType);

	void updateType(MerchandiseType mType);

	TypeInfo findTypeId(int id);

	boolean findTypeCount(int id);

	void deleteType(int id);

	MerchInfo findMerchId(int id);

	void saveMerch(MerchInfo merchInfo);

	void updateMerch(MerchInfo merchInfo);

	List<Map<String, Object>> findMerchUI();

}
