package com.gms.backend.service;

import java.util.List;

import com.gms.backend.pojo.Storehouse;
import com.gms.backend.vo.Node;

public interface StoreService {

	List<Storehouse> listAllStore();

	Storehouse findStore(Integer id);

	void saveStore(Storehouse store);

	void updateStore(Storehouse store);

	void deleteStore(Integer id);

	List<Storehouse> findNameAndTelephone(String name, String telephone);

	List<Node> findZtreeNode();

}
