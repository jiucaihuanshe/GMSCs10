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
import com.gms.backend.vo.UnitInfo;

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
		UnitInfo uInfo = stockMapper.findUnitName(unit);	//查询name是否存在于数据库中
		/**
		 * 先判断merchInfo中的单位是否存在，或者单位跟数据库中名字存在，
		 * 存入新的数据库，然后根据id修改。
		 */
		if(uInfo.getCount() == 0){
			stockMapper.insertUnit(unit);
			System.out.println("unitId:"+unit.getId());
			merchInfo.setUid(unit.getId());
			stockMapper.updateMerch(merchInfo);
		}else{
			//rows==1
			merchInfo.setUid(uInfo.getId());
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

	@Override
	public void deleteStock(int id) {
		stockMapper.deleteStock(id);
	}

	@Override
	public List<MerchInfo> findStock(String barCode, String tradeName) {
		List<MerchInfo> mList = stockMapper.findStock(barCode,tradeName);
		return mList;
	}
}
