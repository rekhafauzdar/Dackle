package com.coi;

import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coi.entity.DackleOrders;

@Controller 
@SpringBootApplication
public class CoiProjectApplication extends SpringBootServletInitializer {

	@Autowired
	Demo service; 
	
	

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(CoiProjectApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(CoiProjectApplication.class, args);	
	}

	@ResponseBody
	@GetMapping("/registration")
	public Boolean registration(ModelMap modelMap, @RequestParam HashMap<String, String> param){
		try{
		service.userRegistration(modelMap, param);}
		catch(Exception e){ 
			return false;
		}
		return true;
	}
	
	
	@GetMapping("/registrationPage")
	public String registrationPage(ModelMap modelMap, @RequestParam HashMap<String, String> param){
		//service.userRegistration(modelMap, param);
		return "newRegistration";
	}

	@GetMapping("/")
	public String landingPage(){
		service.hello();
		return "Home";
	}	
	
	@GetMapping("/home")
	public String homePage(ModelMap modelMap, @RequestParam HashMap<String, String> param){
		return "index";
	}	
	
	@GetMapping("/viewOrders")
	public String viewOrders(ModelMap modelMap, @RequestParam HashMap<String, String> param){
		//service.getPrevOrders(modelMap,param);
		return "OrderPreview";
	}
	
	@GetMapping("/order_preview")
	public String showOrders(ModelMap modelMap, @RequestParam HashMap<String, String> param){
		service.getPrevOrders(modelMap,param);
		return "OrderPreview";
	}
	
	
	
	
	@ResponseBody
	@GetMapping("/login")
	public String userLogin(ModelMap modelMap, @RequestParam HashMap<String, String> param){
		boolean isvalidate = service.login(modelMap,param);
		return  isvalidate+"";
	}
	
	
	static double rw = 0d;
	@PostMapping("/calculate")
	public String calculate(ModelMap modelMap, @RequestParam HashMap<String, String> param) {

		service.calculate(param,modelMap);
		return "index";
	}	
	
}
