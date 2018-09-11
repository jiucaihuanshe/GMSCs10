package com.gms.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value = "addEditOffer", method = RequestMethod.GET)
	public ModelAndView addEditOffer(Integer id){
		ModelAndView mView = new ModelAndView();
		OfferMerchant offer = null;
		if(id == 0){
			offer = new OfferMerchant();
		}else{
			offer = offerService.findOffer(id);
		}
		mView.addObject("offer", offer);
		mView.setViewName("backend/addEditOffer");
		return mView;
	}
	
	@RequestMapping(value = "doAddEditOffer", method= RequestMethod.POST)
	@ResponseBody
	public String doAddEditOffer(OfferMerchant offer){
		if(offer.getId()==0){
			offerService.saveOffer(offer);
		}else{
			offerService.updateOffer(offer);
		}
		return "ok";
	}
	
	@RequestMapping(value = "deleteOffer",method = RequestMethod.POST)
	@ResponseBody
	public String deleteOffer(Integer id){
		offerService.deleteOffer(id);
		return "";
	}
	
	@RequestMapping(value = "findOffer", method = RequestMethod.POST)
	@ResponseBody
	public List<OfferMerchant> findOffer(String name,String telephone){
		List<OfferMerchant> offerInfo = offerService.findNameAndTelephone(name,telephone);
		return offerInfo;
	}
}
