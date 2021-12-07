package com.duck.playduck.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duck.playduck.admin.model.service.AdminService;
import com.duck.playduck.admin.model.vo.Reward;
import com.duck.playduck.admin.model.vo.UtilsAdmin;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.orders.model.vo.BuyList;
import com.duck.playduck.play.controller.Utils;


@Controller
public class AdminController {

	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/adminpage/admin.do")
	public String memberadmin(Model model, @RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		
		int numPerPage = 10;
		
		
		
		List<Member>alist  = adminService.memberadmin(cPage,numPerPage);
		int totalContents = adminService.selectmemberTotal();
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "admin.do");
		
		List<Reward> rlist =  new ArrayList<Reward>();
		for (Member m : alist ) {
			int result =m.getM_no();
			
			 rlist.add(adminService.memberadminReward(result));
			
			System.out.println(rlist);
		}
		model.addAttribute("rlist",rlist);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/userList";
	}
	
	@RequestMapping("/adminpage/adminmembersr.do")
	public String memberadminsr(Model model,@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false) String text) {
		
		int numPerPage =10;
				
		
		List<Member>srlist = adminService.memberadminsr(cPage, numPerPage,text);
		int totalContents = adminService.selectmemberSrTotalContents(text);
		List<Reward> rlist =  new ArrayList<Reward>();
		for (Member m : srlist ) {
			int result =m.getM_no();
			
			 rlist.add(adminService.memberadminReward(result));
			
			System.out.println(rlist);
		}
		
		String pageBar = UtilsAdmin.getPageBar(totalContents, cPage, numPerPage, "adminmembersr.do",text);
		
		model.addAttribute("rlist",rlist);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("pageBar", pageBar);
		return"admin/userList";
	}
	
	
	@RequestMapping("/adminpage/adminmember.do")
	public String memberadmindelete(@RequestParam int m_no) {
	
		int result = adminService.memberadminDelete(m_no);
		
		return"redirect:/adminpage/admin.do";
	}
	@RequestMapping("/adminpage/admincancel.do")
	public String admincancel(Model model,@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		
		int numPerPage =10;
		
		int totalContents = adminService.selectcancelTotal();
		List<BuyList>clist = adminService.admincancel(cPage,numPerPage);
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "admincancel.do");
		model.addAttribute("clist",clist);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("pageBar", pageBar);
		return"admin/cancelList";
	}
	
	@RequestMapping("/adminpage/admincancelsr.do")
	public String admincancelsr(Model model,@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false) String text) {
		int numPerPage =10;
		List<BuyList>clist = adminService.admincancelsr(cPage,numPerPage,text);
		int totalContents = adminService.selectcancelsrTotal(text);
		String pageBar = UtilsAdmin.getPageBar(totalContents, cPage, numPerPage, "admincancelsr.do",text);
		model.addAttribute("clist",clist);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("pageBar", pageBar);
		return"admin/cancelList";
	}
	
	
	@RequestMapping("/adminpage/adminreturn.do")
	public String adminreturn(Model model, @RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		int numPerPage =10;
		List<BuyList> rlist = adminService.adminreturn(cPage,numPerPage);
		int totalContents = adminService.selectreturnTotal();
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adminreturn.do");
		
		model.addAttribute("rlist",rlist);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("pageBar", pageBar);
		return"admin/returnList";
	}
	
	@RequestMapping("/adminpage/adminreturnsr.do")
	public String adminreturnsr(Model model,@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false) String text) {
		int numPerPage =10;
		
		List<BuyList> rlist = adminService.adminreturnsr(cPage,numPerPage,text);
		int totalContents = adminService.selectreturnsrTotal(text);
		String pageBar = UtilsAdmin.getPageBar(totalContents, cPage, numPerPage, "adminreturnsr.do",text);
		System.out.println(rlist);
		model.addAttribute("rlist",rlist);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("pageBar", pageBar);
		return"admin/returnList";
	}
	@RequestMapping("/adminpage/adminretruncom.do")
	public String adminreturncom(Model model,@RequestParam int d_no) {
		
		
		
		
		adminService.updatereturn(d_no);
		
		
		return"admin/returnList";
	}
}
