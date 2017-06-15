package com.yanwu.www.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yanwu.www.domain.Exam;
import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Paper;
import com.yanwu.www.domain.Student;
import com.yanwu.www.service.ExamService;
import com.yanwu.www.service.PaperService;
import com.yanwu.www.service.StudentService;

@Controller
@RequestMapping("/examPage")
public class ExamController {
	
	private String mainPage;
	
	@Autowired
	private PaperService paperService;
	
	@Autowired
	private ExamService examService;
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/selectPaper")
	public String selectPaper(HttpServletRequest request,Model model){
		
		try {
			List<Paper> paperList=paperService.getPapers();
			model.addAttribute("paperList", paperList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mainPage="/WEB-INF/views/exam/selectPaper.jsp";
		request.setAttribute("mainPage", mainPage);
		return "main";
	}
	
	@RequestMapping("/getExamResult")
	public String getExamResult(HttpServletRequest request,Exam exam,Model model) throws Exception{
		
		Map map=request.getParameterMap();
		int totalScore=0;
		int singleScore=0;
		int mulScore=0;
		Iterator<Entry<String, String[]>> it=map.entrySet().iterator();
		while(it.hasNext()){
			Entry entry=it.next();
			String key=(String) entry.getKey();
			System.out.println(key);
			String[] values=(String[]) entry.getValue();
			String value="";
			if(key.indexOf("-")!=-1){
				System.out.print(key+"==>");
				for(String ss: values){
					value+=ss+",";
				}
				value=value.substring(0, value.length()-1);
				if("r".equals(key.split("-")[1])){  //single choice
					try {
						singleScore+=examService.calScore(key.split("-")[2], value, "1");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if("c".equals(key.split("-")[1])){  //multiple choice
					try {
						mulScore+=examService.calScore(key.split("-")[2], value, "2");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				
				System.out.print(value);
				System.out.println();
			}
			
			}
			
		totalScore=singleScore+mulScore;
		exam.setMoreScore(mulScore);
		exam.setSingleScore(singleScore);
		exam.setScore(totalScore);
		try {
			examService.saveExam(exam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("singleScore", singleScore);
		model.addAttribute("mulScore", mulScore);
		model.addAttribute("totalScore", totalScore);
		mainPage="/WEB-INF/views/exam/examResult.jsp";
		request.setAttribute("mainPage", mainPage);
		return "main";
		
	}
	
	
	@RequestMapping("/examList")
	public String examList(HttpServletRequest request,@ModelAttribute("s") Student s,PageBean page,Model model){
		Map map=new HashMap();
		page.setPageSize(10);
		
		try {
			map= examService.getExams(s,page);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("map", map);
		mainPage="/WEB-INF/views/exam/examList.jsp";
		request.setAttribute("mainPage", mainPage);
		return "main";
	}
	
	
	
	
	
	
	
	

}
