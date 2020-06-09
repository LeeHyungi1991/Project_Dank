package dank.mvc.model;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dank.mvc.dao.LoanDao;
import dank.mvc.service.LoanService;
import dank.mvc.vo.LoanApplicationVO;
import dank.mvc.vo.LoanCheckVO;
import dank.mvc.vo.LoanFileVO;
import dank.mvc.vo.LoanProductVO;

@Controller
public class loanController {

	@Autowired
	private LoanDao loanDao;
	@Autowired
	private LoanService loanService;
	
	@RequestMapping(value = "/product")
	public String product(Model model) {
		List<LoanProductVO> list = loanDao.getLoanProductList();
		model.addAttribute("list", list);
		return "loan/product";
	}
	@RequestMapping(value = "/productinfo")
	public ModelAndView productinfo(int lp_num) {
		ModelAndView mav = new ModelAndView("loan/server/productserver");
		LoanProductVO vo = loanDao.getProductInfo(lp_num);
		StringBuilder info = new StringBuilder();
		info.append("<input type=\"hidden\" id=\"lp_num\" value=\""+lp_num+"\">");
		info.append("<div class=\"col-md-12\">");
		info.append("<h1 class=\"text-center\">").append(vo.getLp_name()).append("</h1><br>");
		info.append("</div><div class=\"col-md-12\">");
		info.append("<p class=\"text-center\">").append("이자율 : ").append(vo.getLp_interestrate()).append("%</p><br>");
		info.append("</div><div class=\"col-md-12\">");
		info.append("<p class=\"text-center\">").append("최대 대출 가능 금액 : ").append(vo.getLp_maximum()).append("원</p><br>");
		info.append("</div><div class=\"col-md-12\">");
		info.append("<p class=\"text-center\">").append("중도 해지 수수료 : ").append(vo.getLp_cancelfee()).append("%</p>");
		info.append("</div>");

		mav.addObject("info", info.toString());
		return mav;
	}

	@RequestMapping(value = "/application")
	public String application(Model model) {
		List<LoanProductVO> list = loanDao.getLoanProductList();
		model.addAttribute("list", list);
		return "loan/application";
	}

	@RequestMapping(value = "/applicationform")
	public String applicationform(Model model,int lp_num) {
		LoanProductVO vo = loanDao.getProductInfo(lp_num);
		System.out.println(vo.getLp_num());
		model.addAttribute("vo", vo);
		return "loan/applicationform";
	}

	@RequestMapping(value = "/applicationsuccess",method = RequestMethod.POST)
	public String applicationsuccess(int lp_num,LoanApplicationVO avo) {
		loanService.addloanaplication(avo, lp_num);
		return "loan/applicationsuccess";
	}

	@RequestMapping(value = "/check")
	public ModelAndView check() {
		ModelAndView mav = new ModelAndView("loan/check");
		List<LoanCheckVO> list =loanDao.checkdetailList();
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/checkdetail")
	public ModelAndView checkdetail(int lc_num) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loan/checkdetail");
		mav.addObject("vo",loanDao.checkdetail(lc_num));
		return mav;
	}
	@RequestMapping(value = "/checkfile")
	public ModelAndView checkfile(int lc_num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lc_num", lc_num);
		mav.setViewName("loan/checkfile");
		return mav;
	}
	@RequestMapping(value = "/checkrefile")
	public ModelAndView checkrefile(int lc_num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lc_num", lc_num);
		mav.setViewName("loan/checkrefile");
		return mav;
	}
	
	@RequestMapping(value = "/fileupload",method =  RequestMethod.POST)
	public ModelAndView fileupload(LoanFileVO vo,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:check");//view의 이름을 생성자의 인자값으로 지정
		HttpSession session = request.getSession();
		String r_path = session.getServletContext().getRealPath("/");
		String img_path ="resources\\upload\\";
		
		 try {
			 File ff = null; 
			 ff = new File(r_path+img_path+vo.getLc_num());
			 if(!ff.exists()) {
				 ff.mkdirs();
			 }
			 
			 int file1 = vo.getMfile1().getOriginalFilename().lastIndexOf( "." );;
			 if (file1!=-1) {
			 String ext = vo.getMfile1().getOriginalFilename().substring(file1);
			 StringBuffer path1 = new StringBuffer();
			 path1.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile1().getOriginalFilename());
			 System.out.println(path1.toString());
			 ff = new File(path1.toString());
			 vo.getMfile1().transferTo(ff);
			 vo.setFile1(vo.getMfile1().getOriginalFilename());
		}
			 int file2 = vo.getMfile2().getOriginalFilename().lastIndexOf( "." );;
			 if (file2!=-1) {
			 String ext = vo.getMfile2().getOriginalFilename().substring( file2 );
			 StringBuffer path2 = new StringBuffer();
			 path2.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile2().getOriginalFilename());
			 ff = new File(path2.toString());
			 vo.getMfile2().transferTo(ff);
			 vo.setFile2(vo.getMfile2().getOriginalFilename()); 
		}

