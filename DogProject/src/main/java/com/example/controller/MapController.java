package com.example.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.AccompanyingFacilitiesDTO;
import com.example.service.AccompanyingFacilitiesService;

@Controller
public class MapController {

	@Autowired
	AccompanyingFacilitiesService service;
	
	/* guide */
	//맵 메인
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(Model model, AccompanyingFacilitiesDTO dto) {
		List<AccompanyingFacilitiesDTO> list = service.selectList(dto);
		model.addAttribute("list",list);
		return "guide/map";
	}
	
	@RequestMapping(value = "/changeMap", method = RequestMethod.GET)
	@ResponseBody
	public List<AccompanyingFacilitiesDTO> changeMap(Model model, String swLatlng, String neLatlng, String RodeAddress, String Category2, Map<String,Object> map) {
		if (RodeAddress == null || RodeAddress.isEmpty() || RodeAddress.equals("null")) {
		    RodeAddress = null;
		}
		if (Category2 == null || Category2.isEmpty() || Category2.equals("null") || Category2.equals("categoryFilter")) {
		    Category2 = null;
		}
		map = getLatlng(swLatlng, neLatlng, map);
		map.put("RodeAddress", RodeAddress);
		map.put("Category2", Category2);
		List<AccompanyingFacilitiesDTO> list = service.selectListChange(map);
		return list;
	}
	
	//받아온 북동좌표, 남서좌표를 map에 값 넣기
	public Map<String, Object> getLatlng(String swLatlng, String neLatlng, Map<String,Object> map){
		swLatlng = swLatlng.replace("(", "");
		swLatlng = swLatlng.replace(")", "");
		neLatlng = neLatlng.replace("(", "");
		neLatlng = neLatlng.replace(")", "");
		String [] swLatlngArray = swLatlng.split(", ");
		String [] neLatlngArray = neLatlng.split(", ");
		map.put("Latitude1", Double.parseDouble(swLatlngArray[0]));
		map.put("Latitude2", Double.parseDouble(neLatlngArray[0]));
		map.put("Longitude1", Double.parseDouble(swLatlngArray[1]));
		map.put("Longitude2", Double.parseDouble(neLatlngArray[1]));
		return map;
	}
	
	//동물병원 찾기
	@RequestMapping(value = "/gmap", method = RequestMethod.GET)
	public String gmap(Locale locale, Model model) {
		return "guide/gmap";
	}
	//동반가능업소 목록 - 문화시설
	@RequestMapping(value = "/dogdiv", method = RequestMethod.GET)
	public String dogdiv(Locale locale, Model model) {
		return "guide/dogdiv";
	}
	//동반가능업소 상세화면 - 문화시설
	@RequestMapping(value = "/savedogdiv", method = RequestMethod.GET)
	public String savedogdiv(Locale locale, Model model) {
		return "guide/savedogdiv";
	}
	
}
