package com.spring.bae2020;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bae2020.service.AdminService;
import com.spring.bae2020.service.UserService;
import com.spring.bae2020.vo.AskManagerVo;
import com.spring.bae2020.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	String msgFlag ="";
	
	@Autowired
	UserService userService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/userInput", method=RequestMethod.GET)
	public String userInputGet() {
		return "user/userInput";
	}
	
	//아이디 중복 체크(ajax처리 @ResponseBody 사용)
	@RequestMapping(value="/findUserAjax", method=RequestMethod.GET)
	@ResponseBody
	public UserVo findUserAjaxGet(String mid) {
		UserVo vo = userService.findUserByMid(mid);
//		if(vo != null) {
//			return 1;
//		}
		return vo;
	}
	
	//중복체크 한번더 해주고 회원input을 한다.
	@RequestMapping(value="/userInput", method=RequestMethod.POST)
	public String userInputPost(UserVo vo) {
		//아이디 중복체크
		if(userService.findUserByMid(vo.getMid()) != null) {
			msgFlag= "alreadyHaveUser";
			return "redirect:/msg/" + msgFlag;
		}
		
		//비밀번호 암호화 처리
		String encPwd = passwordEncoder.encode(vo.getPwd());
		vo.setPwd(encPwd);
		
		
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
		UserVo vo = userService.findUserByMid(mid);
		
		//아이디가 있는 경우
		if(vo != null) {
			if(passwordEncoder.matches(pwd, vo.getPwd())) {				
				session.setAttribute("smid", vo.getMid());
				session.setAttribute("sname", vo.getName());
				session.setAttribute("slevel", vo.getLevel());
				if(vo.getLevel().equals("level-05")) {
					return "store/storeHome";
				}
				else {
					return "redirect:/";					
				}
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
	
	@RequestMapping(value="/viewPasswordCheck", method=RequestMethod.GET)
	public String viewPasswordCheckGet() {
		return "user/passwordCheck";
	}
	
	//비밀번호가 일치하면 update화면을 띄운다.
	@RequestMapping(value="/passwordCheck", method=RequestMethod.POST)
	public String mPassCheckPost(HttpSession sseion, String pwd) {
		String mid = (String)sseion.getAttribute("smid");
		UserVo vo = userService.findUserByMid(mid);
		
		if(passwordEncoder.matches(pwd, vo.getPwd())) {
			return "redirect:/user/viewUserUpdate";
		}
		else{
			msgFlag = "wrongPasswordCheck";
			return "redirect:/msg/" + msgFlag;
		}
	}
	
	@RequestMapping(value="/viewUserUpdate", method=RequestMethod.GET)
	public String viewUserUpdateGet(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("smid");
		UserVo vo = userService.findUserByMid(mid);
		model.addAttribute("vo", vo);
		
		return "user/userUpdate";
	}
	
	@RequestMapping(value="/updateUser", method=RequestMethod.POST)
	public String updateUserPost(HttpSession session, UserVo vo) {
		if(!vo.getPwd().equals("")) {
			String encPwd = passwordEncoder.encode(vo.getPwd());
			vo.setPwd(encPwd);
		}
		
		userService.updateUser(vo);
		
		return "user/userUpdateOk";
	}
	
	@RequestMapping(value="/viewUserDelete", method=RequestMethod.GET)
	public String viewUserDeleteGet() {
		return "user/userDelete";
	}
	
	@RequestMapping(value="/deleteUser", method=RequestMethod.POST)
	public String deleteUserPost(String mid, String reason, String message) {
		userService.deleteUser(mid);
		
		userService.insertDeleteUser(reason,message);
		
		return "redirect:/user/userLogout";
	}
	
	@RequestMapping(value="/viewManagerInput", method=RequestMethod.GET)
	public String managerInputGet(Model model) {
		return "user/managerInput";
	}
	
	@RequestMapping(value="/insertManager", method=RequestMethod.POST)
	public String insertManagerPost(HttpSession session, AskManagerVo vo) {
		String mid = (String)session.getAttribute("smid");
		vo.setMid(mid);
		
		userService.insertAskManager(vo);
		
		return "user/managerInputOk";
	}
	
	@RequestMapping(value="/viewManagerPassOk", method=RequestMethod.GET)
	public String viewManagerPassOkGet(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("smid");
		List<AskManagerVo> vos =  userService.findAskManagerByMid(mid);
		
		model.addAttribute("vos", vos);
		
		return "user/managerPassOk";
	}
	

	
}
