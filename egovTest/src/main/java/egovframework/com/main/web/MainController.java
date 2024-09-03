package egovframework.com.main.web;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.main.service.MainService;
import egovframework.com.util.SHA256;

@Controller
public class MainController {
	@Resource(name="MainService")
	private MainService mainService;
	
	SHA256 sha256 = new SHA256();
	
	@RequestMapping("/main.do")
	public String main(HttpSession session, Model model) {
		HashMap<String, Object> loginInfo = null;
		loginInfo = (HashMap<String, Object>) session.getAttribute("loginInfo");
		if(loginInfo != null) {
			model.addAttribute("loginInfo", loginInfo);
			return "main/main";
		}else {
			return "redirect:/login.do";
		}
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("loginInfo", null);
		session.removeAttribute("loginInfo");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/join.do")
	public String join() {
		return "join";
	}
	
	@RequestMapping("/member/idChk.do")
	public ModelAndView idChk(@RequestParam HashMap<String, Object> paramMap) {
		ModelAndView mv = new ModelAndView();
		
		int idChk = 0;
		idChk = mainService.selectIdChk(paramMap);
		mv.addObject("idChk", idChk);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/member/insertMember.do")
	public ModelAndView insertMember(@RequestParam HashMap<String, Object> paramMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		String pwd = paramMap.get("accountPwd").toString();
		paramMap.replace("accountPwd", sha256.encrypt(pwd));
		String accountEmail = paramMap.get("email").toString() +"@"+paramMap.get("emailAddr").toString();
		paramMap.put("accountEmail", accountEmail);
		
		int resultChk = 0;
		resultChk = mainService.insertMember(paramMap);
		
		mv.addObject("resultChk", resultChk);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/member/loginAction.do")
	public ModelAndView loginAction(HttpSession session, @RequestParam HashMap<String, Object> paramMap){

		ModelAndView mv = new ModelAndView();

		// 입력받은 패스워드
		String pwd = paramMap.get("pwd").toString();
		// 암호화된 패스워드
		String encryptPwd = null;
		try {
			encryptPwd = sha256.encrypt(pwd).toString();
			paramMap.replace("pwd", encryptPwd);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap<String, Object> loginInfo = null;
		loginInfo = mainService.selectLoginInfo(paramMap);
		if(loginInfo != null) {
			session.setAttribute("loginInfo", loginInfo);
			mv.addObject("resultChk", true);
		}else {
			mv.addObject("resultChk", false);
		}
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest request, Model model) {
		HashMap<String, Object> loginInfo = null;
		HttpSession session = request.getSession();
		loginInfo = (HashMap<String, Object>) session.getAttribute("loginInfo");
		if(loginInfo != null) {
			model.addAttribute("loginInfo", loginInfo);
			return "main/mypage";
		}else {
			return "redirect:/login.do";
		}
	}
	
	@RequestMapping("/member/updateMember.do")
	public ModelAndView updateMember(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		String encryptPwd = null;
		if(paramMap.get("pwd") != null) {
			// 입력받은 패스워드
			String pwd = paramMap.get("pwd").toString();
			try {
				encryptPwd = sha256.encrypt(pwd).toString();
				paramMap.replace("pwd", encryptPwd);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String accountEmail = paramMap.get("email").toString() +"@"+paramMap.get("emailAddr").toString();
		paramMap.put("accountEmail", accountEmail);
		int resultChk = 0;
		resultChk = mainService.updateMember(paramMap);
		
		mv.addObject("resultChk", resultChk);
		mv.setViewName("jsonView");
		return mv;
	}
	
}
