package com.gms.backend.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gms.backend.pojo.OfferMerchant;

public interface OfferMapper {

	List<OfferMerchant> listAllOffer();

	OfferMerchant findOffer(Integer id);

	void saveOffer(OfferMerchant offer);

	void updateOffer(OfferMerchant offer);

	void deleteOffer(Integer id);

	List<OfferMerchant> findNameAndTelephone(@Param("name")String name,@Param("telephone") String telephone);

}
