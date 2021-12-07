package com.duck.playduck.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.duck.playduck.curation.model.vo.Curation;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.mypage.model.service.MypageService;
import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.review.model.vo.Review;



@SessionAttributes({"member"})
@Controller
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	
	private static String getTagValue (String tag, Element eElement) {
		
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		
		Node nValue = (Node) nlList.item(0);
		if(nValue == null)
			return null;
		return nValue.getNodeValue();
		}
	
	

	@RequestMapping("/mypage/mypage.do")
	public String mypage(HttpServletRequest req, Model model) {
		
		Member m = (Member)req.getSession().getAttribute("member");
		
		// 작성한 리뷰 개수 받아오기
		
		int review = mypageService.selectCount(m);
		
		System.out.println(m);
			
		// System.out.println("review결과 : " + review);
		model.addAttribute("review", review);
		
					
	// 내 리워드 받아오기
		int result = mypageService.countReward(m);
		int reward = 0;
		int rank = 0;
		
		if(result > 0) {
			reward = mypageService.selectReward(m);
			rank = mypageService.selectRank(m);
		}
		
		System.out.println("result 결과 : " + result);
		System.out.println("reward 결과 : " + reward);
		
		model.addAttribute("reward", reward);
		
	// 회원 등급 받아오기
		
		if(m.getM_status().equals("3")) {
			model.addAttribute("rank","관리자");
		}else {				
			if(rank >= 200) {
				model.addAttribute("rank", "파트너 큐레이터");
			} else{
				model.addAttribute("rank", "일반회원");
			}
		}
		
		// 생년월일 받아오기
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String[] dateArr = (transFormat.format(m.getM_date())).split("-");
		
		model.addAttribute("birth",dateArr);
		
		// 주소 받아오기
		String[] addArr=m.getM_address().split("/");
		model.addAttribute("addArr",addArr);
		
		// 연락처 받아오기
		String[] phoneArr = m.getM_phone().split("-");
		model.addAttribute("phoneArr",phoneArr);
		
		// 성별 trim해서 다시 넣기
		String gender = m.getM_gender().trim();
		model.addAttribute("gender", gender);
		
		// 선호장르 String화 하기
		List<String> genre = Arrays.asList(m.getM_genre());
		model.addAttribute("genre", genre);
		
		
		
		return "myPage";
	}
	
	// 프로필 이미지 DB에 INSERT
	@RequestMapping("/mypage/profileImg.do")
	public String profileImg(Model model, HttpServletRequest req, @RequestParam(value="profileImg", required=false) MultipartFile[] upFiles) {
		
		Member m = (Member)req.getSession().getAttribute("member");
		
		// 1. 파일 저장 경로 및 파일 정보를 담을 객체 생성
			String savePath = req.getServletContext().getRealPath("/resources/profileImg");
			
			
			String originName = null;
			String changeName = null;
			
			
			

			int review = mypageService.selectCount(m);
			
			System.out.println(m);
				
		
			model.addAttribute("review", review);
			
			int result2 = mypageService.countReward(m);
			int reward = 0;
			int rank = 0;
			
			if(result2 > 0) {
				reward = mypageService.selectReward(m);
				rank = mypageService.selectRank(m);
			}
			
			System.out.println("result 결과 : " + result2);
			System.out.println("reward 결과 : " + reward);
			
			model.addAttribute("reward", reward);
			
			System.out.println(m.getM_status());
			
			if(m.getM_status().equals("3")) {
				model.addAttribute("rank","관리자");
			}else {				
				if(rank >= 200) {
					model.addAttribute("rank", "파트너 큐레이터");
				} else{
					model.addAttribute("rank", "일반회원");
				}
			}
			
		// 2. 파일 업로드
			for(MultipartFile f : upFiles) {
				
				if(f.isEmpty() == false) {
					// 파일이 비어있지 않다면(파일이 존재한다면)
							
				// 3. 파일 이름 변경
					originName = f.getOriginalFilename(); // 파일 원래 이름
					changeName = fileNameChanger(originName); // 파일 이름 변경
					
					try {	// 파일이 존재하지 않거나 깨진 파일일 수 있으므로 트라이캐치!
							f.transferTo(new File(savePath + "/" + changeName));
									
					} catch (IllegalStateException | IOException e) {
		
							e.printStackTrace();
					}
									
				// 4. Member 에 담기
					
					m.setM_pic(originName);
					m.setM_picRenamed(changeName);	
					
				}
						
			}
		
			// 5. Member DB에 저장
			int result = mypageService.insertPfImg(m);	// int로 결과 출력
			
			model.addAttribute("member", m);
			
			/******************************************/
			
			
			
			return "myPage";
			
	}

	public String fileNameChanger(String oldFileName) {

			String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd = (int)(Math.random() * 1000);

			return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
			
		}
	
	// 000님이 작성한 리뷰 가져오는 부분
	@RequestMapping("/mypage/myReview.do")
	@ResponseBody
	public Map<String, List> myReview(@RequestParam int mm) {
		
		// 특정 회원이 작성한 리뷰의 공연 번호 받아오기
		List<Review> list = new ArrayList<Review>();
		
		list = mypageService.myReview(mm);
		
		// 특정 회원이 찜한 공연 목록 받아오기
		List<Bookmark> bookmark = mypageService.bookmarkPlay(mm);
		//System.out.println("bookmark 결과 : "+ bookmark);
		
		
		
		System.out.println("리스트 결과 : "+ list);
		
		List<String> list1 = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		List<String> list3 = new ArrayList<String>();
		
		Map<String, List> map = new HashMap<String, List>();
		
		for(Review i : list ) {
			try {

				String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/"+	i.getP_no()+"?service=f6ad9fc845404d7db3617fe6ebac38a7";
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder =dbFactoty.newDocumentBuilder();
				Document doc =dBuilder.parse(url);
				
				doc.getDocumentElement().normalize();
				
				
				NodeList nList =doc.getElementsByTagName("db");
				
				
				
				for(int temp=0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE) {
						
						Element eElement = (Element) nNode;
						
						list1.add(getTagValue("prfnm", eElement) );
						list2.add(getTagValue("poster", eElement) );	
						list3.add(i.getP_no());
					}	
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
			
		}	

		
		map.put("title", list1);
		map.put("poster", list2);
		map.put("pnum", list3);
		
		
		return map;
	}	
	
	// 찜한 공연 목록 불러오기
	@RequestMapping("/mypage/mybookmarkPlay.do")
	@ResponseBody
	public Map<String, List> mybookmarkPlay(@RequestParam int mm){
	
		// 특정 회원이 찜한 공연 목록 받아오기
		List<Bookmark> bookmark = mypageService.bookmarkPlay(mm);
		//System.out.println("bookmark 결과 : "+ bookmark);
		
		List<String> list1 = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		List<String> list3 = new ArrayList<String>();
	
		Map<String, List> map = new HashMap<String, List>();
	
		for(Bookmark bk : bookmark ) {
			try {

				String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/"+	bk.getP_list()+"?service=f6ad9fc845404d7db3617fe6ebac38a7";
				
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder =dbFactoty.newDocumentBuilder();
				Document doc =dBuilder.parse(url);
				
				doc.getDocumentElement().normalize();
				
				
				NodeList nList =doc.getElementsByTagName("db");
				
				
				
				for(int temp=0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE) {
						
						Element eElement = (Element) nNode;
						
						list1.add(getTagValue("prfnm", eElement) );
						list2.add(getTagValue("poster", eElement) );	
						list3.add(getTagValue("mt20id", eElement) );
					}	
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
			
		}	

		map.put("title1", list1);
		map.put("poster", list2);
		map.put("pnum", list3);

		return map;
	}
	
	// 특정 회원이 찜한 큐레이션 콘텐츠 목록 받아오기
	
	@RequestMapping("/mypage/mybookmarkContent.do")
	@ResponseBody
	public Map<String, List> mybookmarkContent(@RequestParam int mm){
		
		List<Curation> mycuration = mypageService.bookmarkCuration(mm);
		//System.out.println("mycuration 결과 : "+ mycuration);
		
		List<String> list1 = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		List<Integer> list3 = new ArrayList<Integer>();
	
		Map<String, List> map = new HashMap<String, List>();
		
		for(Curation c : mycuration) {
			
			if(c != null) {
				list1.add(c.getC_title());
				list2.add(c.getC_picrenamed());
				list3.add(c.getC_no());
			}
			
		}
		
		System.out.println("list2확인 : "+list2);
		map.put("title", list1);
		map.put("poster", list2);
		map.put("cu", list3);
		
		return map;
	
	}
	
	// 찜한 공연 삭제
	@RequestMapping("/mypage/deletePlay.do")
	public String deletePlay(Model model, @RequestParam String no) {
		
		int result = mypageService.deletePlay(no);
		
		System.out.println("삭제 결과 : " + result);
		
		
		return "redirect:/mypage/mypage.do";
	}
	
	// 찜한 큐레이션 삭제
	@RequestMapping("/mypage/deleteCuration.do")
	public String deleteCuration (Model model, @RequestParam int no) {
		
		int result = mypageService.deleteCuration(no);
		
		System.out.println("큐레이션 삭제 : " + result);
		
		
		return "redirect:/mypage/mypage.do";
		
	}
			
	
}
