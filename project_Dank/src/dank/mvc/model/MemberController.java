package dank.mvc.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dank.mvc.dao.MemberDao;
import dank.mvc.vo.MemberVO;
import dank.mvc.vo.PageVO;
import dank.mvc.vo.UserVO;
@Controller
public class MemberController {
	@Autowired
	private MemberDao memberDao;

//	// ȸ������ �� ����
	@RequestMapping(value = "/memberForm")
	public String memberForm() {
		return "member/memberForm";
	}
	@RequestMapping(value = "/idchk")
	public ModelAndView idchk(String mem_email) {
		ModelAndView mav = new ModelAndView("member/server/idchkserver");
		int chk=memberDao.idchk(mem_email);
		String idchk ="";
		
		if(chk>0) {
			idchk="<p style='color:red'>�ߺ��� �̸����Դϴ�.</p>";
			idchk+="<input type='hidden' id='chk' value='0'>";
			
		}else if (mem_email.equals("")) {
			idchk="<p style='color:red'>�̸����� �Է��� �ּ���.</p>";
			idchk+="<input type='hidden' id='chk' value='0'>";
		}
		
		else {
			idchk="<p style='color:blue'>��밡���� �̸����Դϴ�.</p>";
			idchk+="<input type='hidden' id='chk' value='1'>";
		}
		mav.addObject("idchk", idchk);
		return mav;
	}
	@RequestMapping(value = "/memberjoin")
	public String memberjoin(MemberVO vo,String mem_phn1,String mem_phn2,String mem_phn3) {
		vo.setMem_phn(mem_phn1+"-"+mem_phn2+"-"+mem_phn3);
		System.out.println(vo.getMem_birth());
		System.out.println(vo.getMem_code());
		System.out.println(vo.getMem_email());
		System.out.println(vo.getMem_gender());
		System.out.println(vo.getMem_in_date());
		System.out.println();
		System.out.println();
		System.out.println();
		memberDao.memberjoin(vo);
		return "login/login";
	}
	@RequestMapping(value = "/radio")
	public ModelAndView radio(int radio) {
		ModelAndView mav = new ModelAndView("member/server/idchkserver");
		String mem_pri_chk=null;
		if(radio==0) {
		mem_pri_chk = "<input type='radio' id='check1' name='mem_pri_chk' value='1'>����"; 
		mem_pri_chk	+="<input type='radio' id='check2' name='mem_pri_chk' value='0' checked='checked'>����";
		}else if(radio==1) {
			mem_pri_chk = "<input type='radio' id='check1' name='mem_pri_chk' value='1' checked='checked'>����"; 
			mem_pri_chk	+="<input type='radio' id='check2' name='mem_pri_chk' value='0'>����";
		}
		mav.addObject("idchk", mem_pri_chk);
		return mav;
	}
//	// ȸ������ó���ϱ�
	@PostMapping("/memberIn") 
	public ModelAndView addMember(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		//int res = memberDao.memberAdd(vo);
		/*
		 * if (res == 1) {// ���̹�Ƽ�� �۾��� ���� //mav.setViewName("member/success");
		 * mav.setViewName("redirect:/"); mav.addObject("mid", vo.getMem_email()); }
		 * else { mav.setViewName("member/error"); }
		 */
		return mav;
	}
	
	@RequestMapping(value= "/1on1question_prichk")
	public String indexmm2() {
		return "member/1on1question_prichk";
	}
	@RequestMapping(value= "/1on1question")
	public String indexmm4() {
		return "member/1on1question";
	}
	
	//�α��� �������� �̵����� 	
	@RequestMapping(value= "/loginPage")
	public String goLoginPage(HttpSession session, Model m) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member != null) { //���� ������ �����Ѵٸ� home ���� 
			return "index/index";
		}
		
		return "login/login"; //�������� �ʴ´ٸ� �α��� �������� 
	}
	
	//�α��� �� �α��� �� ����� ������ ���ǿ� ���� 
    @RequestMapping(value = "/login" ,method = RequestMethod.POST ,produces = "application/json")
	public String loginPage(@ModelAttribute UserVO user , HttpServletRequest req, Model m) throws Exception {
		MemberVO memberVO =  memberDao.memLogin(user);
		//UserVO userVO = registerService.selectUser(user);
		HttpSession session = req.getSession();
		if(memberVO != null) {
			//System.out.println("�α��μ���!");
			session.setAttribute("member", memberVO);
			return "index/index";
		}
		//System.out.println("�α��ν���!");
		return "login/login";
	}
    
    //�α׾ƿ�
    @RequestMapping(value= "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login/login";
	}

	
}