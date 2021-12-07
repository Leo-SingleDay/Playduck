package com.duck.playduck.play.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.duck.playduck.main.model.vo.Main;
import com.duck.playduck.play.model.service.DetailService;
import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.review.model.vo.PlayDetail;
import com.duck.playduck.review.model.vo.Review;

@Controller
public class DetailController {
	
	@Autowired
	DetailService detailservice;
	
	private static String getTagValue (String tag, Element eElement) {
		
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		
		Node nValue = (Node) nlList.item(0);
		if(nValue == null)
			return null;
		return nValue.getNodeValue();
		}
	

	@RequestMapping("/detail/detail.do")
	public String selectDetailOne(Model model, 
			@RequestParam String p_no
			) {
		
			 System.out.println("p_no = " + p_no);

		
		 ArrayList dlist = new ArrayList();
		 
		 
		
		 PlayDetail playDetail = detailservice.selectPDOne(p_no);
		 Play play = detailservice.selectPlayOne(p_no);
			System.out.println("플레이디테일 : " + playDetail);
		
			try {

				String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + p_no + "?service=a9cdb9930f1b43a38943f5f4168c74c0";
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder =dbFactoty.newDocumentBuilder();
				Document doc =dBuilder.parse(url);
				
				doc.getDocumentElement().normalize();
				
				NodeList nList =doc.getElementsByTagName("db");
				
				for(int temp=0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE) {
						
						Element eElement = (Element) nNode;
						
						dlist.add(getTagValue("prfnm", eElement));
						dlist.add(getTagValue("poster", eElement));
						dlist.add(getTagValue("genrenm", eElement));
						dlist.add(getTagValue("fcltynm", eElement));
						dlist.add(getTagValue("prfruntime", eElement));
						dlist.add(getTagValue("entrpsnm", eElement));
						dlist.add(getTagValue("prfpdfrom", eElement));
						dlist.add(getTagValue("prfpdto", eElement));
						dlist.add(getTagValue("prfcast", eElement));
						
//					System.out.println(plist);
//					System.out.println(plist2);
					
						
					}	
					
				}
				


			} catch (Exception e) {
				e.printStackTrace();
			}
				
			
				
				model.addAttribute("dlist", dlist);
				model.addAttribute("playDetail", playDetail);
				model.addAttribute("play", play);

