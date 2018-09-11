package com.gms.backend.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gms.backend.mapper.OfferMapper;
import com.gms.backend.pojo.OfferMerchant;
import com.gms.backend.service.OfferService;

@Service
public class OfferServiceImpl implements OfferService {

	@Autowired
	private OfferMapper offerMapper;

	@Override
	public List<OfferMerchant> listAllOffer() {
		List<OfferMerchant> offers = offerMapper.listAllOffer();
		return offers;
	}
}
