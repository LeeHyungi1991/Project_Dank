package dank.mvc.model;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dank.mvc.dao.BangkingDao;
import dank.mvc.dao.DepositDao;


import dank.mvc.service.BangkingService;

import dank.mvc.vo.deposit.PageVO;
import dank.mvc.vo.deposit.AccountHistoryVO;
import dank.mvc.vo.deposit.AccountVO;

import dank.mvc.vo.deposit.Installment_savingVO;

import dank.mvc.vo.deposit.SavingVO;


@Controller
public class DepositController {
	@Autowired
	private DepositDao depositDao;
	
	@Autowired
	private BangkingDao bangkingdao;
	@Autowired
	private BangkingService bangkingservice;
	
<<<<<<< HEAD
	@Autowired
	private DepositServicesy depositservicesy;
	
	//����-�ű������� �̵�
=======
	
	
	

>>>>>>> refs/remotes/origin/master
	@RequestMapping(value = "/new")
	public String newPage(Model m) {
		return "deposit_new/new";
	}
	//����-�ű�-Ư�� ���� ��ǰ ������ �̵�
	@RequestMapping(value = "/saving_detail")
	public String saving_detail(Model m, int sav_code) {
		SavingVO saving = depositDao.getSavingQuaDetail(sav_code);
		m.addAttribute("saving",saving);
		return "deposit_new/saving_detail";
	}
	//����-�ű�-Ư�� ���� ��ǰ ������ �̵�
	@RequestMapping(value = "/installment_detail")
	public String installment_detail(Model m, int ins_code) {
		Installment_savingVO ins = depositDao.getInsQuaDetail(ins_code);
		m.addAttribute("ins",ins);
		return "deposit_new/installment_detail";
	}
	//����-�ű�-���� ��û ������ �̵�
	@RequestMapping(value = "/saving_new")
	public String saving_new(Model m) {
		return "deposit_new/saving_new";
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

//	@RequestMapping(value = { "/inquire" })
//	public String inqurePage(
//			@RequestParam(value = "gonum", required = true, defaultValue = "0") String gonum
//			) {
//		return "deposit/deposite_inquire";
//	}

	@RequestMapping(value = { "/inquire" })
	public ModelAndView inquirePage(
			@RequestParam(value = "mem_code",defaultValue = "1") String mem_code
			,HttpSession session
			) {
		session.setAttribute("mem_code", mem_code);
		ModelAndView mav = new ModelAndView();

		System.out.println("������ȸ���� �ִ� ������="+session.getAttribute("mem_code"));
		
		
		

		List<AccountVO> aclist = bangkingdao.getaclist(Integer.parseInt(session.getAttribute("mem_code").toString()));

		for(AccountVO e :aclist) {
			
			System.out.println(e.getAc_num());
			System.out.println(e.getAc_balance());
			System.out.println(e.getSaving().getSav_name());
			System.out.println(e.getSaving().getShas_code());
			System.out.println(e.getIns().getIns_name());
			System.out.println(e.getIns().getShac_code());
			System.out.println("*******************");
			
		}
		mav.addObject("aclist",aclist);
		mav.setViewName("deposit/deposite_inquire");
		
		return mav;
	}
	
	@RequestMapping(value={ "/deposit" })
	public ModelAndView executedeposit(HttpSession session,int ac_num) {
		ModelAndView mav = new ModelAndView();
		System.out.println("******************�Աݽ����,���¹�ȣ�� ="+ac_num+",");
		
		int money =10000;
		
		System.out.println("��������"+bangkingdao.depcheckac(ac_num));
		
		if(bangkingdao.depcheckac(ac_num)>=1) {
		Map<String, String> paramapsp = new HashMap<String, String>();
		paramapsp.put("ac_num", String.valueOf(ac_num));
		paramapsp.put("sp_name", "�Ա��׽�Ʈ��");
		paramapsp.put("mem_code", session.getAttribute("mem_code").toString());
		Map<String, Integer> paramapbal = new HashMap<String, Integer>();
		paramapbal.put("ac_num", ac_num);
		paramapbal.put("dep_money",money);
		paramapbal.put("mem_code", Integer.parseInt(session.getAttribute("mem_code").toString()));
		bangkingservice.depositprocess(money, paramapsp, paramapbal);
		}
		
		
		
		mav.setViewName("redirect:inquire?mem_code="+session.getAttribute("mem_code"));
		return mav;
	}
	

	@RequestMapping(value={ "/withdraw" })
	public ModelAndView executewithdraw(HttpSession session,int ac_num) {
		ModelAndView mav = new ModelAndView();
		System.out.println("******************��ݽ����,���¹�ȣ�� ="+ac_num+",");
		
		int money =10000;
		
		System.out.println("��������"+bangkingdao.witcheckac(ac_num));
		
		if(bangkingdao.witcheckac(ac_num)>=1) {
			Map<String, Integer> paramckbal = new HashMap<String, Integer>();
			paramckbal.put("ac_num", ac_num);
			paramckbal.put("mem_code", Integer.parseInt(session.getAttribute("mem_code").toString()));
			if(bangkingdao.witcheckbal(paramckbal) >= money) {
				Map<String, String> paramapsp = new HashMap<String, String>();
				paramapsp.put("ac_num", String.valueOf(ac_num));
				paramapsp.put("mem_code", String.valueOf(session.getAttribute("mem_code")));
				paramapsp.put("sp_name", "����׽�Ʈ��");
				Map<String, Integer> paramapbal = new HashMap<String, Integer>();
				paramapbal.put("ac_num", ac_num);
				paramapbal.put("mem_code", Integer.parseInt(session.getAttribute("mem_code").toString()));
				paramapbal.put("wit_money",money);
				bangkingservice.withdrawprocess(money, paramapsp, paramapbal);
			}
			
			
			
		}
		
		
		
		mav.setViewName("redirect:inquire?mem_code="+session.getAttribute("mem_code"));
		return mav;
	}
	@RequestMapping(value = "/transfer_process")
	public ModelAndView transferprocess(HttpSession session
			,@RequestParam(value = "myac") int myac
			,@RequestParam(value = "yourac") int yourac
			,@RequestParam(value = "youracmem") int youracmem
			,@RequestParam(value = "trmoney") int trmoney
			,@RequestParam(value = "youracwrite", defaultValue = "��ü�ε���") String youracwrite
			,@RequestParam(value = "myacwrite", defaultValue = "��ü�κ���") String myacwrite
			
			) {
		System.out.println("Ʈ�������Դϴ�."+session.getAttribute("mem_code"));
		System.out.println("���ǰ���"+myac);
		System.out.println("�Աݰ���"+yourac);
		System.out.println("�Աݾ�"+trmoney);
		System.out.println("�޴º�����ǥ��"+youracwrite);
		System.out.println("��������ǥ��"+myacwrite);

		
		Map<String, Integer> mapmy = new HashMap<String, Integer>();
		mapmy.put("ac_num", myac);
		mapmy.put("mem_code", Integer.parseInt(session.getAttribute("mem_code").toString()));
		mapmy.put("at_dps_ac", yourac);
		mapmy.put("at_set_mony", trmoney);
		
		
		Map<String, String> mapmysp = new HashMap<String, String>();
		mapmysp.put("ac_num", String.valueOf(myac));
		mapmysp.put("mem_code",session.getAttribute("mem_code").toString());
		mapmysp.put("sp_name", myacwrite);
		
		
		Map<String, Integer> mapyour = new HashMap<String, Integer>();
		mapyour.put("ac_num", yourac);
		mapyour.put("mem_code", youracmem);
		mapyour.put("at_dps_ac",myac);
		mapyour.put("at_set_mony", trmoney);
		
		Map<String, String> mapyoursp = new HashMap<String, String>();
		mapyoursp.put("ac_num", String.valueOf(yourac));
		mapyoursp.put("mem_code",String.valueOf(youracmem));
		mapyoursp.put("sp_name", youracwrite);
		
		
		
		
		if(bangkingdao.trtrAcChk(myac) >=1) {
			if(bangkingdao.trtrAcChk(yourac) >=1) {
				if(bangkingdao.trbalChk(mapmy) >=trmoney) {
					bangkingservice.transferprocess(trmoney, mapmy, mapmysp, mapyour, mapyoursp);
					System.out.println("��ü�����");
				}
			}
		}
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:inquire?mem_code="+session.getAttribute("mem_code"));
		return mav;
	}
	
	@RequestMapping(value={ "/getsession" })
	public ModelAndView getsession(HttpServletRequest req,@RequestParam(value = "mem_code") String mem_code) {
		System.out.println("����ڵ�� : "+mem_code);
		HttpSession session =req.getSession();
		//session.invalidate();
		session.setAttribute("mem_code", mem_code);
		ModelAndView mav = new ModelAndView();
		System.out.println("���ǳֱ� ����");
		System.out.println("���� ���� : "+session.getAttribute("mem_code"));
		mav.setViewName("redirect:inquire?mem_code="+session.getAttribute("mem_code"));
		return mav;
	}
	
	
	

	@RequestMapping(value = { "/inquire_detail" })
	public ModelAndView inqure_detailPage(
			HttpSession session
			,PageVO pvo
			,@RequestParam(value = "ac_num") int ac_num
			,@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage
			,@RequestParam(value = "cntPerPage", required = false, defaultValue = "20") String cntPerPage
			) {
		System.out.println("ac_num : "+ac_num);
		System.out.println("session ? : "+session.getAttribute("mem_code"));
		Map<String, String> historymap = new HashMap<String, String>();
		historymap.put("ac_num", String.valueOf(ac_num));
		historymap.put("mem_code", session.getAttribute("mem_code").toString());
		
		int total = bangkingdao.gettotalcnt(historymap);
		pvo = new PageVO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		System.out.println("Start : "+pvo.getStartPage());
		System.out.println("End : "+pvo.getEnd());
		
		historymap.put("start", String.valueOf(pvo.getStart()));
		historymap.put("end", String.valueOf(pvo.getEnd()));
		
		
		
		List<AccountHistoryVO> history =bangkingdao.gethistory(historymap);
		System.out.println("�����丮 ����Ʈ ũ�� : "+history.size());
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deposit/deposite_inquire_detail");
		mav.addObject("history",history);
		mav.addObject("paging",pvo);
		mav.addObject("ac_num",ac_num);
		return mav;
	}

	@RequestMapping(value = { "/transfer" })
	public ModelAndView transferPage(HttpSession session) {
		
		
		System.out.println("��ü ������ "+session.getAttribute("mem_code"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deposit/deposite_transfer");
		
		return mav;
	}

	@RequestMapping(value = { "/transfer_auto" })
	public String transferautoPage() {
		return "deposit/deposite_transfer_auto";
	}

	@RequestMapping(value = { "/transfer_auto_apply" })
	public String transferautoapplyPage() {
		return "deposit/deposite_transfer_auto_apply";
	}

	@RequestMapping(value = { "/deposite_cancle" })
	public String depositecancle() {
		return "deposit/deposite_cancle";
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
