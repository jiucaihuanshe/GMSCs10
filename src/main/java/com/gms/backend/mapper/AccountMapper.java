package com.gms.backend.mapper;

import org.apache.ibatis.annotations.Param;

import com.gms.backend.pojo.Administrator;

public interface AccountMapper {

	Administrator findLogin(@Param("username")String username);

}
