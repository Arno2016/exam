package com.yanwu.www.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yanwu.www.domain.Student;
import com.yanwu.www.service.StudentService;
import com.yanwu.www.util.GenerateCode;

@Controller	
public class StudentController {
	private String mainPage;
	
	@Autowired
	StudentService studentService;
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpServletResponse response,Student student,String inputCode, Model model){
		Map<String, String> map=new HashMap<String, String>();
		Student s=studentService.login(student);
		request.getSession().setAttribute("student", s);
			if(s!=null){
				request.getSession().removeAttribute("code");
				response.addHeader("msg", "success");//为了ajax能取到数据
			}else{
				response.addHeader("msg", "fail");
			}
			
			model.addAttribute("map", map);
			mainPage="/WEB-INF/views/loginSuccess.jsp";
			request.setAttribute("mainPage", mainPage);
			
			return "main";
				
	}
	
	
	@RequestMapping("/updatePassword")
	public String updatePassword(HttpServletRequest request,String newPassword,Model model){
		if(newPassword!=null){
			Student student=(Student) request.getSession().getAttribute("student");
			student.setPassword(newPassword);
			try {
				studentService.update(student);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				model.addAttribute("error_msg", e.getMessage());
			}
		}
		mainPage="/WEB-INF/views/student/updatePassword.jsp";
		request.setAttribute("mainPage",mainPage);
		return "main";
		
	}

		
	
	
	
	@RequestMapping("/getCode")
	@ResponseBody
	public String geCode(HttpServletRequest request,HttpServletResponse response,Student student ,Model model) throws IOException{
		Map map=new HashMap<String,String>();
		GenerateCode generateCode=new GenerateCode();
		String code=generateCode.getCode();
		ObjectMapper mapper = new ObjectMapper(); 
		System.out.println("----------req------------");
		String reqData=mapper.writeValueAsString(student);
		System.out.println(reqData);
		System.out.println("----------res------------");
		map.put("code", code);
		String resData=mapper.writeValueAsString(map);
		System.out.println(resData);
		request.getSession().setAttribute("code", code);
		System.out.println(request.getSession().getAttribute("code"));
		
		return resData;
	}
	
	
}