		return "detail";
	}
	
	@RequestMapping("/review/tab_goodReview.do")
	public String selectGoodReview(Model model, 
			@RequestParam String p_no,
			@RequestParam(required=false, defaultValue="0") int m_no
			) {
		
		Map<String, Object> rmap = new HashMap<>();
		rmap.put("p_no", p_no);
		rmap.put("m_no", m_no);
		
		List<Review> rlist = new ArrayList<Review>();
		rlist = detailservice.selectGoodReview(rmap);
		
		System.out.println(rlist);
		model.addAttribute("rlist", rlist);
		
		return "tab_goodReview";
	}
	
	@RequestMapping("/review/tab_badReview.do")
	public String selectBadReview(Model model, 
			@RequestParam String p_no,
			@RequestParam(required=false, defaultValue="0") int m_no
			) {
		
		Map<String, Object> rmap = new HashMap<>();
		rmap.put("p_no", p_no);
		rmap.put("m_no", m_no);
		
		List<Review> rlist2 = new ArrayList<Review>();
		rlist2 = detailservice.selectBadReview(rmap);
		model.addAttribute("rlist2", rlist2);
		System.out.println(rlist2);
		
		return "tab_badReview";
	}
	
	  @RequestMapping("/review/reviewDelete.do")
		public String deleteReview(Model model, 
				@RequestParam int r_no){
	    
		detailservice.deleteReview(r_no);
		
		
		
		  String loc = "/";
		  String msg = "리뷰가 삭제되었습니다.";
		  
		  model.addAttribute("loc",loc);
		  model.addAttribute("msg",msg);
		 
		
		  return "common/msg";
		}
	
	  @RequestMapping("/review/reviewDuplicate.do")
	  @ResponseBody
		public int reviewDupl(Model model, 
				@RequestParam String p_no,
				@RequestParam(required=false, defaultValue="0") int m_no){
	    
		  Map<String, Object> rmap = new HashMap<>();
			rmap.put("p_no", p_no);
			rmap.put("m_no", m_no);
		  
		int result = detailservice.reviewDupl(rmap);
			
			return result;
		}

	  @RequestMapping("/review/reviewLike.do")
	  @ResponseBody
		public int likeInsert(Model model, 
				@RequestParam int r_no,
				@RequestParam(required=false, defaultValue="0") int m_no){
		  
		  System.out.println(r_no);
		  System.out.println(m_no);
		  
		  Map<String, Object> lmap = new HashMap<>();
		  lmap.put("r_no", r_no);
		  lmap.put("m_no", m_no);
	    
		detailservice.likeInsert(lmap);
		detailservice.likeInsert2(lmap);
		
		int result = detailservice.likeCount(lmap);
			
			return result;
		}
	
	  
	  @RequestMapping("/review/reviewLikeDelete.do")
	  @ResponseBody
		public int likeDelete(Model model, 
				@RequestParam int r_no,
				@RequestParam(required=false, defaultValue="0") int m_no){
		  
		  System.out.println("delete r_no : "+r_no);
		  System.out.println("delete m_no : "+m_no);
		  
		  Map<String, Object> lmap = new HashMap<>();
		  lmap.put("r_no", r_no);
		  lmap.put("m_no", m_no);
	    
		detailservice.likeDelete(lmap);
		detailservice.likeDelete2(lmap);
		
		int result = detailservice.likeCount(lmap);
			
			return result;
		}

	  @RequestMapping("/review/likecheck.do")
	  @ResponseBody
		public int likeCheck(Model model, 
				@RequestParam String r_no,
				@RequestParam int m_no
				) {
			
		  System.out.println(r_no);
		  System.out.println(m_no);
			Map<String, Object> rmap = new HashMap<>();
			rmap.put("r_no", r_no);
			rmap.put("m_no", m_no);
			
			int result = detailservice.selectLikecheck(rmap);
			
			
			return result;
		}

	  @RequestMapping("/review/reviewHate.do")
	  @ResponseBody
		public int HateInsert(Model model, 
				@RequestParam int r_no,
				@RequestParam(required=false, defaultValue="0") int m_no){
		  
		  System.out.println(r_no);
		  System.out.println(m_no);
		  
		  Map<String, Object> lmap = new HashMap<>();
		  lmap.put("r_no", r_no);
		  lmap.put("m_no", m_no);
	    
		detailservice.HateInsert(lmap);
		detailservice.HateInsert2(lmap);
		
		int result = detailservice.HateCount(lmap);
			
			return result;
		}
	
	  
	  @RequestMapping("/review/reviewHateDelete.do")
	  @ResponseBody
		public int HateDelete(Model model, 
				@RequestParam int r_no,
				@RequestParam(required=false, defaultValue="0") int m_no){
		  
		  System.out.println("delete r_no : "+r_no);
		  System.out.println("delete m_no : "+m_no);
		  
		  Map<String, Object> lmap = new HashMap<>();
		  lmap.put("r_no", r_no);
		  lmap.put("m_no", m_no);
	    
		detailservice.HateDelete(lmap);
		detailservice.HateDelete2(lmap);
		
		int result = detailservice.HateCount(lmap);
			
			return result;
		}

	  @RequestMapping("/detail/bookmarkcheck.do")
	  @ResponseBody
		public int detailBookmarkCheck(Model model, 
				@RequestParam String p_no,
				@RequestParam int m_no){
		  
		  System.out.println(p_no + "/"+ m_no);
		  
		  Map<String, Object> rmap = new HashMap<>();
		  rmap.put("p_no", p_no);
		  rmap.put("m_no", m_no);
	  
		  
		int result = detailservice.detailBookmarkCheck(rmap);
			
			return result;
		}

}

