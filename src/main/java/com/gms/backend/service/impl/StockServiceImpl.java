package com.gms.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gms.backend.mapper.StockMapper;
import com.gms.backend.pojo.Merchandise;
import com.gms.backend.pojo.MerchandiseType;
import com.gms.backend.pojo.Unit;
import com.gms.backend.service.StockService;
import com.gms.backend.vo.MerchInfo;
import com.gms.backend.vo.TypeInfo;

@Service
public class StockServiceImpl implements StockService{

	@Autowired
	private StockMapper stockMapper;

	@Override
	public List<Map<String, Object>> findType() {
		List<Map<String, Object>> tType = stockMapper.findType();
		return tType;
	}

	@Override
	public List<TypeInfo> findTreeUI() {
		List<TypeInfo> mTypes = stockMapper.findTreeUI();
		return mTypes;
	}

	@Override
	public void saveType(MerchandiseType mType) {
		stockMapper.saveType(mType);
	}

	@Override
	public void updateType(MerchandiseType mType) {
		stockMapper.updateType(mType);
	}

	@Override
	public TypeInfo findTypeId(int id) {
		TypeInfo typeInfo = stockMapper.findTypeId(id);
		return typeInfo;
	}

	@Override
	public boolean findTypeCount(int id) {
		int rows = stockMapper.findTypeCount(id);
		if(rows>=1){
			return true;	//说明有子职务
		}
		return false;
	}

	@Override
	public void deleteType(int id) {
		stockMapper.deleteType(id);
	}

	@Override
	public MerchInfo findMerchId(int id) {
		MerchInfo merchInfo = stockMapper.findMerchId(id);
		return merchInfo;
	}

	@Override
	public void saveMerch(MerchInfo merchInfo) {
		Unit unit = new Unit();
		unit.setName(merchInfo.getName());
		int uid = stockMapper.insertUnit(unit);
		System.out.println(uid);
		
		merchInfo.setUid(uid);
		stockMapper.saveMerchInfo(merchInfo);
	}

	@Override
	public void updateMerch(MerchInfo merchInfo) {
		Unit unit = new Unit();
		unit.setName(merchInfo.getName());
		int rows = stockMapper.findUnitName(unit);
		if(rows ==1){ //说明名字相同，不用修改的
			stockMapper.updateMerch(merchInfo);
		}else{
			int uid = stockMapper.insertUnit(unit);
			merchInfo.setUid(uid);
			stockMapper.updateMerch(merchInfo);
		}
	}

	@Override
	public List<Map<String, Object>> findMerchUI() {
		List<Map<String, Object>> tMerch = stockMapper.findMerchUI();
		return tMerch;
	}
}
