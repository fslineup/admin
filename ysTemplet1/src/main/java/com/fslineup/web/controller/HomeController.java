package com.fslineup.web.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fslineup.web.cm.dao.CmmnDAO;
import com.fslineup.web.cm.service.CmmnService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
    protected CmmnService cmmnService;
	
	@Autowired
	protected CmmnDAO cmmnDAO;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String home(@RequestParam HashMap<String, Object> paramMap,
			Locale locale, Model model) throws Exception {
 

		String html = getHTML("").replaceAll("\\s", "");
		String htmlTeam = html;
		String htmlName = html;
		String topboxleft = "dlineups-topboxleft\">";
		String teamState = "lineup-";
		String time = "game=";
		String awTeam = ".png\">";
		String name = "atitle=\"";
		String inj = "player.htm?";
		String day = "tod";
		int topboxleftSize = topboxleft.length();
		int teamStateSize = teamState.length();
		int timeSize = time.length()+9;
		int awTeamSize = awTeam.length();
		int nameSize = name.length();
		int injSize = inj.length();
		int count = getStringCount(html, topboxleft);
		int idx = 0;
		int z=0;
		String arrTeam[] = new String[count*2] ;
		String val = "";
		
		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("day", day);
		cmmnDAO.deleteContents(map1, "Lineup.team");
		//경기 넣기~
		for(int i = 0; i < count;i++){
			Map<String, String> map = new HashMap<String, String>();
			idx = htmlTeam.indexOf(topboxleft);
			idx = idx + topboxleftSize;
			val = htmlTeam.substring(idx, idx + 3);
			htmlTeam = htmlTeam.substring(idx);
			map.put("hm_team", val);
 
			idx = htmlTeam.indexOf(teamState);
			idx = idx + teamStateSize;
			val = htmlTeam.substring(idx, idx + 1);
			htmlTeam = htmlTeam.substring(idx);
			map.put("hm_stat", val);
 
			idx = htmlTeam.indexOf(time);
			idx = idx + timeSize;
			val = htmlTeam.substring(idx, htmlTeam.indexOf("PM"));
			htmlTeam = htmlTeam.substring(idx);
			map.put("time", val);
 
			idx = htmlTeam.indexOf(teamState);
			idx = idx + teamStateSize;
			val = htmlTeam.substring(idx, idx + 1);
			htmlTeam = htmlTeam.substring(idx);
			map.put("aw_stat", val);
 
			idx = htmlTeam.indexOf(awTeam);
			idx = idx + awTeamSize;
			val = htmlTeam.substring(idx, idx + 3);
			htmlTeam = htmlTeam.substring(idx);
			map.put("aw_team", val);
			map.put("day",day);
			arrTeam[z++]=map.get("hm_team");
			arrTeam[z++]=map.get("aw_team");
			System.out.println(map.toString());
			cmmnDAO.insertContents(map, "Lineup.team");
		}
		
		
		// 주전 선수 넣기~
		map1.put("line", "stt");
		cmmnDAO.deleteContents(map1, "Lineup.player");
		for(int i =0 ; i<count*2 ; i++){
			for(int y =0; y <5;y++){
				Map<String, String> map = new HashMap<String, String>();
				map.put("team", arrTeam[i]);
				
				idx = htmlName.indexOf(name) + nameSize;
				htmlName = htmlName.substring(idx);
				val = htmlName.substring(0, htmlName.indexOf("\"h"));
				htmlName = htmlName.substring(htmlName.indexOf("\"h"));
				
				map.put("name",val);
				map.put("state", "");
				map.put("line", "stt");
				map.put("day",day);
				System.out.println(map.toString());
				cmmnDAO.insertContents(map, "Lineup.player");
			}
		}
		
		
		
		
		
		String injuries[] = html.split("Injuries");
		
		//부상자 넣기~
		map1.put("line", "inj");
		cmmnDAO.deleteContents(map1, "Lineup.player");
		z=0;
		int chkTop= 0;
		for (int i = 0; i < injuries.length; i++) {
			Map<String, String> mapIn = new HashMap<String, String>();
			if(i>0){
				html = injuries[i].toString();
				mapIn.put("team", arrTeam[z]);
				z++;
				for(;;){
					idx = html.indexOf(inj);
					chkTop = html.indexOf("topboxleft");
					if(chkTop!=-1){
						if(idx>chkTop){
							break;
						}
					}
					if(idx==-1){
						break;
					}
					idx = idx + injSize;
					val = html.substring(idx+9, html.indexOf("</a"));
					html = html.substring(html.indexOf("</a")+2);
					mapIn.put("name", val);
					
					String a = html;
					if(html.indexOf(inj)>-1){
						a = html.substring(0, html.indexOf(inj));
					}
					if(a.indexOf("INACTIVE") > -1){
						val = "INACTIVE";
					}else if(a.indexOf("GTD") > -1){
						val = "GTD";
					}else if(a.indexOf("OUT") > -1){
						val = "OUT";
					} 
					
					
					mapIn.put("state", val);
					mapIn.put("day",day);
					mapIn.put("line", "inj");
					cmmnDAO.insertContents(mapIn, "Lineup.player");
//					System.out.println(mapIn.toString());
				}
			}
		}
		
		return "home1";
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/lineup", method = RequestMethod.GET)
	public String lineupMain(@RequestParam HashMap<String, Object> paramMap,
			Locale locale, Model model) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("day", "tod");
		map.put("line", "stt");
		List<HashMap<String,String>> teamList =  (List<HashMap<String, String>>) cmmnDAO.selectList(map, "Lineup.team");
		List<HashMap<String,String>> playList =  (List<HashMap<String, String>>) cmmnDAO.selectList(map, "Lineup.player");
		
		map.put("line", "inj");
		List<HashMap<String,String>> injList =  (List<HashMap<String, String>>) cmmnDAO.selectList(map, "Lineup.player");
		model.addAttribute("teamList", teamList);
		model.addAttribute("playList", playList);
		model.addAttribute("injList", injList);
		return "lineup";
	}
	public static String getHTML(String urlAddr) {
		String result = "";
		urlAddr = "http://www.rotowire.com/basketball/nba_lineups.htm";
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
 
		return result;
	}
 
	public static int getStringCount(String html, String val) {
		int count = 0;
		
		String pro[] = html.split(val);
		
		count= pro.length-1;
		
		System.out.println(count);
		
		return count;
	}
 
	public static void main(String[] args) {
		
		String html = getHTML("").replaceAll("\\s", "");
		String htmlTeam = html;
		String htmlName = html;
		String topboxleft = "dlineups-topboxleft\">";
		String teamState = "lineup-";
		String time = "game=";
		String awTeam = ".png\">";
		String name = "atitle=\"";
		String inj = "player.htm?";
		String day = "tod";
		int topboxleftSize = topboxleft.length();
		int teamStateSize = teamState.length();
		int timeSize = time.length()+9;
		int awTeamSize = awTeam.length();
		int nameSize = name.length();
		int injSize = inj.length();
		int count = getStringCount(html, topboxleft);
		int idx = 0;
		int z=0;
		String arrTeam[] = new String[count*2] ;
		String val = "";
		
		
		//경기 넣기~
		for(int i = 0; i < count;i++){
			Map<String, String> map = new HashMap<String, String>();
			idx = htmlTeam.indexOf(topboxleft);
			idx = idx + topboxleftSize;
			val = htmlTeam.substring(idx, idx + 3);
			htmlTeam = htmlTeam.substring(idx);
			map.put("hm_team", val);
 
			idx = htmlTeam.indexOf(teamState);
			idx = idx + teamStateSize;
			val = htmlTeam.substring(idx, idx + 1);
			htmlTeam = htmlTeam.substring(idx);
			map.put("hm_stat", val);
 
			idx = htmlTeam.indexOf(time);
			idx = idx + timeSize;
			val = htmlTeam.substring(idx, htmlTeam.indexOf("PM"));
			htmlTeam = htmlTeam.substring(idx);
			map.put("time", val);
 
			idx = htmlTeam.indexOf(teamState);
			idx = idx + teamStateSize;
			val = htmlTeam.substring(idx, idx + 1);
			htmlTeam = htmlTeam.substring(idx);
			map.put("aw_stat", val);
 
			idx = htmlTeam.indexOf(awTeam);
			idx = idx + awTeamSize;
			val = htmlTeam.substring(idx, idx + 3);
			htmlTeam = htmlTeam.substring(idx);
			map.put("aw_team", val);
			map.put("day",day);
			arrTeam[z++]=map.get("hm_team");
			arrTeam[z++]=map.get("aw_team");
			System.out.println(map.toString());
		}
		
		
		// 주전 선수 넣기~
		for(int i =0 ; i<count*2 ; i++){
			for(int y =0; y <5;y++){
				Map<String, String> map = new HashMap<String, String>();
				map.put("team", arrTeam[i]);
				
				idx = htmlName.indexOf(name) + nameSize;
				htmlName = htmlName.substring(idx);
				val = htmlName.substring(0, htmlName.indexOf("\"h"));
				htmlName = htmlName.substring(htmlName.indexOf("\"h"));
				
				map.put("name",val);
				map.put("state", "");
				map.put("line", "stt");
				map.put("day",day);
				System.out.println(map.toString());
			}
		}
		
		
		
		
		
		String injuries[] = html.split("Injuries");
		
		//부상자 넣기~
		z=0;
		int chkTop= 0;
		for (int i = 0; i < injuries.length; i++) {
			Map<String, String> mapIn = new HashMap<String, String>();
			if(i>0){
				html = injuries[i].toString();
				mapIn.put("team", arrTeam[z]);
				z++;
				for(;;){
					idx = html.indexOf(inj);
					chkTop = html.indexOf("topboxleft");
					if(chkTop!=-1){
						if(idx>chkTop){
							break;
						}
					}
					if(idx==-1){
						break;
					}
					idx = idx + injSize;
					val = html.substring(idx+9, html.indexOf("</a"));
					html = html.substring(html.indexOf("</a")+2);
					mapIn.put("name", val);
					
					String a = html;
					if(html.indexOf(inj)>-1){
						a = html.substring(0, html.indexOf(inj));
					}
					if(a.indexOf("INACTIVE") > -1){
						val = "INACTIVE";
					}else if(a.indexOf("GTD") > -1){
						val = "GTD";
					}else if(a.indexOf("OUT") > -1){
						val = "OUT";
					} 
					
					
					mapIn.put("state", val);
					mapIn.put("day",day);
					mapIn.put("line", "inj");
					
//					System.out.println(mapIn.toString());
				}
			}
		}
		
		
	}
}