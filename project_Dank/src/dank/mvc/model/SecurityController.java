package dank.mvc.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dank.mvc.dao.BangkingDao;
import dank.mvc.dao.DepositDao;
import dank.mvc.dao.MemberDao;
import dank.mvc.dao.SecurityDao;
import dank.mvc.method.Mail;
import dank.mvc.method.SecurityCode;

import dank.mvc.vo.MemberVO;
import dank.mvc.vo.security.Security_CardVO;
import dank.mvc.vo.security.Security_Card_RegVO;


import dank.mvc.vo.deposit.AccountVO;


@Controller
public class SecurityController {

	
	@Autowired
	private DepositDao depositDao;
	
	@Autowired
	private BangkingDao bangkingdao;
	
	@Autowired
	private SecurityCode securityCode;

	@Autowired
	private SecurityDao securityDao;
	
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private Mail mail;
	
	@RequestMapping(value = "/security")
	public String viewSecurity(Model m, HttpSession session) {
		
		return "security/security";
	}
	
	// ����ī�� ���� ����
	@RequestMapping(value = "/securitysertify")
	public String viewSecuritySertify(Model m) {
		
		
		int mem_code = 2;
		Security_Card_RegVO vo = securityDao.securityCardDetail(mem_code);
		m.addAttribute("scrVo",vo);
		m.addAttribute("scCardNum", vo.getSecCard().getSc_detcode());
		MemberVO memberVO = memberDao.numToEmailName(mem_code);
		String name = memberVO.getMem_name();
		m.addAttribute("name", name);
		
		String[][] securityCheckData = securityCode.cardNumControll(vo.getSecCard());
		m.addAttribute("scd",securityCheckData);
		return "security/securityCardSertify";
	}

	@RequestMapping(value = "/securitycard")
	public String viewSecurity_card(Model m) {
		int mem_code = 4;
		List<AccountVO> aclist = bangkingdao.getaclist(mem_code);
		MemberVO memberVO = memberDao.numToEmailName(mem_code);
		m.addAttribute("aclist", aclist);
		m.addAttribute("memberVO", memberVO);
		return "security/securityCard";
	}

	@RequestMapping(value = "/securitycardinfoView")
	public String viewSecurityCardInfoView(Model m , AccountVO accountVO, MemberVO memberVO, @RequestParam(value = "successData", defaultValue = "fail") String successData) {
		int mem_code = 4;
		System.out.println(successData);
		int pwd = depositDao.pwdChk(mem_code);
		if (accountVO.getAc_pwd().equals(pwd)) {
			System.out.println("�н����尡 Ʋ�Ƚ��ϴ�.");
			return "redirect:securitycard";
		}
		return "security/securityCardInfoView";
	}

	// ����ī�� ����� ���
	@RequestMapping(value = "/securitycardcreate")
	public String viewSecurity_card_success(Model m, Security_Card_RegVO vo) {
		if (securityDao.scrNumChk(vo.getMem_code())==1) {
			// ���� ������ �����Ƿ� �̹� �ִٰ� ǥ�õȴ�.
			return "security/securityCardInfoView";
		}else {
			Security_CardVO security_Cardvo = securityCode.securityCardCreate();
			securityDao.cardCreate(security_Cardvo);
			vo.setSc_code(security_Cardvo.getSc_code());
			securityDao.securityCardReq(vo);
			// ���Ϸ� ������� ����ī�带 �����ش�.
			MemberVO memberVO = memberDao.numToEmailName(vo.getMem_code());
			String name = memberVO.getMem_name();
			String email = memberVO.getMem_email();
			String content = securityCode.securityCardSend(security_Cardvo, name);
			mail.emailSend(email, name, name+"���� ����ī��", content);
			return "security/securityCardSuccess";
		}
		
	}

	@RequestMapping(value = "/securityotp")
	public String viewSecurity_otp() {
		return "security/securityOtp";
	}

	@RequestMapping(value = "/securityotpsuccess")
	public String viewCheckBalance() {
		return "security/securityOtpSuccess";
	}
}
