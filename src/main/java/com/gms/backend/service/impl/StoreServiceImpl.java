package com.gms.backend.service.impl;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gms.backend.mapper.StoreMapper;
import com.gms.backend.pojo.Storehouse;
import com.gms.backend.service.StoreService;
import com.gms.backend.vo.Node;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreMapper storeMapper;

	@Override
	public List<Storehouse> listAllStore() {
		List<Storehouse> stores = storeMapper.listAllStore();
		return stores;
	}

	@Override
	public Storehouse findStore(Integer id) {
		Storehouse store = storeMapper.findStore(id);
		return store;
	}

	@Override
	public void saveStore(Storehouse store) {
		storeMapper.saveStore(store);
	}

	@Override
	public void updateStore(Storehouse store) {
		storeMapper.updateStore(store);
	}

	@Override
	public void deleteStore(Integer id) {
		storeMapper.deleteStore(id);
	}

	@Override
	public List<Storehouse> findNameAndTelephone(String name, String telephone) {
		List<Storehouse> storeInfo = storeMapper.findNameAndTelephone(name,telephone);
		return storeInfo;
	}

	@Override
	public List<Node> findZtreeNode() {
		List<Node> node = storeMapper.findZtreeNode();
		return node;
	}
}
