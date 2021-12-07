package com.duck.playduck.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.review.model.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	private static String getTagValue (String tag, Element eElement) {
		
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		
		Node nValue = (Node) nlList.item(0);
		if(nValue == null)
			return null;
		return nValue.getNodeValue();
		}
	

	

	@RequestMapping("/review/reviewForm.do")
	public String ReviewForm(Model model,
			@RequestParam String p_no) {
		
		System.out.println(p_no);
		ArrayList rwlist = new ArrayList();
		
		try {
			
			String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/"+ p_no +"?service=a9cdb9930f1b43a38943f5f4168c74c0";
			
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder =dbFactoty.newDocumentBuilder();
			Document doc =dBuilder.parse(url);
			
			doc.getDocumentElement().normalize();
			
			NodeList nList =doc.getElementsByTagName("db");
			
			for(int temp=0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					
					Element eElement = (Element) nNode;
					
					rwlist.add(getTagValue("prfnm", eElement));
					rwlist.add(getTagValue("poster", eElement));
					
//				System.out.println(plist);
//				System.out.println(plist2);
				

				
				}	
				
			}

	} catch (Exception e) {
		e.printStackTrace();
	}
		
	
		model.addAttribute("p_no", p_no);
		model.addAttribute("rwlist", rwlist);

		
		return "reviewWrite";
	}

	@RequestMapping("/review/reviewWrite.do")
	public String insertReview(HttpServletRequest req,Model model, Play play,
				@RequestParam String p_no,
				@RequestParam String r_status,
				@RequestParam int pd_theater,
				@RequestParam int pd_story,
				@RequestParam int pd_producing,
				@RequestParam int pd_casting,
				@RequestParam String r_content) {
		
		System.out.println("리뷰 저장");

		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		Member m = (Member)req.getSession().getAttribute("member");
		
		System.out.println("멤버:"+ m);
		System.out.println("r_status"+r_status);
		map.put("p_no", p_no);
		map.put("m_no", m.getM_no());
		map.put("r_status", r_status);
		map.put("pd_theater", pd_theater);
		map.put("pd_story", pd_story);
		map.put("pd_producing", pd_producing);
		map.put("pd_casting", pd_casting);
		map.put("r_content", r_content);
		
		if(r_status.equals("1")) {
			
			reviewService.insertPGood(p_no);
			
		}else {
			
			reviewService.insertPBad(p_no);
			
		}
		
		
		reviewService.insertReview(map);
		reviewService.insertReview2(map);
		reviewService.insertReward(m.getM_no());
		
		String loc = "/detail/detail.do?p_no=" + p_no;
		String msg = "리뷰 작성 완료";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}

}
