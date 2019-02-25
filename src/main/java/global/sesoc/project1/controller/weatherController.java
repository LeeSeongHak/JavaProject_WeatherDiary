package global.sesoc.project1.controller;

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
	

}
