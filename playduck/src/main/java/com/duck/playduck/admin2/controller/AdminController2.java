package com.duck.playduck.admin2.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.duck.playduck.admin.model.vo.UtilsAdmin;
import com.duck.playduck.admin2.service.AdminService2;
import com.duck.playduck.md.model.vo.Md;
import com.duck.playduck.md.model.vo.Stock;
import com.duck.playduck.play.controller.Utils;

@Controller
public class AdminController2 {

	@Autowired
	AdminService2 adminService;

	// 리뷰 리스트 가져오기
	@RequestMapping("/admin2/reviewList.do")
	public String salesList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		int numPerPage = 10;

		List<Map<String, String>> list = adminService.selectReviewList(cPage, numPerPage);

		int totalContents = adminService.selectReviewTotalContents();

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "reviewList.do");

		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/reviewList";
	}

	// 검색 한 리뷰 리스트 가져오기
	@RequestMapping("/admin2/reviewSr.do")
	public String reviewSr(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model,
			@RequestParam(required = false) String text) {

		int numPerPage = 10;

		List<Map<String, String>> list = adminService.reviewSr(cPage, numPerPage, text);

		int totalContents = adminService.selectreviewSrTotalContents(text);

		String pageBar = UtilsAdmin.getPageBar(totalContents, cPage, numPerPage, "reviewSr.do", text);

		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/reviewList";
	}

	// 리뷰 삭제하기
	@RequestMapping("/admin2/reviewDe.do")
	public String deleteReview(@RequestParam int r_no) {

		int r = adminService.deleteReview(r_no);

		return "redirect:/admin2/reviewList.do";
	}

	@RequestMapping("/admin2/mdEnroll.do")
	public String mdEnroll() {

		return "admin/productEnList";
	}

	// 상품 인서트 하기
	@RequestMapping(value = "/admin2/mdEnIn.do", method = RequestMethod.POST)
	public String mdEnIn(@RequestParam String name, @RequestParam int price, @RequestParam int quan,
			@RequestParam("mainP") MultipartFile mainP, @RequestParam("detailP") MultipartFile detailP,
			HttpServletRequest req) {

		Md m = new Md();

		String savePath = req.getServletContext().getRealPath("/resources/mdImg");

		if (mainP.isEmpty() == false) {

			String originName = mainP.getOriginalFilename(); // 파일 원래 이름
			String changeName = fileNameChanger(originName);

			try {
				mainP.transferTo(new File(savePath + "/" + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			m.setD_pic(changeName);
		}

		if (detailP.isEmpty() == false) {

			String originName = detailP.getOriginalFilename(); // 파일 원래 이름
			String changeName = fileNameChanger(originName);

			try {
				detailP.transferTo(new File(savePath + "/" + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			m.setD_detail(changeName);
		}

		m.setD_price(price);
		m.setD_title(name);
		m.setB_quan(quan);

		int result = adminService.insertMd(m);

		if (result > 0) {
			int a = adminService.insertStock(quan);
		}

		return "redirect:/admin2/mdListPage.do";
	}

	// 상품 이름 바꾸기
	public String fileNameChanger(String oldFileName) {

		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int) (Math.random() * 1000);

		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;

	}

	// MD 리스트 가져오기
	@RequestMapping(value = "/admin2/mdListPage.do")
	public String mdListPage(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		int numPerPage = 3;

		List<Map<String, String>> list = adminService.mdListPage(cPage, numPerPage);
		List<Stock> list1 = new ArrayList<Stock>();

		list1 = adminService.stockM();
		int totalContents = adminService.selectMdListPage();

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "mdListPage.do");

		model.addAttribute("list1", list1);
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/mdList";
	}

	// 검색 한 MD 리스트 가져오기
	@RequestMapping("/admin2/MdSr.do")
	public String MDSr(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model,
			@RequestParam(required = false) String text) {

		int numPerPage = 3;

		List<Map<String, String>> list = adminService.MDSr(cPage, numPerPage, text);

		List<Stock> list1 = new ArrayList<Stock>();

		list1 = adminService.StockMdSer(text);

		int totalContents = adminService.selectMdSrTotalContents(text);

		String pageBar = UtilsAdmin.getPageBar(totalContents, cPage, numPerPage, "MdSr.do", text);

		model.addAttribute("list1", list1);
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/mdList";
	}

	// MD 상품 정보 가져오기
	@RequestMapping("/admin2/updateMD")
	public String updateMD(@RequestParam int d_no, Model model) {

		Md m = new Md();

		m = adminService.selectUpdateMD(d_no);

		Stock s = new Stock();
		s = adminService.selectUpateSt(d_no);

		model.addAttribute("s", s);
		model.addAttribute("m", m);

		return "admin/productEnList";
	}

	// 수정 한 상품 정보 업데이트
	@RequestMapping("/admin2/mdEnUpIn.do")
	public String mdEnUpIn(@RequestParam String name, @RequestParam int price, @RequestParam int quan,
			@RequestParam("mainP") MultipartFile mainP, @RequestParam("detailP") MultipartFile detailP,
			@RequestParam int d_no, HttpServletRequest req) {

		Md m = new Md();

		String savePath = req.getServletContext().getRealPath("/resources/mdImg");

		if (mainP.isEmpty() == false) {

			String originName = mainP.getOriginalFilename(); // 파일 원래 이름
			String changeName = fileNameChanger(originName);

			try {
				mainP.transferTo(new File(savePath + "/" + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			m.setD_pic(changeName);
		}

		if (detailP.isEmpty() == false) {

			String originName = detailP.getOriginalFilename(); // 파일 원래 이름
			String changeName = fileNameChanger(originName);

			try {
				detailP.transferTo(new File(savePath + "/" + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			m.setD_detail(changeName);
		}

		m.setD_price(price);
		m.setD_title(name);
		m.setB_quan(quan);
		m.setD_no(d_no);

		int result = adminService.upDateMd(m);

		Stock s = new Stock();
		s.setD_no(d_no);
		s.setD_quan(quan);

		if (result > 0) {
			int a = adminService.upDateStock(s);
		}

		return "redirect:/admin2/mdListPage.do";
	}

	// 판매 리스트 가져오기
	@RequestMapping("/admin2/saleList.do")
	public String saleList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		int numPerPage = 4;

		List<Map<String, String>> list = adminService.saleList(cPage, numPerPage);

		int totalContents = adminService.selectSaleList();

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "saleList.do");

		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/salesList";
	}

	// 검색 한 상품리스트 가져오기
	@RequestMapping("/admin2/OrSe.do")
	public String OrSe(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model,
			@RequestParam(required = false) String text) {

		int numPerPage = 4;

		List<Map<String, String>> list = adminService.saleSeList(cPage, numPerPage, text);
	
		int totalContents = adminService.selectSaleListCount(text);
		
		String pageBar = UtilsAdmin.getPageBar(totalContents, cPage, numPerPage, "OrSe.do", text);
	
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/salesList";
	}
}
