package com.duck.playduck.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.duck.playduck.curation.model.vo.Curation;
import com.duck.playduck.main.model.service.MainService;
import com.duck.playduck.md.model.vo.mReward;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.review.model.vo.Review;

@Controller
public class mainController {

	@Autowired
	MainService mainservice;

	// 공공 데이터를 xml 파싱 시 무조건 선언 해야 함
	private static String getTagValue(String tag, Element eElement) {

		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

	// 메인페이지 리뷰가 많은 순으로 10개 뽑기
	@RequestMapping("/main/mainReviewTop10.do")
	@ResponseBody
	public Map<String, List> ReviewTop10() {
		List<Review> list = new ArrayList<Review>();

		list = mainservice.ReviewTop10();

		List<Play> plist = new ArrayList<Play>();

		plist = mainservice.playgb();

		List listg = new ArrayList();

		for (Play p : plist) {

			listg.add(p.getP_good());

		}

		List<String> list1 = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		List<String> list3 = new ArrayList<String>();
		Map<String, List> map = new HashMap<String, List>();

		for (Review i : list) {
			try {

				String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + i.getP_no()
						+ "?service=f6ad9fc845404d7db3617fe6ebac38a7";

				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				doc.getDocumentElement().normalize();

				NodeList nList = doc.getElementsByTagName("db");

				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) nNode;

						list1.add(getTagValue("prfnm", eElement));
						list2.add(getTagValue("poster", eElement));
						list3.add(getTagValue("mt20id", eElement));

						// list1.add(map);
						// map.put("title", getTagValue("prfnm", eElement));
						// map.put("poster", getTagValue("poster", eElement));
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		map.put("grade", listg);
		map.put("title", list1);
		map.put("poster", list2);
		map.put("pnum", list3);

		return map;
	}

	// 큐레이션 최신순으로 6개 뽑기
	@RequestMapping("/main/curationforDuck.do")
	@ResponseBody
	public Map<String, List> curationforDuck() {

		List<Curation> list = new ArrayList<Curation>();

		list = mainservice.curationforDuck();

		Map<String, List> map = new HashMap<String, List>();

		List listC = new ArrayList();
		List<String> listT = new ArrayList<String>();
		List<String> listP = new ArrayList<String>();

		for (Curation c : list) {
			listC.add(c.getC_no());
			listT.add(c.getC_title());
			listP.add(c.getC_picrenamed());
		}

	
		map.put("Cnum", listC);
		map.put("title", listT);
		map.put("pic", listP);

		return map;
	}

	// 리뷰에 좋아요 + 싫어요 순으로 3개 뽑기
	@RequestMapping("/main/mainHotReview.do")
	@ResponseBody
	public Map<String, List<String>> mainHotReview() {

		List<Review> list = new ArrayList<Review>();

		list = mainservice.HotReview();

		List<String> listmp = new ArrayList<String>();

		listmp = mainservice.memberpic();

		List<String> list0 = new ArrayList<String>();

		for (String mp : listmp) {
			if(mp == null) {
				list0.add("nopic.jpg");
			}else if (mp != null){
				list0.add(mp);
			}
			
		}

		Map<String, List<String>> map = new HashMap<String, List<String>>();

		List<String> list1 = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		List<String> list3 = new ArrayList<String>();
		for (Review i : list) {
			try {

				String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + i.getP_no()
						+ "?service=f6ad9fc845404d7db3617fe6ebac38a7";

				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				doc.getDocumentElement().normalize();

				NodeList nList = doc.getElementsByTagName("db");

				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) nNode;

						list1.add(i.getR_content());
						list2.add(getTagValue("poster", eElement));
						list3.add(i.getP_no());
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	
		map.put("pic", list0);
		map.put("content", list1);
		map.put("poster", list2);
		map.put("pnum", list3);
		
		return map;
	}

	@RequestMapping("/main/mainGenreM.do")
	@ResponseBody
	public Map<String, List> genreM(@RequestParam int m_no) {

		List<Play> list = new ArrayList<Play>();

		list = mainservice.allPlaySelect();

		List<String> tlist = new ArrayList<String>();
		List glist = new ArrayList();
		List<String> ilist = new ArrayList<String>();
		List<String> plist = new ArrayList<String>();

		List<String> genrenm = new ArrayList<String>();

		Map<String, List> map = new HashMap<String, List>();
		for (Play p : list) {
			try {

				String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + p.getP_no()
						+ "?service=f6ad9fc845404d7db3617fe6ebac38a7";

				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				doc.getDocumentElement().normalize();

				NodeList nList = doc.getElementsByTagName("db");

				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) nNode;

						if (0 == m_no) {

							tlist.add(getTagValue("prfnm", eElement));
							glist.add(p.getP_good());
							ilist.add(getTagValue("poster", eElement));
							plist.add(getTagValue("mt20id", eElement));
						}

						if (m_no > 0) {

							List<Member> mlist = mainservice.memberGenrenmG(m_no);

							for (int i = 0; i < mlist.get(0).getM_genre().length; i++) {

								if (mlist.get(0).getM_genre()[i].equals(getTagValue("genrenm", eElement))) {
									tlist.add(getTagValue("prfnm", eElement));
									glist.add(p.getP_good());
									ilist.add(getTagValue("poster", eElement));
									plist.add(getTagValue("mt20id", eElement));

								}
							}
						}
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		map.put("title", tlist);
		map.put("grade", glist);
		map.put("poster", ilist);
		map.put("pnum", plist);

		return map;
	}

	// BOOKMARK에 P_NO 있는 지 확인
	@RequestMapping("/main/bookmarkcheck.do")
	@ResponseBody
	public List<String> BookMarkC(@RequestParam(value = "p_num[]") List<String> p_no,
			@RequestParam(value = "m_no") int m_no) {

		List<Bookmark> list = new ArrayList<Bookmark>();

		list = mainservice.BookMarkC(m_no);

		List<String> listp = new ArrayList<String>();

		for (Bookmark b : list) {
			for (String p : p_no) {
				String convert_clist = String.valueOf(p);
				if (b.getP_list() != null && b.getP_list().equals(convert_clist)) {
					listp.add(convert_clist);
				}
			}
		}

		return listp;
	}

	// BOOKMARK에 P_NO 인서트
	// return 값이 String 이면 텍스트가 깨질 수 있기 때문에 produces를 선언해야 함
	@RequestMapping(value = "/main/MBookMarkIn.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String MBookMarkIn(@RequestParam int m_no, @RequestParam String p_no) {

		Bookmark b = new Bookmark();

		b.setM_no(m_no);
		b.setP_list(p_no);

		int result = mainservice.insertBM(b);

		String title = "";

		try {

			String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + p_no
					+ "?service=f6ad9fc845404d7db3617fe6ebac38a7";

			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			doc.getDocumentElement().normalize();

			NodeList nList = doc.getElementsByTagName("db");

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;

					title = (getTagValue("prfnm", eElement));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return title;
	}

	// BOOKMARK 에 P_NO 삭제
	// return 값이 String 이면 텍스트가 깨질 수 있기 때문에 produces를 선언해야 함
	@RequestMapping(value = "/main/MBookMarkDe.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String MBookMarkDe(@RequestParam int m_no, @RequestParam String p_no) {

		Bookmark b = new Bookmark();

		b.setM_no(m_no);
		b.setP_list(p_no);

		int result = mainservice.insertDe(b);

		String title = "";

		try {

			String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + p_no
					+ "?service=f6ad9fc845404d7db3617fe6ebac38a7";

			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			doc.getDocumentElement().normalize();

			NodeList nList = doc.getElementsByTagName("db");

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;

					title = (getTagValue("prfnm", eElement));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return title;
	}

	// BOOKMARK에 C_NUM 확인
	@RequestMapping("/main/bookmarkcheckC.do")
	@ResponseBody
	public List<String> bookmarkcheckC(@RequestParam(value = "c_num[]") List<Integer> c_no,
			@RequestParam(value = "m_no") int m_no) {

		List<Bookmark> list = new ArrayList<Bookmark>();

		list = mainservice.BookMarkCL(m_no);

		List<String> listc = new ArrayList<String>();

		for (Bookmark b : list) {
			for (Integer c : c_no) {
				String convert_clist = String.valueOf(c);

				if (b.getC_list() != null && b.getC_list().equals(convert_clist)) {
					listc.add(convert_clist);
				}
			}
		}

		return listc;

	}

	// BOOKMARK에 C_NUM 인서트
	// return 값이 String 이면 텍스트가 깨질 수 있기 때문에 produces를 선언해야 함
	@RequestMapping(value = "/main/CBookMarkIn.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String CBookMarkIn(@RequestParam int m_no, @RequestParam String c_no) {

		c_no = c_no.replace("c", "");

		Bookmark b = new Bookmark();

		b.setC_list(c_no);
		b.setM_no(m_no);

		int result = mainservice.CBookMarkIn(b);

		String title = mainservice.curationforDuck(Integer.parseInt(c_no));

		return title;
	}

	// BOOKMARK에 C_NUM 딜리트
	// return 값이 String 이면 텍스트가 깨질 수 있기 때문에 produces를 선언해야 함
	@RequestMapping(value = "/main/CBookMarkDe.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String CBookMarkDe(@RequestParam int m_no, @RequestParam String c_no) {

		c_no = c_no.replace("c", "");

		Bookmark b = new Bookmark();

		b.setC_list(c_no);
		b.setM_no(m_no);

		int result = mainservice.CBookMarkDe(b);

		String title = mainservice.curationforDuck(Integer.parseInt(c_no));

		return title;
	}
	
	// 메인페이지에 회원 로그인 시 리워드 점수 가져오기
	@RequestMapping("/main/mainCuButton.do")
	@ResponseBody
	public int mainCuButton(@RequestParam int m_no) {
		
		List<mReward> re = new ArrayList<mReward>();
		
		re = mainservice.mainCuButton(m_no);
		
		
		int renum = 0;
		for (mReward r : re) {
			if(r.getW_up() != 0) {
				renum += r.getW_up();
			}
			
		}
		
		
		return renum;
	}
	
	// 작성한 리뷰가 있는 지 확인 
	@RequestMapping("/main/reviewCheck.do")
	@ResponseBody
	public int reviewCheck(@RequestParam int m_no, @RequestParam String p_num) {
		
		Review r = new Review();
		
		r.setM_no(m_no);
		r.setP_no(p_num);
		
		int result = mainservice.reviewCheck(r);
		
		System.out.println("카운트 : " + result);
		return result;
	}
}
