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

	@Override
	public OfferMerchant findOffer(Integer id) {
		OfferMerchant offer = offerMapper.findOffer(id);
		return offer;
	}

	@Override
	public void saveOffer(OfferMerchant offer) {
		offerMapper.saveOffer(offer);
	}

	@Override
	public void updateOffer(OfferMerchant offer) {
		offerMapper.updateOffer(offer);
	}

	@Override
	public void deleteOffer(Integer id) {
		offerMapper.deleteOffer(id);
	}

	@Override
	public List<OfferMerchant> findNameAndTelephone(String name, String telephone) {
		List<OfferMerchant> offerInfo = offerMapper.findNameAndTelephone(name,telephone);
		return offerInfo;
	}
}
