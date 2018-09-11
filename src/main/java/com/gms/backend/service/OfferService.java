package com.gms.backend.service;

import java.util.List;

import com.gms.backend.pojo.OfferMerchant;

public interface OfferService {

	List<OfferMerchant> listAllOffer();

	OfferMerchant findOffer(Integer id);

	void saveOffer(OfferMerchant offer);

	void updateOffer(OfferMerchant offer);

	void deleteOffer(Integer id);

	List<OfferMerchant> findNameAndTelephone(String name, String telephone);

}
