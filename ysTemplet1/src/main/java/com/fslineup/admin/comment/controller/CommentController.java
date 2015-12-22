package com.fslineup.admin.comment.controller;

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
public class CommentController {
	
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
	@RequestMapping(value = "cmt/main")
	public String home(@RequestParam HashMap<String, String> paramMap,
			 Model model) throws Exception {

		//		cmmnDAO.selectContents(paramVO, queryId) ; //�븯�굹遺덈윭�삱�븣
		
		
		List<HashMap<String,String>> lgList = (List<HashMap<String, String>>) cmmnDAO.selectList(paramMap, "Comment");
		List<HashMap<String,String>> teamList = (List<HashMap<String, String>>) cmmnDAO.selectList(paramMap, "Comment.team");
		List<HashMap<String,String>> stmnmList = (List<HashMap<String, String>>) cmmnDAO.selectList(paramMap, "Comment.stmnm");
		
		model.addAttribute("lgList" , lgList);
		model.addAttribute("teamList", teamList);
		model.addAttribute("stmnmList", stmnmList);
		model.addAttribute("lgCd" , paramMap.get("league"));
		

		
		
		return "admin/comment";
	}
	@RequestMapping(value = "cmt/{procType}Proc")
	public String home(@RequestParam HashMap<String, String> paramMap,
			@PathVariable String procType, Model model) throws Exception {
		
		
		cmmnDAO.insertContents(paramMap, "Comment");
		
		model.addAttribute("lgCd",paramMap.get("lgCd"));
		
		return "redirect:main";
	}

}