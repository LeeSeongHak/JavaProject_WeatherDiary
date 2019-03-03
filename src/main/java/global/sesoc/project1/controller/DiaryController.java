package global.sesoc.project1.controller;




import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.project1.dao.DiaryDAO;
import global.sesoc.project1.vo.DiaryVO;

@Controller
public class DiaryController {
	
	private final static Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired
	DiaryDAO dao;
	
	//홈
	@RequestMapping(value = "/diaryList", method = RequestMethod.GET )
	public String diary_board(){
		
		return "diary/diaryList";
	}
	//일기쓰기 페이지
	@RequestMapping(value = "/diaryWrite", method = RequestMethod.GET )
	public String diaryWrite(){
		
		return "diary/diaryWrite";
	}
	//부트스트랩 페이지
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET )
	public String dashboard(){
		
		return "sample/dashboard";
	}
	@RequestMapping(value = "/diary", method = RequestMethod.GET )
	public String diary(){
		
		return "sample/diary";
	}
	@RequestMapping(value = "/diaryMap", method = RequestMethod.GET )
	public String map(){
		
		return "sample/diaryMap";
	}
	@RequestMapping(value = "/notification", method = RequestMethod.GET )
	public String notification(){
		
		return "sample/notification";
	}
	@RequestMapping(value = "/language", method = RequestMethod.GET )
	public String language(){
		
		return "sample/language";
	}
	@RequestMapping(value = "/userProfile", method = RequestMethod.GET )
	public String userProfile(){
		
		return "sample/userProfile";
	}
	
	//일기 받아옴
	@ResponseBody
	@RequestMapping(value = "diaryWrite", method = RequestMethod.POST)
	public void diaryWriteForm(DiaryVO diaryVO){
		
		dao.insertDiary(diaryVO);
	}
}
