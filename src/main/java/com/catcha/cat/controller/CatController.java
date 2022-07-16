package com.catcha.cat.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.catcha.cat.exception.CatException;
import com.catcha.cat.service.CatService;
import com.catcha.cat.vo.RecordForm;

@Controller
@SessionAttributes("SCORE")
public class CatController {

	@Autowired
	private CatService catService;
	
	@GetMapping("/")
	public String home(Model model) {
		return "home";
	}
	
	@GetMapping("/reset")
	public String reset(SessionStatus sessionStatus) {
		// 세션객체의 SCORE를 초기화시키고 home.jsp를 재요청한다.
		sessionStatus.setComplete();
		return "redirect:/";
	}
	
	@PostMapping("/cat")
	/*
	 * @RequestParam이 자동형변환을 지원해준다. (int는 안됨)
	 */
	public String clickAcat(Integer num, Model model) {
		if (num%2 == 0) {
			return "fail";
		}
		
		// success일 때는 세션객체의 SCORE를 증가시킨다. (변경시키지 않는 경우에는 session에서 계속 전달되므로 별도 코드 필요x)
		int score = model.getAttribute("SCORE") == null ? 0 : (int) model.getAttribute("SCORE");
		model.addAttribute("SCORE", score + num);
		return "success";	
	}
	
	@GetMapping("/rank")
	public String rank(Model model) {
		
		// form 태그에 대응시킬 RecordForm 객체 만들어서 전달하기 (오류로 인한 페이지 출력 시 필요, 없으면 오류남)
		RecordForm recordForm = new RecordForm();
		int score = model.getAttribute("SCORE") == null ? 0 : (int) model.getAttribute("SCORE");
		recordForm.setScore(score);
		model.addAttribute("recordForm", recordForm);
		
		// rank 정보 조회해서 model에 저장하기
		model.addAttribute("rankedrecords", catService.getRankedRecords(5));
		return "rank";
	}
	
	@PostMapping("/record")
	public String record(@Valid RecordForm recordForm, BindingResult errors, SessionStatus sessionStatus, Model model) {
		
		// TODO 유효성 검사
		if (errors.hasErrors()) {
			// 다시 입력폼이 있는 페이지로 내부이동한다.
			// 에러 정보가 BindingResult를 통해서 전달되어서 입력폼에서 출력되게 할 것이다.
			// 그런데 이 때 rank 정보도 다시 같이 보내줘야 한다.
			model.addAttribute("rankedrecords", catService.getRankedRecords(5));
			return "rank";
		}
		
		// 점수, 이름 db에 저장
		try {
			catService.addNewRecord(recordForm);
		} catch (CatException e) {
			// 예외가 발생한 정보를 BindingResult 객체에 추가해서, 입력폼에서 출력되게 할 것이다.
			errors.rejectValue("name", null, e.getMessage());
			// 다시 입력폼이 있는 페이지로 내부이동한다.
			model.addAttribute("rankedrecords", catService.getRankedRecords(5));
			return "rank";
		}
		
		// 점수 초기화
		sessionStatus.setComplete();
		
		return "redirect:/rank";
	}
	
}
