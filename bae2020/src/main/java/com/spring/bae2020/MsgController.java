package com.spring.bae2020;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MsgController {
	@RequestMapping(value="/msg/{msgFlag}", method = RequestMethod.GET )
	public String msgGet(@PathVariable String msgFlag, Model model, HttpSession session) {
		
		if(msgFlag.equals("alreadyHaveUser")) {
			model.addAttribute("msg", "존재하는 아이디입니다.");
			model.addAttribute("url", "user/userInput");
		}
		else if(msgFlag.equals("notHaveUser")) {
			model.addAttribute("msg", "존재하지 않는 아이디입니다");
			model.addAttribute("url", "user/userLogin");
		}
		else if(msgFlag.equals("wrongPassword")) {
			model.addAttribute("msg", "비밀번호를 확인해주세요.");
			model.addAttribute("url", "user/userLogin");
		}
		else if(msgFlag.equals("insertUserOk")) {
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
			model.addAttribute("url", "user/userLogin");
		}
		else if(msgFlag.equals("notProduct")) {
			model.addAttribute("msg", "선택한 제품이 없습니다.");
			model.addAttribute("url", "order/viewCartList");
		}
		else if(msgFlag.equals("insertStoreOk")) {
			model.addAttribute("msg", "등록되었습니다.");
			model.addAttribute("url", "admin/viewStoreList");
		}
		else if(msgFlag.equals("wrongPasswordCheck")) {
			model.addAttribute("msg", "비밀번호를 확인해주세요.");
			model.addAttribute("url", "user/viewPasswordCheck");
		}
		return "include/msg";
	}	
}

















