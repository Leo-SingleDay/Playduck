package com.duck.playduck.orders.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.orders.model.service.BuyService;
import com.duck.playduck.orders.model.vo.BuyList;
import com.duck.playduck.play.controller.Utils;

@Controller
public class BuyController {
	
	@Autowired
	BuyService buyService;
	
	@RequestMapping("/buy/buylist.do")
	public String buyList(HttpServletRequest req,Model model, @RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {
		
	Member m = (Member)req.getSession().getAttribute("member");	
	
	
	int numPerPage =5;
	
	int totalContents = buyService.selectTotalContents();
	
	String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "/playduck/buy_list/buylist.do");
	
	List<BuyList>blist = buyService.selectBuyList(m,cPage,numPerPage);	
		
		System.out.println(blist);
		
		model.addAttribute("blist",blist);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		return"buy_list";
	}
	@RequestMapping("/buy/buycancel.do")
	public String buyCancel(@RequestParam int o_no){
		
		
		int result = buyService.buyCancel(o_no);
		
		
		
		return"redirect:/buy/buylist.do";
	}
	
	@RequestMapping("/buy/buyreturn.do")
	public String buyReturn(@RequestParam int o_no) {
		
		
		
		int result = buyService.buyReturn(o_no);
		
		return"redirect:/buy/buylist.do";
	}
	
	
	
}
