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
		stockMapper.insertUnit(unit);
		merchInfo.setUid(unit.getId());
		if(merchInfo.getDiscount()!=null && merchInfo.getDiscount().equals("")){
			merchInfo.setDiscount(1.00);
		}
		stockMapper.saveMerchInfo(merchInfo);
	}

	@Override
	public void updateMerch(MerchInfo merchInfo) {
		Unit unit = new Unit();
		unit.setName(merchInfo.getName());
		Unit unit2 = stockMapper.findUnitName(unit);
		/**
		 * 先判断merchInfo中的单位是否存在，或者单位跟数据库中名字存在，
		 * 存入新的数据库，然后根据id 修改。
		 */
		if(merchInfo.getName().equals(unit2.getName())){ //说明名字相同，不用修改的
			stockMapper.updateMerch(merchInfo);
		}else{
			stockMapper.insertUnit(unit);
			merchInfo.setUid(unit.getId());
			stockMapper.updateMerch(merchInfo);
		}
	}

	@Override
	public List<TypeInfo> findMerchUI() {
		List<TypeInfo> tMerch = stockMapper.findMerchUI();
		return tMerch;
	}

	@Override
	public List<MerchInfo> findAllStock() {
		List<MerchInfo> mList = stockMapper.findAllStock();
		return mList;
	}
}
