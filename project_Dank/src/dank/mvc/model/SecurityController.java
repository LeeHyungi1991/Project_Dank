package dank.mvc.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	private SecurityCode securityCode;

	@Autowired
	private SecurityDao securityDao;
	
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private Mail mail;
	
	@RequestMapping(value = "/security")
	public String viewSecurity() {
		return "security/security";
	}
	
	// ����ī�� ���� ����
	@RequestMapping(value = "/securitysertify")
	public String viewSecuritySertify(Model m) {
		
		
		
		
		int code = 2;
		Security_Card_RegVO vo = securityDao.securityCardDetail(code);
		m.addAttribute("scrVo",vo);
		MemberVO memberVO = memberDao.numToEmailName(code);
		String name = memberVO.getMem_name();
		m.addAttribute("name", name);
		
		String[][] securityCheckData = securityCode.cardNumControll(vo.getSecCard());
		m.addAttribute("scd",securityCheckData);
		return "security/securityCardSertify";
	}

	@RequestMapping(value = "/securitycard")
	public String viewSecurity_card(Model m) {
		// ����ī�忡 ��� ��ȣ�� �ѱ��.
		//m.addAttribute("mem_num", 3);
		return "security/securityCard";
	}

	@RequestMapping(value = "/securitycardinfoView")
	public String viewSecurityCardInfoView(Model m/* , AccountVO accountVO, MemberVO memberVO */) {
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
