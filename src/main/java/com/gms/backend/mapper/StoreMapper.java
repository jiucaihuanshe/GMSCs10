package com.gms.backend.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gms.backend.pojo.Storehouse;
import com.gms.backend.vo.Node;

public interface StoreMapper {

	List<Storehouse> listAllStore();

	Storehouse findStore(Integer id);

	void saveStore(Storehouse store);

	void updateStore(Storehouse store);

	void deleteStore(Integer id);

	List<Storehouse> findNameAndTelephone(@Param("name")String name,@Param("telephone") String telephone);

	List<Node> findZtreeNode();

}
