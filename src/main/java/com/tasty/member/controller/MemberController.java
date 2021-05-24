package com.tasty.member.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
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
import com.tasty.member.vo.shopMemberVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	private final String MODULE = "member";
	
	// 저장할 위치 - 운영되는 서버에서 부터 찾는 상대 위치
	   String path = "/upload/image/";
	
	// 자동 DI
	@Autowired
	@Qualifier("msi")
	private MemberService service;
	
	// 로그인은 session을 이용한 로그인한다.
	// 로그인 폼
	@GetMapping("/loginForm.do")
	public String loginForm() {
		
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
		
		return MODULE + "/login";
	}
	
	
	// 로그 아웃 처리 메서드 - session을 그대로 두고 session안에 login 정보가 지운다.
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		
		log.info("logout() - 로그아웃 처리 ");
		
		// 로그아웃 처리
		// 1. session을 완전히 지운다.
		// session.invalidate();
		// 2. session을 그대로 두고 session안에 login 정보가 지운다.
		session.removeAttribute("login");
		
		return "redirect:/member/loginForm.do";
	}
	
	@GetMapping("/joinForm.do")
	public String joinForm() {
		return MODULE + "/join";
	}
	
	@PostMapping("/join.do")
	public String join(MemberVO vo, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		
		log.info("join() : " + vo);
		
		rttr.addFlashAttribute("result", service.join(vo, response));
		
		return "redirect:/member/loginForm.do";
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

	// 전화번호 중복 검사(AJAX)
	@PostMapping("/check_tel.do")
	public void check_tel(@RequestParam("tel") String tel, HttpServletResponse response) throws Exception{
		service.check_tel(tel, response);
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
	
	@GetMapping("/myPage.do")
	public String myPage(HttpServletRequest request, Model model) throws Exception {
		
//		log.info("찍어보자 : " + (String) session.getId());
//		log.info("찍어보자 : " + (String) session.getAttribute("login"));
		HttpSession session = request.getSession();
		log.info("찍어보좌 : " + session.getAttribute("login"));
		LoginVO id = (LoginVO) session.getAttribute("login");
		
		if(id == null) {
			return "redirect:/member/loginForm.do";
		}
		
		MemberVO vo = service.myPage(id);
		log.info("myPage.MemberVO : " + vo);
		
		model.addAttribute("vo", vo);
		
		return MODULE + "/myPage";
	}
	
	@GetMapping("/myShopPage.do")
	public String myShopPage(HttpServletRequest request, Model model) throws Exception {
		
		HttpSession session = request.getSession();
		LoginVO id = (LoginVO) session.getAttribute("login");
		
		if(id == null) {
			return "redirect:/member/loginForm.do";
		}
		
		shopMemberVO vo = service.myShopPage(id); 
		log.info("myShopPage.MemberVO : " + vo);
		
		model.addAttribute("vo", vo);
		
		return MODULE + "/myShopPage";
	}
	
	@GetMapping("/memberUpdateForm.do")
	public String memberUpdateForm(Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		LoginVO id = (LoginVO) session.getAttribute("login");
		
		if(id == null) {
			return "redirect:/member/loginForm.do";
		}
		
		MemberVO vo = service.myPage(id);
		log.info("myPage.MemberVO : " + vo);
		
		model.addAttribute("vo", vo);
		
		
		return MODULE + "/memberUpdate";
	}
	
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(MemberVO vo, Model model) throws Exception {
		
		log.info("회원정보수정 : " + vo);
		model.addAttribute("vo", service.memberUpdate(vo));
//		service.updateMember(vo);
		
		return "redirect:/member/myPage.do";
	}
	
	@GetMapping("/shopUpdate.do")
	public String shopUpdateForm(Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		LoginVO id = (LoginVO) session.getAttribute("login");
		
		if(id == null) {
			return "redirect:/member/loginForm.do";
		}
		
		model.addAttribute("vo", service.myShopPage(id));
		
		return MODULE + "/shopUpdate";
	}
	
	@PostMapping("/shopUpdate.do")
	public String shopUpdate(shopMemberVO vo, Model model) throws Exception {
		
		log.info("넘어온 정보 확인 : " + vo );
		
		model.addAttribute("vo", service.shopUpdate(vo));
		
		return "redirect:/member/myShopPage.do?id=" + vo.getId();
	}
	
	// 이미지 파일 바꾸기 처리
	@PostMapping("/updateFile.do")
	public String updatFile(shopMemberVO vo, String deleteFile,
			HttpServletRequest request) throws Exception{
		
		String realPath = request.getServletContext().getRealPath(path);
		
		log.info("updateFile.vo() : " + vo);
		log.info("updateFile.deleteFile() : " + deleteFile);
		
		// 원본 파일 지우기
		String deleteFileRealPath = request.getServletContext().getRealPath(deleteFile);
		log.info("updateFile().; deleteFileRealPath : " + deleteFileRealPath);
		
		FileUtil.delete(FileUtil.toFile(deleteFileRealPath));
		
		// 전달된 파일을 중복 배제해서 저장한다.
		String fileName = vo.getMultipartFile().getOriginalFilename();
		File imageFile = FileUtil.noDuplicate(realPath + fileName);
		vo.setImage(path + imageFile.getName());
		
		log.info("write().vo ......" + vo);
		
		// 전달된 파일을 서버에 저장하는 처리
		vo.getMultipartFile().transferTo(imageFile);
		
		// DB에 정보(vo) 수정
		service.updateFile(vo);
		
		return "redirect:shopUpdate.do?id=" + vo.getId();
	}
	
	
	@GetMapping("/memberWithdrawForm.do")
	public String memberWithdrawForm(Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		LoginVO id = (LoginVO) session.getAttribute("login");
		
		// 로그인이 안되어 있으면 로그인폼으로 이동시킨다.
		if(id == null) {
			return "redirect:/member/loginForm.do";
		}
		
		MemberVO vo = service.myPage(id);
		log.info("myPage.MemberVO : " + vo);
		
		model.addAttribute("vo", vo);

		
		return MODULE + "/memberWithdrawForm";
		
	}
	
	@PostMapping("/memberWithdraw.do")
	public String memberWithdraw(MemberVO vo, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		
		log.info("memberWithdrawController : " + vo);
		
		model.addAttribute("vo", service.memberWithdraw(vo,response, session)); 
		
		
		return MODULE + "/memberWithdraw";
	}
	
	
	
	
	/* 관리자 */
	
	@GetMapping("/memberList.do")
	public String memberList(Model model, @ModelAttribute PageObject pageObject) throws Exception {
		
		log.info("list().pageObject : " + pageObject + " ..........");
		model.addAttribute("list", service.memberList(pageObject));
		
		return MODULE + "/memberList";
	}
	
	@PostMapping("/gradeModify.do")
	public String gradeModify(MemberVO vo, Model model) throws Exception {
		model.addAttribute("vo", service.gradeModify(vo));
		return "redirect:/member/memberList.do";
		
	}
	
	@GetMapping("/view.do")
	public String view(Model model, String id, @ModelAttribute PageObject pageObject ) throws Exception {
		
		model.addAttribute("vo", service.view(id));
		
		return MODULE + "/view";
	}
	
	@GetMapping("/shopReg.do")
	public String shopRegForm(Model model, String id) throws Exception {
		
		log.info("shopRegForm().id : " + id);
		
		model.addAttribute("vo", service.view(id));
		
		return MODULE + "/shopReg";
	}
	
	@PostMapping("/shopReg.do")
	public String shopReg(shopMemberVO vo, Model model, HttpServletRequest request) throws Exception {
		
		// 저장할 위치 - 운영되는 서버에서 부터 찾는 상대 위치
		String path = "/upload/image/";
		
		// 실제적으로 저장이되는 위치
		String realPath = request.getServletContext().getRealPath(path);
		
		String fileName = vo.getMultipartFile().getOriginalFilename();
		File imageFile = FileUtil.noDuplicate(realPath + fileName);
		vo.setImage(path + imageFile.getName());
		
		vo.getMultipartFile().transferTo(imageFile);
		
		log.info("shopReg() : " + vo);
		
		model.addAttribute("vo", service.shopReg(vo));
		
		return "redirect:/member/memberList.do";
	}
}
