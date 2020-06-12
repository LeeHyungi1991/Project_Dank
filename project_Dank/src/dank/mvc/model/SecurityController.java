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
import dank.mvc.vo.SecuritySertufyVO;
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

	// ����ī�� ���� ��������
	@RequestMapping(value = "/securitysertify")
	public String viewSecuritySertify(Model m, HttpSession session) {

		int mem_code = ((MemberVO) session.getAttribute("member")).getMem_code();
		Security_Card_RegVO vo = securityDao.securityCardDetail(mem_code);
		m.addAttribute("scrVo", vo);
		m.addAttribute("scCardNum", vo.getSecCard().getSc_detcode());
		MemberVO memberVO = memberDao.numToEmailName(mem_code);
		String name = memberVO.getMem_name();
		m.addAttribute("name", name);

		String[][] securityCheckData = securityCode.cardNumControll(vo.getSecCard());
		session.setAttribute("securityCheckData", securityCheckData);
		m.addAttribute("scd", securityCheckData);
		return "security/securityCardSertify";
	}

	// ����ī�� ���� ��� ������
	@RequestMapping(value = "/ssc")
	public String securitySertifyChk(Model m, HttpSession session, String page, SecuritySertufyVO securitySertufyVO) {
		// ���� �������� <input type="hidden"> ���� �Է� �޾ƿ´�.
		// �Է¹��� ������
		String main_code = securitySertufyVO.getMain_code();
		String fir_code = securitySertufyVO.getFir_code();
		String sec_code = securitySertufyVO.getSec_code();
		// ���䵥����
		String[][] realData = (String[][]) session.getAttribute("securityCheckData");
		
		if (main_code.equals(realData[0][2])&&fir_code.equals(realData[1][2])&&sec_code.equals(realData[2][2])) {
			
		}
		return page;
	}

	// ����ī�� ��û �� ������
	@RequestMapping(value = "/securitycard")
	public String viewSecurity_card(Model m, HttpSession session,
			@RequestParam(value = "error", defaultValue = "t") String error) {
		if (session.getAttribute("member") == null) {
			return "login/login";
		} else if (securityDao.scrNumChk(((MemberVO) session.getAttribute("member")).getMem_code()) >= 1) {
			session.setAttribute("error", "f");
			return "security/security";
		}
		System.out.println(session.getAttribute("member"));
		int mem_code = ((MemberVO) session.getAttribute("member")).getMem_code();
		List<AccountVO> aclist = bangkingdao.getaclist(mem_code);
		MemberVO memberVO = memberDao.numToEmailName(mem_code);
		m.addAttribute("aclist", aclist);
		m.addAttribute("memberVO", memberVO);
		m.addAttribute("error", error);
		return "security/securityCard";
	}

	// ����ī�� �Է� Ȯ�� ������
	@RequestMapping(value = "/securitycardinfoView")
	public String viewSecurityCardInfoView(Model m, AccountVO accountVO, MemberVO memberVO, String acNameNum,
			@RequestParam(value = "successData", defaultValue = "fail") String successData, HttpSession session) {
		if (session.getAttribute("member") == null) {
			return "login/login";
		}
		System.out.println("acNameNum : " + acNameNum);
		String acNum = acNameNum.split("-")[1];
		String pwd = String.valueOf(depositDao.pwdChk(Integer.parseInt(acNum)));
		// �н����� ������
		if (accountVO.getAc_pwd().equals(pwd) && successData.equals("success")) {
			m.addAttribute("acNameNum", acNameNum);
			m.addAttribute("mem_email", memberVO.getMem_email());
			return "security/securityCardInfoView";
		} else {

			return "redirect:securitycard?error=f";
		}
	}

	// ����ī�� ����� ���
	@RequestMapping(value = "/securitycardcreate")
	public String viewSecurity_card_success(Model m, HttpSession session) {
		if (securityDao.scrNumChk(((MemberVO) session.getAttribute("member")).getMem_code()) == 1) {
			return "index/index";
		} else if (session.getAttribute("member") == null) {
			return "login/login";
		}
		Security_CardVO security_Cardvo = securityCode.securityCardCreate();
		securityDao.cardCreate(security_Cardvo);
		Security_Card_RegVO vo = new Security_Card_RegVO();
		vo.setMem_code(((MemberVO) session.getAttribute("member")).getMem_code());
		vo.setSc_code(security_Cardvo.getSc_code());
		securityDao.securityCardReq(vo);
		// ���Ϸ� ������� ����ī�带 �����ش�.
		MemberVO memberVO = memberDao.numToEmailName(vo.getMem_code());
		session.setAttribute("scrVO", vo);
		session.setAttribute("security_Cardvo", security_Cardvo);
		String name = memberVO.getMem_name();
		String email = memberVO.getMem_email();
		String content = securityCode.securityCardSend(security_Cardvo, name);
		mail.emailSend(email, name, name + "���� ����ī��", content);
		m.addAttribute("memberVO", memberVO);
		return "security/securityCardSuccess";
	}

	@RequestMapping(value = "/reMail")
	public String reMail(Model m, HttpSession session) {
		if (session.getAttribute("member") == null) {
			return "login/login";
		}
		Security_Card_RegVO vo = (Security_Card_RegVO) session.getAttribute("scrVO");
		MemberVO memberVO = memberDao.numToEmailName(vo.getMem_code());
		String name = memberVO.getMem_name();
		String email = memberVO.getMem_email();
		String content = securityCode.securityCardSend((Security_CardVO) session.getAttribute("security_Cardvo"), name);
		mail.emailSend(email, name, name + "���� ����ī��", content);
		m.addAttribute("memberVO", memberVO);
		return "security/securityCardSuccess";
	}

	@RequestMapping(value = "/scsuccess")
	public String securityCardSuccess(Model m, HttpSession session) {
		session.removeAttribute("scrVO");
		session.removeAttribute("security_Cardvo");
		return "redirect:index";
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
