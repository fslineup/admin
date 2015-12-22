package com.fslineup.web.util;

import java.io.IOException;
import java.io.Reader;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import oracle.sql.CLOB;

public class CmUtil {

	/**
	 * - 날짜 
	 * 패턴에 맞게 오늘날짜 리턴
	 * @param 날짜 패턴 (yyyy년 MM월 dd일 hh시 mm분 ss초 SSS)
	 * 		빈값이면 yyyyMMddhhmmssSSS 패턴
	 */
	public static String getToday(String pattern){
		String result ="";
		
		if("".equals(pattern))pattern = "yyyyMMddhhmmssSSS";
		
		Date date =new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(pattern, Locale.getDefault());
		result = sdf.format(date);
		
		return result;
	}
	
	/**
	 * - 넘버
	 * 숫자 확인- 숫자일경우 True , 숫자가 아닐경우 False
	 * @param Object
	 */
	public static boolean isNumber(Object obj){
		boolean result = true;
		try{
			double d=java.lang.Double.parseDouble((String)obj);
			System.out.println(d);
		}
		catch(NumberFormatException e){
			return false;
		}
		return result;
	}
	/**
	 * -기타
	 * 맵으로 파라미터 만들기
	 * 값은 UTF-8로 변환
	 * @param paramMap key,value로 파라미터 입력
	 * @param listKey
	 * @return
	 * @throws IOException
	 */
	public static String bulidparameters(Map<String, Object> paramMap,String listKey) throws IOException{
		String result = "";
		StringBuilder sb = new StringBuilder();
		if (paramMap ==null){
			return result;
		}
		for(Iterator<String> i = paramMap.keySet().iterator();i.hasNext();){
			String key = (String) i.next();
			if(listKey.equals(key)){
				@SuppressWarnings("unchecked")
				List<Object> list = (List<Object>)paramMap.get(key);
				for(int j=0;j<list.size();j++){
					sb.append(key);
					sb.append("=");
					sb.append(URLEncoder.encode(String.valueOf(list.get(j)),"UTF-8"));
					if(list.size()!= j+1){
						sb.append("&");
					}
				}
			}else{
				sb.append(key);
				sb.append("=");
				sb.append(URLEncoder.encode(String.valueOf(paramMap.get(key)),"UTF-8"));
			}
			if(i.hasNext()){
				sb.append("&");
			}
		}
		result = sb.toString();
		return result;
	}
	/**
	 * CLOB타입을 String으로 변경
	 * @param obj
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	public static String clobtoString(Object obj) throws SQLException, IOException{
		String result="";
		
		CLOB clob = (CLOB) obj;
		Reader reader = clob.getCharacterStream();
		StringBuilder out = new StringBuilder();
		char[] buff = new char[1024];
		int nchars = 0;
		while ((nchars = reader.read(buff))>0){
			out.append(buff,0,nchars);
		}
		result = out.toString();
		return result;
	}
	public static void main(String arg[]) throws Exception{
	}
}
