
package com.duck.playduck.play.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duck.playduck.admin.model.vo.UtilsAdmin;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.play.model.compare.AscCount;
import com.duck.playduck.play.model.compare.AscRating;
import com.duck.playduck.play.model.compare.AscTitle;
import com.duck.playduck.play.model.compare.AscYear;
import com.duck.playduck.play.model.service.PlayService;
import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.play.model.vo.PlayAll;

@Controller
public class PlayController {
	
	@Autowired
	PlayService playService;
	
	
	@RequestMapping("/list/playlist.do")
	public String selectPlayList(HttpServletRequest req,Model model,@RequestParam(required = false, defaultValue = "0") int sortType,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage){
		
		Member m = (Member)req.getSession().getAttribute("member");	
		
		//한 페이지당 페이지수
		
		int numPerPage =24;
		
		int totalContents = playService.selectTotalContents();
		
		//페이지 처리 html 생성하기
		String pageBar = UtilsPlay.getPageBar(totalContents, cPage, numPerPage,sortType,"playlist.do");
		
		List<PlayAll> plist = playService.selectPlayList(cPage,numPerPage);
		
		int m1 = 0;
		if(m !=null) {
			 m1 = m.getM_no();
		}
		
		
		List<Bookmark> blist= playService.selectBlist(m1);
		
		System.out.println(plist);
		if(sortType==1) {
			plist.sort(new AscRating());
		}else if(sortType==2) {
			plist.sort(new AscCount());
		}
		else if(sortType==3) {
			plist.sort(new AscTitle());
		}else if(sortType==4) {
			plist.sort(new AscYear());
		}
		
		List list = new ArrayList();
		
		for (PlayAll p : plist) {
			for(Bookmark b : blist) {
				if(p.getP_no().equals(b.getP_list()) && b.getC_list() ==null) {
					list.add(p.getP_no());
									}
			}
		}
		System.out.println("찜:"+list);
		
		model.addAttribute("llist", list);
		model.addAttribute("plist", plist);
		model.addAttribute("numPerPage",numPerPage);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("pageBar",pageBar);
		return"list";
	}
	@RequestMapping("/list/playsr.do")
	public String playsr(Model model, @RequestParam(required = false) String text,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {
		
		int numPerPage =8;
		List<PlayAll>plist= playService.playsr(cPage,numPerPage,text);
		int totalContents = playService.playsrtotal(text);
		String pageBar = UtilsAdmin.getPageBar(totalContents, cPage, numPerPage, "playsr.do",text);
		model.addAttribute("plist",plist);
		model.addAttribute("numPerPage",numPerPage);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("pageBar",pageBar);
		return"list";
	}
	
}
