package com.fslineup.admin.moon.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fslineup.web.cm.dao.CmmnDAO;
import com.fslineup.web.cm.service.CmmnService;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/admin")
public class MoonController {
	
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
	@RequestMapping(value = "moon/main")
	public String home(@RequestParam HashMap<String, String> paramMap,
			 Model model) throws Exception {

		//		cmmnDAO.selectContents(paramVO, queryId) ; //�븯�굹遺덈윭�삱�븣
		/*System.out.println("paramMap.get(lgCd)  =   " +paramMap.get("LG_CD"));*/
		
		List<HashMap<String,String>> lgList = (List<HashMap<String, String>>) cmmnDAO.selectList(paramMap, "Moon");
		List<HashMap<String,String>> teamList = (List<HashMap<String, String>>) cmmnDAO.selectList(paramMap, "Moon.team");
		
		List<HashMap<String,String>> list = (List<HashMap<String, String>>) cmmnDAO.selectList(paramMap, "Moon.se");
		System.out.println(paramMap.toString());
		
		model.addAttribute("lgList" , lgList);
		model.addAttribute("teamList", teamList);
		
		model.addAttribute("resultList" , list);
		
		model.addAttribute("lgCd" , paramMap.get("LG_CD"));
		
		
		
		String result = "";
	      String urlAddr = "http://www.rotowire.com/basketball/nba_lineups.htm";
	      URL url;
	      HttpURLConnection conn;
	      BufferedReader rd;
	      String line;

	      try {
	         url = new URL(urlAddr);
	         conn = (HttpURLConnection) url.openConnection();
	         conn.setRequestMethod("GET");
	         rd = new BufferedReader(new InputStreamReader(
	               conn.getInputStream(), "EUC-KR"));
	         while ((line = rd.readLine()) != null) {
	            result += line;
	         }
	         rd.close();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	      }
		

		
		
		return "admin/moon";
	}
	@RequestMapping(value = "moon/{procType}Proc")
	public String home(@RequestParam HashMap<String, String> paramMap,
			@PathVariable String procType, Model model) throws Exception {
		
		
		cmmnDAO.insertContents(paramMap, "Moon");
		
		model.addAttribute("lgCd",paramMap.get("lgCd"));
		
		return "redirect:main";
	}

}