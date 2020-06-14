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
import dank.mvc.method.AccountNum;
import dank.mvc.service.BangkingService;


import dank.mvc.vo.deposit.PageVO;
import dank.mvc.vo.deposit.ProSavInsDto;
import dank.mvc.vo.MemberVO;

import dank.mvc.vo.deposit.AccountHistoryVO;
import dank.mvc.vo.deposit.AccountVO;
import dank.mvc.vo.deposit.At_applicationVO;
import dank.mvc.vo.deposit.Installment_savingVO;

import dank.mvc.vo.deposit.SavingVO;


@Controller
public class DepositController {
	@Autowired
	private DepositDao depositDao;

	@Autowired
	private AccountNum accountNum;

	
	//����-�ű������� �̵�
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
	public String saving_new(Model m, int sav_code, int deptype) {
		SavingVO saving = depositDao.getSavingQuaDetail(sav_code);
		m.addAttribute("saving", saving);
		m.addAttribute("deptype", deptype);
		return "deposit_new/deposit_new";
	}
	//insert into account values(#{ac_code},#{mem_code},#{ac_num},#{ac_pwd},sysdate,#{ac_end_date},#{ac_balance},#{pro_code})
	//����-�ű�-���� ��û
	@RequestMapping(value = "/deposit_newComplete")
	public String deposit_new(HttpSession session,Model m,AccountVO account,int deptype,
			@RequestParam(value = "sav_code",defaultValue = "0") int sav_code,
			@RequestParam(value = "ins_code",defaultValue = "0") int ins_code) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) { //���� ������ ���������ʴ´ٸ� �α�����������
			return "login/login";
		}
		
		ProSavInsDto psid = new ProSavInsDto();
		psid.setDeptype(deptype);
		psid.setSav_code(sav_code);
		psid.setIns_code(ins_code);
		
		//ac_code,mem_code,ac_num,ac_pwd,ac_start_date,ac_end_date,ac_balance,pro_code
		int mem_code = member.getMem_code();
		String ac_num = accountNum.createAcNum(deptype);
		int pro_code = accountNum.getPro_codeNum(psid);		
		
		account.setMem_code(mem_code);
		account.setAc_num(ac_num);
		account.setPro_code(pro_code);
		
		depositDao.createAccount(account);
		
		return "deposit_new/success";
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
	//��ȸ-������ȸ
	@RequestMapping(value = { "/inquire" })
	public ModelAndView inquirePage(
			HttpSession session
			) {
		//session.setAttribute("mem_code", mem_code);
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView();

		//System.out.println("������ȸ���� �ִ� ������="+session.getAttribute("mem_code"));
		System.out.println("������ȸ���� �ִ� ������="+sessionmem.getMem_code());
		
		
		

		List<AccountVO> aclist = bangkingdao.getaclist(sessionmem.getMem_code());

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
	//�Ա��ϱ� (�ӽñ��)
	@RequestMapping(value={ "/deposit" })
	public ModelAndView executedeposit(HttpSession session,String ac_num) {
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		System.out.println("******************�Աݽ����,���¹�ȣ�� ="+ac_num+",");
		
		String money ="10000";
		
		System.out.println("��������"+bangkingdao.depcheckac(ac_num));
		
		if(bangkingdao.depcheckac(ac_num)>=1) {
		Map<String, String> paramapsp = new HashMap<String, String>();
		paramapsp.put("ac_num", ac_num);
		paramapsp.put("sp_name", "�Ա��׽�Ʈ��");
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
	
	//����ϱ�(�ӽñ��)
	@RequestMapping(value={ "/withdraw" })
	public ModelAndView executewithdraw(HttpSession session,String ac_num) {
		//int acnum = Integer.parseInt(ac_num);
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		System.out.println("******************��ݽ����,���¹�ȣ�� ="+ac_num+",");
		
		String money ="10000";
		
		System.out.println("��������"+bangkingdao.witcheckac(ac_num));
		
		if(bangkingdao.witcheckac(ac_num)>=1) {
			Map<String, String> paramckbal = new HashMap<String, String>();
			paramckbal.put("ac_num", ac_num);
			paramckbal.put("mem_code", String.valueOf(sessionmem.getMem_code()));
			if(Long.parseLong(bangkingdao.witcheckbal(paramckbal)) >= Long.parseLong(money)) {
				Map<String, String> paramapsp = new HashMap<String, String>();
				paramapsp.put("ac_num", ac_num);
				paramapsp.put("mem_code", String.valueOf(sessionmem.getMem_code()));
				paramapsp.put("sp_name", "����׽�Ʈ��");
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
	//�ڵ���ü ����
	@RequestMapping(value = "/transfer_process")
	public ModelAndView transferprocess(HttpSession session
			,@RequestParam(value = "myac") String myac
			,@RequestParam(value = "yourac") String yourac
			,@RequestParam(value = "youracmem") String youracmem
			,@RequestParam(value = "trmoney") String trmoney
			,@RequestParam(value = "youracwrite", defaultValue = "��ü�ε���") String youracwrite
			,@RequestParam(value = "myacwrite", defaultValue = "��ü�κ���") String myacwrite
			
			) {
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		System.out.println("Ʈ�������Դϴ�."+sessionmem.getMem_code());
		System.out.println("���ǰ���"+myac);
		System.out.println("�Աݰ���"+yourac);
		System.out.println("�Աݾ�"+trmoney);
		System.out.println("�޴º�����ǥ��"+youracwrite);
		System.out.println("��������ǥ��"+myacwrite);

		
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
					System.out.println("��ü�����");
				}
			}
		}
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:inquire");
		return mav;
	}
	
//	@RequestMapping(value={ "/getsession" })
//	public ModelAndView getsession(HttpServletRequest req,@RequestParam(value = "mem_code") String mem_code) {
//		System.out.println("����ڵ�� : "+mem_code);
//		HttpSession session =req.getSession();
//		//session.invalidate();
//		session.setAttribute("mem_code", mem_code);
//		ModelAndView mav = new ModelAndView();
//		System.out.println("���ǳֱ� ����");
//		System.out.println("���� ���� : "+session.getAttribute("mem_code"));
//		mav.setViewName("redirect:inquire");
//		return mav;
//	}
	
	
	
	//���³�������ȸ������
	@RequestMapping(value = { "/inquire_detail" })
	public ModelAndView inqure_detailPage(
			HttpSession session
			,PageVO pvo
			,@RequestParam(value = "ac_num") String ac_num
			,@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage
			,@RequestParam(value = "cntPerPage", required = false, defaultValue = "20") String cntPerPage
			) {
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		System.out.println("ac_num : "+ac_num);
		System.out.println("session ? : "+sessionmem.getMem_code());
		Map<String, String> historymap = new HashMap<String, String>();
		historymap.put("ac_num", ac_num);
		historymap.put("mem_code", String.valueOf(sessionmem.getMem_code()));
		
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
	//��ü �������� �̵�
	@RequestMapping(value = { "/transfer" })
	public ModelAndView transferPage(HttpSession session,@RequestParam(value = "ac_num",defaultValue = "0") String ac_num) {
		
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		System.out.println("��ü ������ "+sessionmem.getMem_code());

		Map<String, String> getmyaclistwhentr =new  HashMap<String, String>();
		getmyaclistwhentr.put("mem_code", String.valueOf(sessionmem.getMem_code()));
		getmyaclistwhentr.put("ac_num", ac_num);
		
		
		List<String> myaclist = bangkingdao.getmyaclistwhentr(getmyaclistwhentr);

		//List<Integer> myaclist = bangkingDao.getmyaclistwhentr(sessionmem.getMem_code());

		for(String e : myaclist) {
			System.out.println(e);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deposit/deposite_transfer");
		mav.addObject("myaclist",myaclist);
		
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
	
	@RequestMapping(value = { "/transfer_auto_apply_process" })
	public ModelAndView transferautoapplyprocess(
			HttpSession session
			,At_applicationVO atapplyvo
			,@RequestParam( defaultValue = "-1", required = false) String atastopdate
			,@RequestParam( defaultValue = "-1", required = false) String atadterm
			//�Ķ���� ����Ʈ�� �ޱ����ؼ� ����� ����ŷ� ������
			//���ͷ� vo���� �־��־���.
			) {
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		atapplyvo.setMem_code(String.valueOf(sessionmem.getMem_code()));
		atapplyvo.setAta_stopdate(atastopdate);
		atapplyvo.setAta_dterm(Integer.parseInt(atadterm));
		
//		System.out.println(atapplyvo.getAc_num());
//		System.out.println(atapplyvo.getMem_code());
//		System.out.println(atapplyvo.getAta_opac());
//		System.out.println(atapplyvo.getAta_setmny());
//		System.out.println(atapplyvo.getAta_dterm());
//		System.out.println(atapplyvo.getAta_startdate());
//		System.out.println(atapplyvo.getAta_stopdate());
//		System.out.println(atapplyvo.getAta_time());
		bangkingdao.insertatapply(atapplyvo);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:transfer_auto");
		return mav;
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
