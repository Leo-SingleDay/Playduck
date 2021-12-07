package com.duck.playduck.curation.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.duck.playduck.curation.model.service.CurationService;
import com.duck.playduck.curation.model.vo.Curation;
import com.duck.playduck.md.controller.Utils;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.md.controller.Utils_search;
import com.duck.playduck.play.model.vo.Bookmark;

@Controller
public class CurationController {
	
	@Autowired
	CurationService curationService;
	
	@RequestMapping("/curation/curationForm.do")
	public String curationForm() {
		
		return "Curation_write";
		
	}
	
	@RequestMapping("/curation/curationWrite.do")
	public String insertCuration(Curation curation, Model model, HttpServletRequest req,
			@RequestParam(value="c_pic_file") MultipartFile[] upFiles) {

		
		// 1. 파일 저장 경로 및 파일 정보를 담을 객체 생성
			String savePath = req.getServletContext().getRealPath("/resources/curation");
			
			
			String originName = null;
			String changeName = null;
			
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
									
				// 4. curation 에 담기
					
					curation.setC_pic(originName);
					curation.setC_picrenamed(changeName);	
					
				}
						
			}
			System.out.println(curation);
			// 5. DB에 저장
			int result = curationService.insertCuImg(curation);	// int로 결과 출력
			
			model.addAttribute("curation", curation);
			
			/******************************************/
			System.out.println(curation);
			
			// c_no 불러오기
			
			int C = curationService.getC()-1;

			String loc = "/curation/curationSelectOne.do?c_no=" + C ;
			String msg = "리뷰작성 완료";
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg" ,msg);
			
			return "common/msg";
				
	}

	public String fileNameChanger(String oldFileName) {

			String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd = (int)(Math.random() * 1000);

			return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
			
		}

	@RequestMapping("/curation/culist.do")
	public String selectPlayList(Model model, HttpServletRequest req,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage){
		
		// 한 페이지당 페이지 수
				int numPerPage = 6;
				
				// 현재 페이지의 게시글 수
				//List<Map<String, String>> list = curationService.selectBoardList(cPage, numPerPage);
				
				// 전체 개시글 수
				int totalContents = curationService.selectTotalCuration();
				
				// 페이지 처리 HTML 생성하기
				String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "/playduck/curation/culist.do");
				
		Member m = (Member)req.getSession().getAttribute("member");

		int m_no = 0;
		if (m != null) {
		m_no = m.getM_no();
		}
		
		System.out.println(m_no);
		
		List<Bookmark> blist = curationService.selectBookList(m_no);
		
		List<Curation> culist = curationService.selectCurationList(cPage, numPerPage);
		
		System.out.println("blist : " + blist);
		
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("culist", culist);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("blist", blist);
		return"Cu_list";
	}
	
	@RequestMapping("/curation/culistsort1.do")
	public String culistsort1(Model model,HttpServletRequest req,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage){
		
		// 한 페이지당 페이지 수
		int numPerPage = 6;
		
		// 현재 페이지의 게시글 수
		//List<Map<String, String>> list = curationService.selectBoardList(cPage, numPerPage);
		
		// 전체 개시글 수
		int totalContents = curationService.selectTotalCuration();
		
		// 페이지 처리 HTML 생성하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "/playduck/curation/culistsort1.do");
		Member m = (Member)req.getSession().getAttribute("member");

		int m_no = 0;
		if (m != null) {
		m_no = m.getM_no();
		}
		
		
		List<Bookmark> blist = curationService.selectBookList(m_no);
		
		List<Curation> culist = curationService.selectCurationList1(cPage, numPerPage);
		System.out.println("culist : " + culist);

		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("culist", culist);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("blist", blist);

		return"Cu_list";
	}
	
	@RequestMapping("/curation/culistsort2.do")
	public String culistsort2(Model model,HttpServletRequest req,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage){
		
		// 한 페이지당 페이지 수
		int numPerPage = 6;
		
		// 현재 페이지의 게시글 수
		//List<Map<String, String>> list = curationService.selectBoardList(cPage, numPerPage);
		
		// 전체 개시글 수
		int totalContents = curationService.selectTotalCuration();
		
		// 페이지 처리 HTML 생성하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "/playduck/curation/culistsort2.do");
		Member m = (Member)req.getSession().getAttribute("member");

		int m_no = 0;
		if (m != null) {
		m_no = m.getM_no();
		}
		
		List<Bookmark> blist = curationService.selectBookList(m_no);
		
		List<Curation> culist = curationService.selectCurationList2(cPage, numPerPage);

		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("culist", culist);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("blist", blist);

		return"Cu_list";
	}

	
	@RequestMapping("curation/curationSelectOne.do")
	public String curationSelectOne(Model model,
			@RequestParam int c_no){

		
		Curation culist = curationService.curationSelectOne(c_no);
		model.addAttribute("culist", culist);
		
		
		return "Curation_detail";
	}
	
	@RequestMapping("/curation/curationUpdateView.do")
	public String curationUpdateView(@RequestParam int c_no, Model model) {
		
		Curation culist = curationService.curationSelectOne(c_no);
		model.addAttribute("culist", culist);
		
		return "Curation_modify";
		
	}
	
	@RequestMapping("/curation/curationUpdate.do")
	public String curationUpdate(@RequestParam int c_no, Curation curation, Model model, HttpServletRequest req,
			@RequestParam(value="c_pic_file",  required=false) MultipartFile upFiles,
			@RequestParam String c_title,
			@RequestParam String c_content) {
		
		Curation culist = curationService.curationSelectOne(c_no);

		// 1. 원본 게시글 불러와 수정하기

				String savePath = req.getServletContext().getRealPath("/resources/curation");
				
				// 2. 첨부파일 변경하기
				if(upFiles.isEmpty() == false) {
					
					String originName = upFiles.getOriginalFilename(); // 파일 원래 이름
					String changeName = fileNameChanger(originName);
					
					try {
						upFiles.transferTo(new File(savePath + "/" + changeName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					

					curation.setC_picrenamed(changeName);
				}else {
					curation.setC_picrenamed(culist.getC_picrenamed());
				}
				
			
			// 5. DB에 저장
			int result = curationService.curationUpdate(curation);	// int로 결과 출력
			
			curation.setC_title(c_title);
			curation.setC_content(c_content);
			

			
			/******************************************/
			System.out.println(curation);

			model.addAttribute("msg", "수정 완료");
			model.addAttribute("loc", "/curation/curationSelectOne.do?c_no=" + c_no);
			
		
		return "common/msg";
		
	}
	
	@RequestMapping("/curation/curationDelete.do")
	public String curationDelete(@RequestParam int c_no, 
			                  HttpServletRequest req, Model model, Curation curation) {
		
		String savePath = req.getServletContext().getRealPath("/resources/curation");
		
		// 첨부파일 삭제 명단
		
		int result = curationService.curationDelete(c_no);
		
		String loc = "/curation/culist.do";
		String msg = "";
		
		if( result > 0) {
			msg = "삭제 완료!";
			
			
				new File(savePath + "/" + curation.getC_picrenamed()).delete();
			
			
		} else {
			msg = "삭제 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/curation/search_cu.do")
	public String search_cu(Model model,
			  @RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			  @RequestParam(defaultValue="") String keyword) throws Exception {
		
		// 한 페이지당 페이지 수
		int numPerPage = 12;
		
		// 현재 페이지의 게시글 수
		List<Map<String, String>> list = curationService.selectSearchList(keyword, cPage, numPerPage);
		
		System.out.println("큐레이션 검색 결과 : " + list);
		// 전체 개시글 수
		int totalContents2 = curationService.selectTotalContents2(keyword);
		
		// 페이지 처리 HTML 생성하기
		String pageBar = Utils_search.getPageBar(totalContents2, cPage, numPerPage, "/curation/search_cu.do", keyword);
		
		
		model.addAttribute("culist", list);
		model.addAttribute("totalContents", totalContents2);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("keyword", keyword);
		
		
		return "Cu_list";
	}
	
}
