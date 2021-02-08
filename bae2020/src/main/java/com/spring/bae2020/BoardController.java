package com.spring.bae2020;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.bae2020.service.AdminService;
import com.spring.bae2020.service.BoardService;
import com.spring.bae2020.vo.BoardVo;
import com.spring.bae2020.vo.OptionsVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.SubcategoryVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	String msgFlag;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/viewBoardList", method = RequestMethod.GET)
	public String viewBoardListGet(Model model, String startIdx, @RequestParam(value="product", required = false) String product, String sort) {
		product = product==null ? "전체":  product;
		
		List<BoardVo> vos =  boardService.findBoard(0, product, sort);
		List<ProductVo> vosP = adminService.findProductByCategory("PROD-001");
		
		model.addAttribute("vos", vos);
		model.addAttribute("vosP", vosP);
		model.addAttribute("product", product);
		model.addAttribute("sort", sort);
		model.addAttribute("lastIdx", startIdx+5);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/viewBoardInput", method = RequestMethod.GET)
	public String viewBoardInputGet(Model model) {
		List<SubcategoryVo> vosS =  adminService.findSubcategoryByCategory("PROD-001");
		
		for(int i=0; i<vosS.size(); i++) {
			SubcategoryVo vo = vosS.get(i);
			String subcategory_code = vo.getSubcategory_code();
			List<OptionsVo> vos = adminService.findOptionBySubcategory(subcategory_code, "");
			
			String option_code = vos.get(0).getOption_code();
			String first_code = option_code.substring(0,option_code.lastIndexOf("-"));			
			
			model.addAttribute(first_code+"vos", vos);
		}

		List<ProductVo> vosP = adminService.findProductByCategory("PROD-001");
		model.addAttribute("vosP", vosP);
		
		return "board/boardInput";
	}
	
	@RequestMapping(value="/insertBoard", method = RequestMethod.POST)
	public String insertBoardPost(Model model, HttpSession session, BoardVo vo) {
		String mid = (String)session.getAttribute("smid");
		vo.setMid(mid);		
		
		boardService.insertBoard(vo);
		
		return "redirect:/board/viewBoardList?startIdx=0&sort=create_dt";
	}
	
	@RequestMapping(value="/viewBoardContent", method = RequestMethod.GET)
	public String viewBoardContentGet(Model model, String idx) {
		
		BoardVo vo = boardService.findBoardByIdx(idx);
		model.addAttribute("vo", vo);
		
		return "board/boardContent";
	}
	
}
