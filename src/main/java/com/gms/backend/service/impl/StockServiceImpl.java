package com.gms.backend.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gms.backend.mapper.StockMapper;
import com.gms.backend.service.StockService;

@Service
public class StockServiceImpl implements StockService{

	@Autowired
	private StockMapper stockMapper;
}
