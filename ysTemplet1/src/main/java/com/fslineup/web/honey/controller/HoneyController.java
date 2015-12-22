package com.fslineup.web.honey.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fslineup.web.cm.dao.CmmnDAO;
import com.fslineup.web.cm.service.CmmnService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HoneyController {
	
	@Autowired
    protected CmmnService cmmnService;
	
	@Autowired
	protected CmmnDAO cmmnDAO;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/honey/kbl/main")
	public String home(@RequestParam HashMap<String, Object> paramMap,
			Locale locale, Model model) throws Exception {

		if(paramMap.get("team")==null){
			paramMap.put("team","오리온스");
		}
		
		Map<String, String> resultMap = (Map<String, String>) cmmnDAO.selectContents(paramMap, "Honey");
		
		List<HashMap<String,String>> list = (List<HashMap<String, String>>) cmmnDAO.selectList(paramMap, "Honey");
		
		model.addAttribute("team", paramMap.get("team"));
		model.addAttribute("resultList" , list);
		model.addAttribute("resultMap" , resultMap);
		
		return "honey";
	}
}