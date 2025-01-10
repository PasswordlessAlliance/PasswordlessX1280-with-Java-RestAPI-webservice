package com.pwl.cotroller.Login;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pwl.domain.Login.UserInfo;
import com.pwl.mapper.Login.LoginMapper;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	public LoginMapper loginMapper;
	
	@Value("${passwordless.serverKey}")
	private String serverKey;
	
	// Management types
	private int REQ_DEL = 1;            // Delete
	private int REQ_REG = 2;           // Register
	private int REQ_AUTH = 3;          // Authenticate
	
	// Management results
	private int RES_SUCCESS = 1;       // Success
	private int RES_FAIL = 0;          // Fail
	
	// Login
	@RequestMapping(value="/Login/login.do")
	public String login(Model model, HttpServletRequest request) {

		return "/Login/login";
	}
	
	// Sign-up
	@RequestMapping(value="/Login/join.do")
	public String join(Model model, HttpServletRequest request) {
		
		return "/Login/join";
	}
	
	// Change password
	@RequestMapping(value="/Login/changepw.do")
	public String changepw(Model model, HttpServletRequest request) {
		
		return "/Login/changepw";
	}

	// Logout
	@RequestMapping(value="/Login/Logout.do")
	public String Logout(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		session.setAttribute("id", "");
		
		return "/Login/logout";
	}
	
	// ------------------------------------------------ UTILS ------------------------------------------------
	
	public String sendGet(String url) throws Exception {
		
		final String USER_AGENT = "Mozilla/5.0";
		
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// optional default is GET
		con.setRequestMethod("GET");

		// Add request header
		con.setRequestProperty("User-Agent", USER_AGENT);

		int responseCode = con.getResponseCode();
		
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		return response.toString();
	}
}
