package com.fs.url;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class url {
	public static void main(String[] args) {

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
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "EUC-KR"));
			while ((line = rd.readLine()) != null) {
				result += line;
			}
			rd.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

	}

}
