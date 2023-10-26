package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.DogTypeDTO;
import com.example.service.DogTypeService;

@Controller
public class DogTypeController {
	
	@Autowired
	DogTypeService service;
	@RequestMapping(value = "/dogsList", method = RequestMethod.GET)
	public ModelAndView dogsList(@RequestParam(value="dogSize", required=false, defaultValue="standard") String dogSize) {
		HashMap<String, String> map = new HashMap<String, String>();//�ʱ�ȭ
		map.put("dogSize", dogSize);
		List<DogTypeDTO> list = service.dogsList(map);//DB SelectList
		
		ModelAndView mav = new ModelAndView();//�ʱ�ȭ
		mav.addObject("list", list);
		mav.setViewName("dogsList/dogsList");//dogsList.jsp
		return mav;
	}
	
	@RequestMapping(value = "/dogSearch", method = RequestMethod.GET)
	public ModelAndView dogSearch(@RequestParam(value="dogSearch", required=false) String dogSearch) {
		List<DogTypeDTO> list = service.dogSearch(dogSearch);//DB SelectList
		ModelAndView mav = new ModelAndView();//�ʱ�ȭ
		mav.addObject("list", list);
		mav.setViewName("dogsList/dogsList");//dogsList.jsp
		return mav;
	}	
}
