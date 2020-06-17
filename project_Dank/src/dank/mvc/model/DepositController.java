package dank.mvc.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dank.mvc.dao.BangkingDao;
import dank.mvc.dao.DepositDao;
import dank.mvc.dao.MemberDao;
import dank.mvc.method.AccountNum;
import dank.mvc.service.BangkingService;


import dank.mvc.vo.deposit.PageVO;
import dank.mvc.vo.deposit.ProSavInsDto;
import dank.mvc.vo.MemberVO;

import dank.mvc.vo.deposit.AccountHistoryVO;
import dank.mvc.vo.deposit.AccountVO;
import dank.mvc.vo.deposit.Account_ClientVO;
import dank.mvc.vo.deposit.At_applicationVO;
import dank.mvc.vo.deposit.Installment_savingVO;

import dank.mvc.vo.deposit.SavingVO;


@Controller
public class DepositController {
	@Autowired
	private DepositDao depositDao;

	@Autowired
	private AccountNum accountNum;
	@Autowired
	private DepositService depositService;
	
	@Autowired
	private MemberDao memberDao;
	//예금-신규페이지 이동
	@RequestMapping(value = "/new")
	public String newPage(Model m) {
		return "deposit_new/new";
	}
	//예금-신규-특정 예금 상품 페이지 이동
	@RequestMapping(value = "/new_savdetail")
	public String saving_detail(Model m, int sav_code) {
		System.out.println(sav_code);
		SavingVO saving = depositDao.getSavingQuaDetail(sav_code);
		m.addAttribute("saving",saving);
		return "deposit_new/new_savdetail";
	}
	//예금-신규-특정 적금 상품 페이지 이동
	@RequestMapping(value = "/new_insdetail")
	public String installment_detail(Model m, int ins_code) {
		Installment_savingVO ins = depositDao.getInsQuaDetail(ins_code);
		m.addAttribute("ins",ins);
		return "deposit_new/new_insdetail";
	}
	//예금-신규-예금 신청 페이지 이동
	@RequestMapping(value = "/saving_new")
	public String saving_new(HttpSession session,Model m, int sav_code, int deptype) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) { //세션 정보가 존재하지않는다면 로그인페이지로
			session.setAttribute("pageName", "new");
			return "login/login";
		}
		int mem_code = ((MemberVO) session.getAttribute("member")).getMem_code();
		MemberVO memberVO = memberDao.numToEmailName(mem_code);
		m.addAttribute("memberVO", memberVO);
		SavingVO saving = depositDao.getSavingQuaDetail(sav_code);
		m.addAttribute("saving", saving);
		m.addAttribute("deptype", deptype);
		return "deposit_new/new_deposit";
	}
	//예금-신규-적금 신청 페이지 이동
		@RequestMapping(value = "/ins_new")
		public String ins_new(HttpSession session,Model m, int ins_code, int deptype) {
			
			MemberVO member = (MemberVO)session.getAttribute("member");
			if(member == null) { //세션 정보가 존재하지않는다면 로그인페이지로
				session.setAttribute("pageName", "new");
				return "login/login";
			}
			int mem_code = ((MemberVO) session.getAttribute("member")).getMem_code();
			MemberVO memberVO = memberDao.numToEmailName(mem_code);
			m.addAttribute("memberVO", memberVO);
			Installment_savingVO ins = depositDao.getInsQuaDetail(ins_code);
			m.addAttribute("ins", ins);
			m.addAttribute("deptype", deptype);
			return "deposit_new/new_deposit";
		}
	//예금-신규-계좌 신청
	@RequestMapping(value = "/deposit_newComplete")
	public String deposit_new(HttpSession session,Model m,AccountVO account,int deptype,
			@RequestParam(value = "sav_code",defaultValue = "0") int sav_code,
			@RequestParam(value = "ins_code",defaultValue = "0") int ins_code) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) { //세션 정보가 존재하지않는다면 로그인페이지로
			session.setAttribute("pageName", "new");
			return "login/login";
		}
		
		ProSavInsDto psid = new ProSavInsDto();
		psid.setDeptype(deptype);
		psid.setSav_code(sav_code);
		psid.setIns_code(ins_code);
		
		String ac_num = accountNum.createAcNum(deptype);
		account.setAc_num(ac_num);
		
		int mem_code = member.getMem_code();
		int pro_code = accountNum.getPro_codeNum(psid);
		Account_ClientVO clientVO = new Account_ClientVO();
		
		clientVO.setMem_code(mem_code);
		clientVO.setPro_code(pro_code);
		
		//ac_code,ac_num,ac_pwd,ac_balance,ac_name,ac_start_date,ac_end_date
		//ac_code,mem_code,pro_code
		depositService.newAccount(account,clientVO);
		return "deposit_new/new_success";
	}
	//예금-해지
	@RequestMapping(value = { "/cancle" })
	public String depositecancle(HttpSession session,Model m) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) { //세션 정보가 존재하지않는다면 로그인페이지로
			session.setAttribute("pageName", "cancle");
			return "login/login";
		}
		
		List<AccountVO> aclist = bangkingdao.getaclist(member.getMem_code());

		List<AccountVO> savlist = new ArrayList<AccountVO>();
		List<AccountVO> inslist = new ArrayList<AccountVO>();
		for(AccountVO e :aclist) {
			System.out.println(e);
			if(e.getSaving().getSav_code() != 0) {
				savlist.add(e);
			}else if (e.getIns().getIns_code() != 0) {
				inslist.add(e);
			}
		}
		m.addAttribute("savlist", savlist);
		m.addAttribute("inslist", inslist);
		m.addAttribute("aclist", aclist);
		
		return "deposit_new/cancle";
	}
	