			 int file3 = vo.getMfile3().getOriginalFilename().lastIndexOf( "." );;
			 if (file3!=-1) {
			 String ext = vo.getMfile3().getOriginalFilename().substring( file3 );
			 StringBuffer path3 = new StringBuffer();
			 path3.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile3().getOriginalFilename());
			 ff = new File(path3.toString());
			 vo.getMfile3().transferTo(ff);
			 vo.setFile3(vo.getMfile3().getOriginalFilename());
		}
			 int file4 = vo.getMfile4().getOriginalFilename().lastIndexOf( "." );;
			 if (file4!=-1) {
			 String ext = vo.getMfile4().getOriginalFilename().substring( file4 );
			 StringBuffer path4 = new StringBuffer();
			 path4.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile4().getOriginalFilename());
			 ff = new File(path4.toString());
			 vo.getMfile4().transferTo(ff);
			 vo.setFile4(vo.getMfile4().getOriginalFilename());
		}
			 int file5 = vo.getMfile5().getOriginalFilename().lastIndexOf( "." );;
			 if (file5!=-1) {
			 String ext = vo.getMfile5().getOriginalFilename().substring( file5 );
			 StringBuffer path5 = new StringBuffer();
			 path5.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile5().getOriginalFilename());
			 ff = new File(path5.toString());
			 vo.getMfile5().transferTo(ff);
			 vo.setFile5(vo.getMfile5().getOriginalFilename());
		}
		
			 int file6 = vo.getMfile6().getOriginalFilename().lastIndexOf( "." );;
			 if (file6!=-1) {
			 String ext = vo.getMfile6().getOriginalFilename().substring( file6 );
			 StringBuffer path6 = new StringBuffer();
			 path6.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile6().getOriginalFilename());
			 ff = new File(path6.toString());
			 vo.getMfile6().transferTo(ff);
			 vo.setFile6(vo.getMfile6().getOriginalFilename());
		}
			 int file7 = vo.getMfile7().getOriginalFilename().lastIndexOf( "." );;
			 if (file7!=-1) {
			 String ext = vo.getMfile7().getOriginalFilename().substring( file7 );
			 StringBuffer path7 = new StringBuffer();
			 path7.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile7().getOriginalFilename());
			 ff = new File(path7.toString());
			 vo.getMfile7().transferTo(ff);
			 vo.setFile7(vo.getMfile7().getOriginalFilename());
		}
			 int file8 = vo.getMfile8().getOriginalFilename().lastIndexOf( "." );;
			 if (file8!=-1) {
			 String ext = vo.getMfile8().getOriginalFilename().substring( file8 );
			 StringBuffer path8 = new StringBuffer();
			 path8.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile8().getOriginalFilename());
			 ff = new File(path8.toString());
			 vo.getMfile8().transferTo(ff);
			 vo.setFile8(vo.getMfile2().getOriginalFilename());
		}
			 int file9 = vo.getMfile9().getOriginalFilename().lastIndexOf( "." );;
			 if (file9!=-1) {
			 String ext = vo.getMfile9().getOriginalFilename().substring( file9 );
			 StringBuffer path9 = new StringBuffer();
			 path9.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile9().getOriginalFilename());
			 ff = new File(path9.toString());
			 vo.getMfile9().transferTo(ff);
			 vo.setFile9(vo.getMfile9().getOriginalFilename());
		}
			 int file10 = vo.getMfile10().getOriginalFilename().lastIndexOf( "." );;
			 if (file10!=-1) {
			 String ext = vo.getMfile10().getOriginalFilename().substring( file10 );
			 StringBuffer path10 = new StringBuffer();
			 path10.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile10().getOriginalFilename());
			 ff = new File(path10.toString());
			 vo.getMfile10().transferTo(ff);
			 vo.setFile10(vo.getMfile10().getOriginalFilename());
		}
			 int file11 = vo.getMfile11().getOriginalFilename().lastIndexOf( "." );;
			 if (file11!=-1) {
			 String ext = vo.getMfile11().getOriginalFilename().substring( file11 );
			 StringBuffer path11 = new StringBuffer();
			 path11.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile11().getOriginalFilename());
			 ff = new File(path11.toString());
			 vo.getMfile11().transferTo(ff);
			 vo.setFile11(vo.getMfile11().getOriginalFilename());
		}
			 int file12 = vo.getMfile12().getOriginalFilename().lastIndexOf( "." );;
			 if (file12!=-1) {
			 String ext = vo.getMfile12().getOriginalFilename().substring( file12 );
			 StringBuffer path12 = new StringBuffer();
			 path12.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile12().getOriginalFilename());
			 ff = new File(path12.toString());
			 vo.getMfile12().transferTo(ff);
			 vo.setFile12(vo.getMfile12().getOriginalFilename());
		}
			 int file13 = vo.getMfile13().getOriginalFilename().lastIndexOf( "." );;
			 if (file13!=-1) {
			 String ext = vo.getMfile13().getOriginalFilename().substring( file13 );
			 StringBuffer path13 = new StringBuffer();
			 path13.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile13().getOriginalFilename());
			 ff = new File(path13.toString());
			 vo.getMfile13().transferTo(ff);
			 vo.setFile13(vo.getMfile13().getOriginalFilename());
		}
			 int file14 = vo.getMfile14().getOriginalFilename().lastIndexOf( "." );;
			 if (file14!=-1) {
			 String ext = vo.getMfile14().getOriginalFilename().substring( file14 );
			 StringBuffer path14 = new StringBuffer();
			 path14.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile14().getOriginalFilename());
			 ff = new File(path14.toString());
			 vo.getMfile14().transferTo(ff);
			 vo.setFile14(vo.getMfile14().getOriginalFilename()); 

		}
			 int file15 = vo.getMfile15().getOriginalFilename().lastIndexOf( "." );;
			 if (file15!=-1) {
			 String ext = vo.getMfile15().getOriginalFilename().substring( file15 );
			 StringBuffer path15 = new StringBuffer();
			 path15.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile15().getOriginalFilename());
			 ff = new File(path15.toString());
			 vo.getMfile15().transferTo(ff);
			 vo.setFile15(vo.getMfile15().getOriginalFilename());
		}
			 int file16 = vo.getMfile16().getOriginalFilename().lastIndexOf( "." );;
			 if (file16!=-1) {
			 String ext = vo.getMfile16().getOriginalFilename().substring( file16 );
			 StringBuffer path16 = new StringBuffer();
			 path16.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile16().getOriginalFilename());
			 ff = new File(path16.toString());
			 vo.getMfile16().transferTo(ff);
			 vo.setFile16(vo.getMfile16().getOriginalFilename());
		}
			 int file17 = vo.getMfile17().getOriginalFilename().lastIndexOf( "." );;
			 if (file17!=-1) {
			 String ext = vo.getMfile17().getOriginalFilename().substring( file17 );
			 StringBuffer path17 = new StringBuffer();
			 path17.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile17().getOriginalFilename());
			 ff = new File(path17.toString());
			 vo.getMfile17().transferTo(ff);
			 vo.setFile17(vo.getMfile17().getOriginalFilename()); 
		}
			 int file18 = vo.getMfile18().getOriginalFilename().lastIndexOf( "." );;
			 if (file18!=-1) {
			 String ext = vo.getMfile18().getOriginalFilename().substring( file18 );
			 StringBuffer path18 = new StringBuffer();
			 path18.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile18().getOriginalFilename());
			 ff = new File(path18.toString());
			 vo.getMfile18().transferTo(ff);
			 vo.setFile18(vo.getMfile18().getOriginalFilename());
		}
			 int file19 = vo.getMfile19().getOriginalFilename().lastIndexOf( "." );;
			 if (file19!=-1) {
			 String ext = vo.getMfile19().getOriginalFilename().substring( file19 );
			 StringBuffer path19 = new StringBuffer();
			 path19.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile19().getOriginalFilename());
			 ff = new File(path19.toString());
			 vo.getMfile19().transferTo(ff);
			 vo.setFile19(vo.getMfile19().getOriginalFilename());
		}
			 int file20 = vo.getMfile20().getOriginalFilename().lastIndexOf( "." );;
			 if (file20!=-1) {
			 String ext = vo.getMfile20().getOriginalFilename().substring( file20 );
			 StringBuffer path20 = new StringBuffer();
			 path20.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile20().getOriginalFilename());
			 ff = new File(path20.toString());
			 vo.getMfile20().transferTo(ff);
			 vo.setFile20(vo.getMfile20().getOriginalFilename());
		}
		
		//VO에 이미지 이름을 저장
	
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		loanService.fileupload(vo);
		return mav;
	}
	
	@RequestMapping(value = "/fileuploadhome")
	public ModelAndView fileuploadhome() {
		ModelAndView mav = new ModelAndView("loan/fileuploadhome");
		List<LoanCheckVO> list =loanDao.checkdetailList();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/checkfiledetail")
	public ModelAndView checkfiledetail(int lc_num) {
		ModelAndView mav = new ModelAndView("loan/checkfiledetail");
		LoanFileVO vo = loanDao.filedetail(lc_num);
		System.out.println(vo.getFile2());
		String[] arr = new String[20];
		mav.addObject("vo", vo);
		mav.addObject("arr", arr);
		
		return mav;
	}


	@RequestMapping(value = "/repayment")
	public String repayment() {
		return "loan/repayment";
	}

	@RequestMapping(value = "/repaymentdetail")
	public String repaymentdetail() {
		return "loan/repaymentdetail";
	}

	@RequestMapping(value = "/repaymentform")
	public String repaymentform() {
		return "loan/repaymentform";
	}

	@RequestMapping(value = "/caculator")
	public String caculator() {
		return "loan/caculator";
	}
	@RequestMapping(value = "/gg")
	public String gg() {
		return "loan/server/gg";
	}
	 @RequestMapping("/fileDown.do")
	   public String fileDown(HttpServletRequest req , ModelMap modelMap) throws Exception {
	     String fileName = req.getParameter("fileName");
	     String fileDir =  req.getParameter("fileDir");
	      
	     modelMap.put("fileName", fileName);
	     modelMap.put("fileDir", fileDir);
	     return "/loan/server/filedown";
	   }
	 
	 @RequestMapping(value = "/refileupload",method =  RequestMethod.POST)
		public ModelAndView refileupload(LoanFileVO vo,HttpServletRequest request) {
			ModelAndView mav = new ModelAndView("redirect:check");//view의 이름을 생성자의 인자값으로 지정
			HttpSession session = request.getSession();
			String r_path = session.getServletContext().getRealPath("/");
			String img_path ="resources\\upload\\";
			System.out.println("lcnum"+vo.getLc_num());
			 try {
				 File ff = null; 
				 ff = new File(r_path+img_path+vo.getLc_num());
				 if(!ff.exists()) {
					 ff.mkdirs();
				 }
				 
				 int file1 = vo.getMfile1().getOriginalFilename().lastIndexOf( "." );;
				 if (file1!=-1) {
				 String ext = vo.getMfile1().getOriginalFilename().substring(file1);
				 StringBuffer path1 = new StringBuffer();
				 path1.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile1().getOriginalFilename());
				 System.out.println(path1.toString());
				 ff = new File(path1.toString());
				 vo.getMfile1().transferTo(ff);
				 vo.setFile1(vo.getMfile1().getOriginalFilename());
			}
				 int file2 = vo.getMfile2().getOriginalFilename().lastIndexOf( "." );;
				 if (file2!=-1) {
				 String ext = vo.getMfile2().getOriginalFilename().substring( file2 );
				 StringBuffer path2 = new StringBuffer();
				 path2.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile2().getOriginalFilename());
				 ff = new File(path2.toString());
				 vo.getMfile2().transferTo(ff);
				 vo.setFile2(vo.getMfile2().getOriginalFilename()); 
			}

				 int file3 = vo.getMfile3().getOriginalFilename().lastIndexOf( "." );;
				 if (file3!=-1) {
				 String ext = vo.getMfile3().getOriginalFilename().substring( file3 );
				 StringBuffer path3 = new StringBuffer();
				 path3.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile3().getOriginalFilename());
				 ff = new File(path3.toString());
				 vo.getMfile3().transferTo(ff);
				 vo.setFile3(vo.getMfile3().getOriginalFilename());
			}
				 int file4 = vo.getMfile4().getOriginalFilename().lastIndexOf( "." );;
				 if (file4!=-1) {
				 String ext = vo.getMfile4().getOriginalFilename().substring( file4 );
				 StringBuffer path4 = new StringBuffer();
				 path4.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile4().getOriginalFilename());
				 ff = new File(path4.toString());
				 vo.getMfile4().transferTo(ff);
				 vo.setFile4(vo.getMfile4().getOriginalFilename());
			}
				 int file5 = vo.getMfile5().getOriginalFilename().lastIndexOf( "." );;
				 if (file5!=-1) {
				 String ext = vo.getMfile5().getOriginalFilename().substring( file5 );
				 StringBuffer path5 = new StringBuffer();
				 path5.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile5().getOriginalFilename());
				 ff = new File(path5.toString());
				 vo.getMfile5().transferTo(ff);
				 vo.setFile5(vo.getMfile5().getOriginalFilename());
			}
			
				 int file6 = vo.getMfile6().getOriginalFilename().lastIndexOf( "." );;
				 if (file6!=-1) {
				 String ext = vo.getMfile6().getOriginalFilename().substring( file6 );
				 StringBuffer path6 = new StringBuffer();
				 path6.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile6().getOriginalFilename());
				 ff = new File(path6.toString());
				 vo.getMfile6().transferTo(ff);
				 vo.setFile6(vo.getMfile6().getOriginalFilename());
			}
				 int file7 = vo.getMfile7().getOriginalFilename().lastIndexOf( "." );;
				 if (file7!=-1) {
				 String ext = vo.getMfile7().getOriginalFilename().substring( file7 );
				 StringBuffer path7 = new StringBuffer();
				 path7.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile7().getOriginalFilename());
				 ff = new File(path7.toString());
				 vo.getMfile7().transferTo(ff);
				 vo.setFile7(vo.getMfile7().getOriginalFilename());
			}
				 int file8 = vo.getMfile8().getOriginalFilename().lastIndexOf( "." );;
				 if (file8!=-1) {
				 String ext = vo.getMfile8().getOriginalFilename().substring( file8 );
				 StringBuffer path8 = new StringBuffer();
				 path8.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile8().getOriginalFilename());
				 ff = new File(path8.toString());
				 vo.getMfile8().transferTo(ff);
				 vo.setFile8(vo.getMfile2().getOriginalFilename());
			}
				 int file9 = vo.getMfile9().getOriginalFilename().lastIndexOf( "." );;
				 if (file9!=-1) {
				 String ext = vo.getMfile9().getOriginalFilename().substring( file9 );
				 StringBuffer path9 = new StringBuffer();
				 path9.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile9().getOriginalFilename());
				 ff = new File(path9.toString());
				 vo.getMfile9().transferTo(ff);
				 vo.setFile9(vo.getMfile9().getOriginalFilename());
			}
				 int file10 = vo.getMfile10().getOriginalFilename().lastIndexOf( "." );;
				 if (file10!=-1) {
				 String ext = vo.getMfile10().getOriginalFilename().substring( file10 );
				 StringBuffer path10 = new StringBuffer();
				 path10.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile10().getOriginalFilename());
				 ff = new File(path10.toString());
				 vo.getMfile10().transferTo(ff);
				 vo.setFile10(vo.getMfile10().getOriginalFilename());
			}
				 int file11 = vo.getMfile11().getOriginalFilename().lastIndexOf( "." );;
				 if (file11!=-1) {
				 String ext = vo.getMfile11().getOriginalFilename().substring( file11 );
				 StringBuffer path11 = new StringBuffer();
				 path11.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile11().getOriginalFilename());
				 ff = new File(path11.toString());
				 vo.getMfile11().transferTo(ff);
				 vo.setFile11(vo.getMfile11().getOriginalFilename());
			}
				 int file12 = vo.getMfile12().getOriginalFilename().lastIndexOf( "." );;
				 if (file12!=-1) {
				 String ext = vo.getMfile12().getOriginalFilename().substring( file12 );
				 StringBuffer path12 = new StringBuffer();
				 path12.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile12().getOriginalFilename());
				 ff = new File(path12.toString());
				 vo.getMfile12().transferTo(ff);
				 vo.setFile12(vo.getMfile12().getOriginalFilename());
			}
				 int file13 = vo.getMfile13().getOriginalFilename().lastIndexOf( "." );;
				 if (file13!=-1) {
				 String ext = vo.getMfile13().getOriginalFilename().substring( file13 );
				 StringBuffer path13 = new StringBuffer();
				 path13.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile13().getOriginalFilename());
				 ff = new File(path13.toString());
				 vo.getMfile13().transferTo(ff);
				 vo.setFile13(vo.getMfile13().getOriginalFilename());
			}
				 int file14 = vo.getMfile14().getOriginalFilename().lastIndexOf( "." );;
				 if (file14!=-1) {
				 String ext = vo.getMfile14().getOriginalFilename().substring( file14 );
				 StringBuffer path14 = new StringBuffer();
				 path14.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile14().getOriginalFilename());
				 ff = new File(path14.toString());
				 vo.getMfile14().transferTo(ff);
				 vo.setFile14(vo.getMfile14().getOriginalFilename()); 

			}
				 int file15 = vo.getMfile15().getOriginalFilename().lastIndexOf( "." );;
				 if (file15!=-1) {
				 String ext = vo.getMfile15().getOriginalFilename().substring( file15 );
				 StringBuffer path15 = new StringBuffer();
				 path15.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile15().getOriginalFilename());
				 ff = new File(path15.toString());
				 vo.getMfile15().transferTo(ff);
				 vo.setFile15(vo.getMfile15().getOriginalFilename());
			}
				 int file16 = vo.getMfile16().getOriginalFilename().lastIndexOf( "." );;
				 if (file16!=-1) {
				 String ext = vo.getMfile16().getOriginalFilename().substring( file16 );
				 StringBuffer path16 = new StringBuffer();
				 path16.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile16().getOriginalFilename());
				 ff = new File(path16.toString());
				 vo.getMfile16().transferTo(ff);
				 vo.setFile16(vo.getMfile16().getOriginalFilename());
			}
				 int file17 = vo.getMfile17().getOriginalFilename().lastIndexOf( "." );;
				 if (file17!=-1) {
				 String ext = vo.getMfile17().getOriginalFilename().substring( file17 );
				 StringBuffer path17 = new StringBuffer();
				 path17.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile17().getOriginalFilename());
				 ff = new File(path17.toString());
				 vo.getMfile17().transferTo(ff);
				 vo.setFile17(vo.getMfile17().getOriginalFilename()); 
			}
				 int file18 = vo.getMfile18().getOriginalFilename().lastIndexOf( "." );;
				 if (file18!=-1) {
				 String ext = vo.getMfile18().getOriginalFilename().substring( file18 );
				 StringBuffer path18 = new StringBuffer();
				 path18.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile18().getOriginalFilename());
				 ff = new File(path18.toString());
				 vo.getMfile18().transferTo(ff);
				 vo.setFile18(vo.getMfile18().getOriginalFilename());
			}
				 int file19 = vo.getMfile19().getOriginalFilename().lastIndexOf( "." );;
				 if (file19!=-1) {
				 String ext = vo.getMfile19().getOriginalFilename().substring( file19 );
				 StringBuffer path19 = new StringBuffer();
				 path19.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile19().getOriginalFilename());
				 ff = new File(path19.toString());
				 vo.getMfile19().transferTo(ff);
				 vo.setFile19(vo.getMfile19().getOriginalFilename());
			}
				 int file20 = vo.getMfile20().getOriginalFilename().lastIndexOf( "." );;
				 if (file20!=-1) {
				 String ext = vo.getMfile20().getOriginalFilename().substring( file20 );
				 StringBuffer path20 = new StringBuffer();
				 path20.append(r_path).append(img_path).append(vo.getLc_num()).append("\\").append(vo.getMfile20().getOriginalFilename());
				 ff = new File(path20.toString());
				 vo.getMfile20().transferTo(ff);
				 vo.setFile20(vo.getMfile20().getOriginalFilename());
			}
			
			//VO에 이미지 이름을 저장
		
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			loanDao.refileupload(vo);
			return mav;
		}

}