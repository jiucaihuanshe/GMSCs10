package com.gms.backend.mapper;

import java.util.List;
import java.util.Map;

import com.gms.backend.pojo.Merchandise;
import com.gms.backend.pojo.MerchandiseType;
import com.gms.backend.pojo.Unit;
import com.gms.backend.vo.MerchInfo;
import com.gms.backend.vo.TypeInfo;

public interface StockMapper {

	List<Map<String, Object>> findType();

	List<TypeInfo> findTreeUI();

	void saveType(MerchandiseType mType);

	void updateType(MerchandiseType mType);

	TypeInfo findTypeId(int id);

	int findTypeCount(int id);

	void deleteType(int id);

	MerchInfo findMerchId(int id);

	int insertUnit(Unit unit);

	void saveMerchInfo(MerchInfo merchInfo);

	Unit findUnitName(Unit unit);

	void updateMerch(MerchInfo merchInfo);

	List<TypeInfo> findMerchUI();

	List<MerchInfo> findAllStock();

}
