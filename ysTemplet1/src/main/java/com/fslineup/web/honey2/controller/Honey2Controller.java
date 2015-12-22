package com.fslineup.web.honey2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

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
public class Honey2Controller {
	
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
	@RequestMapping(value = "/honey2/main")
	public String home(@RequestParam HashMap<String, String> paramMap,
			Locale locale, Model model) throws Exception {

		
//		cmmnDAO.selectContents(paramVO, queryId) ; //하나불러올때
		
		System.out.println(paramMap.get("tmCd"));
		List<HashMap<String,String>> list = (List<HashMap<String, String>>) cmmnDAO.selectList(paramMap, "Honey2");
		
		model.addAttribute("resultList" , list);
		
//		Honey2.selectList
//		cmmnDAO.updateContents(paramVO, queryId); //업데이트
//		
//		cmmnDAO.insertContents(paramVO, queryId);
//		
//		cmmnDAO.deleteContents(paramVO, queryId);
		
		return "honey2";
	}
}