package com.spring.bae2020;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bae2020.service.AdminService;
import com.spring.bae2020.service.BoardService;
import com.spring.bae2020.vo.BoardVo;
import com.spring.bae2020.vo.OptionsVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.StoreVo;
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
	public String viewBoardListGet(Model model, @RequestParam(value="product", required = false) String product, String sort) {
		product = product==null ? "all":  product;
		
		List<BoardVo> vos =  boardService.findBoard(0, product, sort);
		List<ProductVo> vosP = adminService.findProductByCategory("PROD-001");
		
		model.addAttribute("vos", vos);
		model.addAttribute("vosP", vosP);
		model.addAttribute("product", product);
		model.addAttribute("sort", sort);
		model.addAttribute("lastIdx", 5);
		
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
	public String insertBoardPost(HttpSession session, BoardVo vo) {
		String mid = (String)session.getAttribute("smid");
		vo.setMid(mid);		
		boardService.insertBoard(vo);
		
		return "redirect:/board/viewBoardList?startIdx=0&sort=create_dt";
	}
	
	@RequestMapping(value="/viewBoardContent", method = RequestMethod.GET)
	public String viewBoardContentGet(Model model, String idx, String product, String sort) {
		
		BoardVo vo = boardService.findBoardByIdx(idx);
		model.addAttribute("vo", vo);
		model.addAttribute("product", product);
		model.addAttribute("sort", sort);
		
		return "board/boardContent";
	}
	
	@RequestMapping(value="/viewBoardUpdate", method = RequestMethod.GET)
	public String viewBoardUpdateGet(Model model, String idx, String product, String sort) {
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
		
		BoardVo boardVo = boardService.findBoardByIdx(idx);
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("product", product);
		model.addAttribute("sort", sort);
		
		return "board/boardUpdate";
	}
	
	
	@RequestMapping(value="/updateBoard", method = RequestMethod.POST)
	public String updateBoardPost(BoardVo vo, String idx, String prod, String sort)throws Exception {
		String encodedParam = URLEncoder.encode(prod, "UTF-8");
		boardService.updateBoard(vo, idx);
		
		return "redirect:/board/viewBoardContent?idx="+idx+"&sort="+sort+"&product="+encodedParam;
	}
	
	@RequestMapping(value="/deleteBoard", method = RequestMethod.GET)
	public String deleteBoardGet(String idx) {
				
		boardService.deleteBoard(idx);
		
		return "redirect:/board/viewBoardList?sort=create_dt";
	}
	
	@RequestMapping(value="/updateBoardByGood", method = RequestMethod.POST)
	@ResponseBody
	public String updateBoardByGoodPost(String idx) {
		
		boardService.updateBoardByGood(idx); 
		
		return "";
	}
	
	@RequestMapping(value="/viewStoreMap", method = RequestMethod.GET)
	public String viewStoreMapGet(Model model, String route) {
		List<StoreVo> vos =  adminService.findStore();
		model.addAttribute("route", route);
		model.addAttribute("vos", vos);
		
		return "board/storeMap";
	}
	
	@RequestMapping(value="/viewBoardListMore", method = RequestMethod.POST)
	@ResponseBody
	public List<BoardVo> viewBoardListMorePost(Model model, int lastIdx, @RequestParam(value="product", required = false) String product, String sort) {
		product = product==null ? "전체":  product;
		
		List<BoardVo> vos =  boardService.findBoard(lastIdx, product, sort);
				
		return vos;
	}
}
