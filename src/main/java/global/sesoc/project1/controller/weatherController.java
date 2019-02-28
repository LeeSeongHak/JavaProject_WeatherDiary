package global.sesoc.project1.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class weatherController {
	public static final Logger logger = LoggerFactory.getLogger(weatherController.class);
	
	@RequestMapping(value="weather", method=RequestMethod.GET)
	public String weather(Model model){
		return "weatherTest";
	}
	
	@RequestMapping(value="map", method=RequestMethod.GET)
	public String map(){
		return "mapTest";
	}
	
	@RequestMapping(value="split", method=RequestMethod.POST)
	public void split(String loc, HttpSession session){
		String ar[] = loc.split("\n");
		String lat = ar[1].substring(4);
		String lng = ar[2].substring(4);
		session.setAttribute("lat", lat);
		session.setAttribute("lng", lng);
		return;
	}
}
