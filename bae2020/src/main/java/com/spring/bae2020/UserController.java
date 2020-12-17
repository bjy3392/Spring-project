package com.spring.bae2020;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bae2020.service.UserService;
import com.spring.bae2020.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	String msgFlag ="";
	
	@Autowired
	UserService userService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/userInput", method=RequestMethod.GET)
	public String userInputGet() {
		return "user/userInput";
	}
	
	//아이디 중복 체크(ajax처리 @ResponseBody 사용)
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public int idCheckGet(String mid) {
		UserVo res = userService.findUserById(mid);
		if(res != null) {
			return 1;
		}
		return 0;
	}
	
	//중복체크 한번더 해주고 회원input을 한다.
	@RequestMapping(value="/userInput", method=RequestMethod.POST)
	public String userInputPost(UserVo vo) {
		//아이디 중복체크
		if(userService.findUserById(vo.getMid()) != null) {
			msgFlag= "alreadyHaveUser";
			return "redirect:/msg/" + msgFlag;
		}
		
		//비밀번호 암호화 처리
		String encPwd = passwordEncoder.encode(vo.getPwd());
		vo.setPwd(encPwd);
		
		System.out.println(vo);
		
		//체크한 회원정보를 담은 vo를 DB에 저장처리 할 수 있게 한다.
		userService.insertUser(vo);
		msgFlag= "insertUserOk";
		
		return "redirect:/msg/" + msgFlag;
	}
		

	@RequestMapping(value="/userLogin", method=RequestMethod.GET)
	public String userLoginGet() {
		return "user/userLogin";
	}
	
	
	//로그인. 세션에 추가하기.
	@RequestMapping(value="/userLogin", method=RequestMethod.POST)
	public String userLoginPost(HttpSession session ,String mid, String pwd) {
		UserVo vo = userService.findUserById(mid);
		
		//아이디가 있는 경우
		if(vo != null) {
			if(passwordEncoder.matches(pwd, vo.getPwd())) {				
				session.setAttribute("smid", vo.getMid());
				session.setAttribute("slevel", vo.getLevel_code());
				session.setAttribute("sgroup", vo.getGroup_code());
				return "redirect:/";
			}
			else {
				//비밀번호가 틀린경우
				msgFlag = "wrongPassword";
				return "redirect:/msg/" + msgFlag;
			}
		}
		//아이디가 없는 경우
		else{
			msgFlag = "notHaveUser";
			return "redirect:/msg/" + msgFlag;
		}
	}
	
	@RequestMapping(value="/userLogout", method=RequestMethod.GET)
	public String userLogoutGet(HttpSession session) {	
		session.invalidate();
		return "redirect:/";
	}

}