//	@RequestMapping(value = "/share_new_req")
//	public String share_new_req() {
//		return "deposit/share_new_req";
//	}
//
//	@RequestMapping(value = "/share_new_res")
//	public String share_new_res() {
//		return "deposit/share_new_res";
//	}
//
//	@RequestMapping(value = "/share_new_insert")
//	public String share_new_insert() {
//		return "deposit/share_new_insert";
//	}
//
//	@RequestMapping(value = "/share_new_complete")
//	public String share_new_complete() {
//		return "deposit/share_new_complete";
//	}
//
//	@RequestMapping(value = "/share_new_check")
//	public String share_new_check() {
//		return "deposit/share_new_check";
//	}
	
	///////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////
	
	@Autowired
	private BangkingDao bangkingdao;
	@Autowired
	private BangkingService bangkingservice;
	//조회-계좌조회
	@RequestMapping(value = { "/inquire" })
	public ModelAndView inquirePage(
			HttpSession session
			) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("member") == null) {
			session.setAttribute("pageName", "inquire");
			mav.setViewName("login/login");
			return mav;
		}
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		
		List<AccountVO> aclist = bangkingdao.getaclist(sessionmem.getMem_code());

		mav.addObject("aclist",aclist);
		mav.setViewName("deposit/deposite_inquire");
		
		return mav;
	}
	//입금하기 (임시기능)
	@RequestMapping(value={ "/deposit" })
	public ModelAndView executedeposit(HttpSession session,String ac_num) {
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		System.out.println("******************입금실행댐,계좌번호는 ="+ac_num+",");
		
		String money ="10000";
		
	
		
		if(bangkingdao.depcheckac(ac_num)>=1) {
		Map<String, String> paramapsp = new HashMap<String, String>();
		paramapsp.put("ac_num", ac_num);
		paramapsp.put("sp_name", "입금테스트용");
		paramapsp.put("mem_code", String.valueOf(sessionmem.getMem_code()));
		Map<String, String> paramapbal = new HashMap<String, String>();
		paramapbal.put("ac_num", ac_num);
		paramapbal.put("dep_money",money);
		paramapbal.put("mem_code", String.valueOf(sessionmem.getMem_code()));
		bangkingservice.depositprocess(money, paramapsp, paramapbal);
		}
		
		
		
		mav.setViewName("redirect:inquire");
		return mav;
	}
	
	//출금하기(임시기능)
	@RequestMapping(value={ "/withdraw" })
	public ModelAndView executewithdraw(HttpSession session,String ac_num) {
		//int acnum = Integer.parseInt(ac_num);
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		
		
		String money ="10000";
		
		
		
		if(bangkingdao.witcheckac(ac_num)>=1) {
			Map<String, String> paramckbal = new HashMap<String, String>();
			paramckbal.put("ac_num", ac_num);
			paramckbal.put("mem_code", String.valueOf(sessionmem.getMem_code()));
			if(Long.parseLong(bangkingdao.witcheckbal(paramckbal)) >= Long.parseLong(money)) {
				Map<String, String> paramapsp = new HashMap<String, String>();
				paramapsp.put("ac_num", ac_num);
				paramapsp.put("mem_code", String.valueOf(sessionmem.getMem_code()));
				paramapsp.put("sp_name", "출금테스트용");
				Map<String, String> paramapbal = new HashMap<String, String>();
				paramapbal.put("ac_num", ac_num);
				paramapbal.put("mem_code", String.valueOf(sessionmem.getMem_code()));
				paramapbal.put("wit_money",money);
				bangkingservice.withdrawprocess(money, paramapsp, paramapbal);
			}
			
			
			
		}
		
		
		
		mav.setViewName("redirect:inquire");
		return mav;
	}
	//자동이체 진행
	@RequestMapping(value = "/transfer_process")
	public ModelAndView transferprocess(HttpSession session
			,@RequestParam(value = "myac") String myac
			,@RequestParam(value = "yourac") String yourac
			,@RequestParam(value = "youracmem") String youracmem
			,@RequestParam(value = "trmoney") String trmoney
			,@RequestParam(value = "youracwrite", defaultValue = "이체로들어옴") String youracwrite
			,@RequestParam(value = "myacwrite", defaultValue = "이체로빠짐") String myacwrite
			
			) {
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		

		
		Map<String, String> mapmy = new HashMap<String, String>();
		mapmy.put("ac_num", myac);
		mapmy.put("mem_code", String.valueOf(sessionmem.getMem_code()));
		mapmy.put("at_dps_ac", yourac);
		mapmy.put("at_set_mony", trmoney);
		
		
		Map<String, String> mapmysp = new HashMap<String, String>();
		mapmysp.put("ac_num", myac);
		mapmysp.put("mem_code",String.valueOf(sessionmem.getMem_code()));
		mapmysp.put("sp_name", myacwrite);
		
		
		Map<String, String> mapyour = new HashMap<String, String>();
		mapyour.put("ac_num", yourac);
		mapyour.put("mem_code", youracmem);
		mapyour.put("at_dps_ac",myac);
		mapyour.put("at_set_mony", trmoney);
		
		Map<String, String> mapyoursp = new HashMap<String, String>();
		mapyoursp.put("ac_num", yourac);
		mapyoursp.put("mem_code",youracmem);
		mapyoursp.put("sp_name", youracwrite);
		
		
		
		
		if(bangkingdao.trtrAcChk(myac) >=1) {
			System.out.println("1");
			if(bangkingdao.trtrAcChk(yourac) >=1) {

				System.out.println("2");
				
				if(Long.parseLong(bangkingdao.trbalChk(mapmy)) >=Long.parseLong(trmoney)) {
					bangkingservice.transferprocess(trmoney, mapmy, mapmysp, mapyour, mapyoursp);
					System.out.println("이체실행댐");
				}
			}
		}
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:inquire");
		return mav;
	}
	

	
	
	//계좌내역상세조회페이지
	@RequestMapping(value = { "/inquire_detail" })
	public ModelAndView inqure_detailPage(
			HttpSession session
			,PageVO pvo
			,@RequestParam(value = "ac_num") String ac_num
			,@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage
			,@RequestParam(value = "cntPerPage", required = false, defaultValue = "20") String cntPerPage
			) {
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		
		Map<String, String> historymap = new HashMap<String, String>();
		historymap.put("ac_num", ac_num);
		historymap.put("mem_code", String.valueOf(sessionmem.getMem_code()));
		
		int total = bangkingdao.gettotalcnt(historymap);
		pvo = new PageVO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		
		
		historymap.put("start", String.valueOf(pvo.getStart()));
		historymap.put("end", String.valueOf(pvo.getEnd()));
		
		
		
		List<AccountHistoryVO> history =bangkingdao.gethistory(historymap);
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deposit/deposite_inquire_detail");
		mav.addObject("history",history);
		mav.addObject("paging",pvo);
		mav.addObject("ac_num",ac_num);
		return mav;
	}
	
	
	//계좌내역상세조회페이지2
		@RequestMapping(value = { "/inquire_detail_slct" })
		public ModelAndView inqure_detail_slctPage(
				HttpSession session
				,PageVO pvo
				,@RequestParam(value = "ac_num") String ac_num
				,@RequestParam(value = "startdate") String startdate
				,@RequestParam(value = "lastdate") String lastdate
				,@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage
				,@RequestParam(value = "cntPerPage", required = false, defaultValue = "20") String cntPerPage
				) {
			MemberVO sessionmem = (MemberVO) session.getAttribute("member");
			System.out.println("ac_num은 :" +ac_num);
			Map<String, String> historymap = new HashMap<String, String>();
			historymap.put("ac_num", ac_num);
			historymap.put("mem_code", String.valueOf(sessionmem.getMem_code()));
			
			int total = bangkingdao.gettotalcnt(historymap);
			pvo = new PageVO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
			
			
			historymap.put("start", String.valueOf(pvo.getStart()));
			historymap.put("end", String.valueOf(pvo.getEnd()));
			historymap.put("startdate", startdate);
			historymap.put("lastdate", lastdate);
			
			
			
			List<AccountHistoryVO> history =bangkingdao.gethistory_slct(historymap);
			
			
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("deposit/deposite_inquire_detail");
			mav.addObject("history",history);
			mav.addObject("paging",pvo);
			mav.addObject("ac_num",ac_num);
			return mav;
		}
	//이체 페이지로 이동
	@RequestMapping(value = { "/transfer" })
	public ModelAndView transferPage(HttpSession session,@RequestParam(value = "ac_num",defaultValue = "0") String ac_num) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("member") == null) {
			session.setAttribute("pageName", "transfer");
			mav.setViewName("login/login");
			return mav;
		}
		
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		

		Map<String, String> getmyaclistwhentr =new  HashMap<String, String>();
		getmyaclistwhentr.put("mem_code", String.valueOf(sessionmem.getMem_code()));
		getmyaclistwhentr.put("ac_num", ac_num);
		
		
		List<String> myaclist = bangkingdao.getmyaclistwhentr(getmyaclistwhentr);

		

		
		
		mav.setViewName("deposit/deposite_transfer");
		mav.addObject("myaclist",myaclist);
		
		return mav;
	}

	@RequestMapping(value = { "/transfer_auto" })
	public ModelAndView transferautoPage(HttpSession session) {
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		List<AccountVO> aclist = bangkingdao.getaclist(sessionmem.getMem_code());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deposit/deposite_transfer_auto");
		mav.addObject("aclist",aclist);
		
		return mav;
	}

	@RequestMapping(value = { "/transfer_auto_apply" })
	public ModelAndView transferautoapplyPage(HttpSession session
			,String ac_num
			) {
		
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		Map<String, String> getmyaclistwhentr =new  HashMap<String, String>();
		getmyaclistwhentr.put("mem_code", String.valueOf(sessionmem.getMem_code()));
		getmyaclistwhentr.put("ac_num", ac_num);
		List<String> myaclist = bangkingdao.getmyaclistwhentr(getmyaclistwhentr);
	
		
		mav.setViewName("deposit/deposite_transfer_auto_apply");
		mav.addObject("myaclist",myaclist);
		return mav;
	}
	
	@RequestMapping(value = { "/transfer_auto_apply_process" }, method = RequestMethod.POST)
	public ModelAndView transferautoapplyprocess(
			HttpSession session
			,At_applicationVO atapplyvo
			,@RequestParam(value = "atastopdate", defaultValue = "-1",required = false) String atastopdate
			,@RequestParam(value = "atadterm", defaultValue = "-1",required = false) String atadterm
			,@RequestParam(value = "atamyacmemo", defaultValue = "자동이체",required = false) String atamyacmemo
			,@RequestParam(value = "atayouracmemo", defaultValue = "자동이체",required = false) String atayouracmemo
			,@RequestParam(value = "atacheck", defaultValue = "-1",required = false) String atacheck
			,@RequestParam(value = "ataing", defaultValue = "-1",required = false) String ataing
			//파라미터 디폴트값 받기위해서 언더바 지운거로 보내고
			//셋터로 vo값에 넣어주었다.
			) {
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		atapplyvo.setMem_code(sessionmem.getMem_code());
		atapplyvo.setAta_stopdate(atastopdate);
		atapplyvo.setAta_dterm(Integer.parseInt(atadterm));
		atapplyvo.setAta_myacmemo(atamyacmemo);
		atapplyvo.setAta_youracmemo(atayouracmemo);
		atapplyvo.setAta_check(Integer.parseInt(atacheck));
		atapplyvo.setAta_ing(Integer.parseInt(ataing));
	

	
		
		
		bangkingdao.insertatapply(atapplyvo);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:transfer_auto");
		
		return mav;
	}
	
	@RequestMapping(value = "/deposit_transfer_auto_server")
	public ModelAndView deposit_transfer_auto_server(HttpSession session,@RequestParam(value = "ac_num") String ac_num) {
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deposit/server/deposit_transfer_auto_server");
		Map<String, String> atlistparam = new HashMap<String, String>();
		atlistparam.put("mem_code", String.valueOf(sessionmem.getMem_code()));
		atlistparam.put("ac_num", ac_num);
		
		List<Map<String, String>> atlist = bangkingdao.atlist(atlistparam);
		
		mav.addObject("atlist",atlist);
		return mav;
	}

	

	@RequestMapping(value = { "/deposite_cancle_input_info" })
	public String depositecancleinputinfo() {
		return "deposit/deposite_cancle_input_info";
	}

	@RequestMapping(value = { "/deposite_cancle_check_Account" })
	public String depositecanclecheckshareAccount() {
		return "deposit/deposite_cancle_check_shareAccount";
	}

	@RequestMapping(value = { "/deposite_cancle_check_select" })
	public String depositecanclecheckselect() {
		return "deposit/deposite_cancle_check_select";
	}
	
	@RequestMapping(value = "/analysis")
	public String viewAnalysis() {
		return "deposit/analysis";
	}
}
