package com.tasty.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasty.member.service.MemberService;
import com.tasty.member.vo.LoginVO;
import com.tasty.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	private final String MODULE = "member";
	
	// 자동 DI
	@Autowired
	@Qualifier("msi")
	private MemberService service;
	
	// 로그인은 session을 이용한 로그인한다.
	// 로그인 폼
	@GetMapping("/loginForm.do")
	public String loginForm() {
		
		log.info("loginForm() - 로그인 폼 이동");
		
		return MODULE + "/login";
	}
	
	// 로그인 처리
	// 클라이언트에서 넘겨주는 id, pw를 받아야 한다.(LoginVO), session을 받아야 한다.
	@PostMapping("/login.do")
	public String login(LoginVO vo, HttpSession session, HttpServletResponse response) throws Exception {
		
		// 넘어온 데이터 확인
		log.info("login().vo - " + vo);
		
		// 아이디와 비밀번호가 DB정보와 맞으면 로그인 처리한다(session에 loginVO객체를 넣어준다.).
		session.setAttribute("login", service.login(vo, response));
		
		// 로그인이 끝나면 이동할 url
		return "redirect:/board/list.do";
	}
	
	
	// 로그 아웃 처리 메서드 - session을 그대로 두고 session안에 login 정보가 지운다.
	@GetMapping("/logout.do")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		log.info("logout() - 로그아웃 처리 ");
		
		// 로그아웃 처리
		// 1. session을 완전히 지운다.
		// session.invalidate();
		// 2. session을 그대로 두고 session안에 login 정보가 지운다.
		session.removeAttribute("login");
		
		// 메시지 보내기 - session이 사라지면 오류가 난다. session.invalidate() 사용 금지
		rttr.addFlashAttribute("msg", "정상적으로 로그아웃이 되었습니다.");
		
		return "redirect:/board/list.do";
	}
	
	@GetMapping("/joinForm.do")
	public String joinForm() {
		return MODULE + "/join";
	}
	
	@PostMapping("/join.do")
	public String join(MemberVO vo, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		
		log.info("join() : " + vo);
		
		rttr.addFlashAttribute("result", service.join(vo, response));
		
		return "redirect:/board/list.do";
	}
	
	// 아이디 중복 검사(AJAX)
	@PostMapping("/check_id.do")
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
		service.check_id(id, response);
	}
	
	// 이메일 중복 검사(AJAX)
	@PostMapping("/check_email.do")
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		service.check_email(email, response);
	}

	// 이용약관
	@GetMapping("/readme.do")
	public String readme() throws Exception {
		
		return MODULE + "/readme";
	}
	
	// 아이디 찾기 폼
	@GetMapping("/findIdForm.do")
	public String findIdForm() throws Exception {
		
		return MODULE + "/findIdForm";
	}
	
	
	@PostMapping("/findId.do")
	public String findId(HttpServletResponse response, Model model, MemberVO vo) throws Exception {
		
		model.addAttribute("vo", service.findId(response, vo));
		
		return MODULE + "/findId";
	}
	
	// 비밀번호 찾기 폼
	@GetMapping("/findPwForm.do")
	public String findPwForm() throws Exception{
		return MODULE + "/findPwForm";
	}
	
	// 비밀번호 찾기 완료
	@PostMapping("/findPw.do")
	public String findPw(@ModelAttribute MemberVO vo,Model model , HttpServletResponse response) throws Exception{
		model.addAttribute("vo", service.findPw(response, vo));
		log.info("비밀번호 변경 Controller : " + vo);
		return MODULE +  "/findPw";
	}
	
}
