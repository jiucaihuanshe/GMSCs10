package com.gms.backend.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gms.backend.pojo.Merchandise;
import com.gms.backend.pojo.MerchandiseType;
import com.gms.backend.pojo.Unit;
import com.gms.backend.vo.MerchInfo;
import com.gms.backend.vo.TypeInfo;
import com.gms.backend.vo.UnitInfo;

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

	UnitInfo findUnitName(Unit unit);

	void updateMerch(MerchInfo merchInfo);

	List<TypeInfo> findMerchUI();

	List<MerchInfo> findAllStock();

	void deleteStock(int id);

	List<MerchInfo> findStock(@Param("barCode")String barCode, @Param("tradeName")String tradeName);

}
