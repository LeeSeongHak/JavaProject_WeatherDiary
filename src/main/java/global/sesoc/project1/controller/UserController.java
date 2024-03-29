package global.sesoc.project1.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.project1.dao.UserDAO;
import global.sesoc.project1.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	UserDAO dao;
	
	private final static Logger logger = LoggerFactory.getLogger(DiaryController.class);

	//Login Form
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id, String password, Model model, HttpSession session){
		UserVO vo = null;
		vo = dao.login(id, password);
		
		if(vo == null){
			model.addAttribute("vo", vo);
			return "redirect:/";
		}
		
		else{
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			session.setAttribute("name", vo.getName());
			session.setAttribute("country", vo.getCountry());
			session.setAttribute("region", vo.getRegion());
			translate(session);
			
			return "weatherTest";
		}
	}
	
	//Join Form
	@RequestMapping(value = "/join", method= RequestMethod.GET)
	public String join1(){
		return "user/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join2(String custid, UserVO vo){
		vo.setid(custid);
		int cnt=0;
		cnt = dao.join(vo);
		
		if(cnt==0){
			return " user/join";
		}
		else{
			return "redirect:/";
		}
	}
	
	//ID 중복확인
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public String idCheck(){
		return "user/idCheck";
	}
	
	//ID 중복확인2
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public String idCheck2(String searchId, Model model){
		//ID를 전달하여 검색 결과를 VO 객체로 받음
		UserVO vo = dao.getCustomer(searchId);
		//검색 결과를 Model에 저장하고 JSP로 다시 이동
		model.addAttribute("searchId", searchId);
		//검색한 결과를 담아 리턴.
		model.addAttribute("searchResult", vo);
		//검색해서 null인지, 검색안해서 null인지 확인하기 위해 search 하나 더 만든 것. result와 search 모두 null이면 검색조차 안한것.
		model.addAttribute("search", true);
		return "user/idCheck";
	}
	
	//@번역
	@RequestMapping(value = "/translate", method=RequestMethod.GET)
	public void translate(HttpSession session){
		String clientId = "ibvum1Y0Dx5JXH1pXGDp";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "4Bwp4Jf6Cg";//애플리케이션 클라이언트 시크릿값";
        String country = (String)session.getAttribute("country") + " " + (String)session.getAttribute("region");
        try {
            String text = URLEncoder.encode(country, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // post request
            String postParams = "source=ko&target=en&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            logger.debug(response.toString());
            session.setAttribute("country2", response.toString());
            
        } catch (Exception e) {
            logger.debug(e.toString());
        }
        return;
	}
}
