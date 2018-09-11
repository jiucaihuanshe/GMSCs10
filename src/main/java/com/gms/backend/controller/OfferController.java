package com.gms.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gms.backend.pojo.OfferMerchant;
import com.gms.backend.service.OfferService;

@Controller
@RequestMapping("/Offer/")
public class OfferController {

	@Autowired
	private OfferService offerService;
	
	@RequestMapping(value = "listOffer", method = RequestMethod.GET)
	public ModelAndView listOffer(){
		ModelAndView mView = new ModelAndView();
		List<OfferMerchant> offers = offerService.listAllOffer();
		mView.addObject("offers", offers);
		mView.setViewName("backend/listOffer");
		return mView;
	}
	
	
}
