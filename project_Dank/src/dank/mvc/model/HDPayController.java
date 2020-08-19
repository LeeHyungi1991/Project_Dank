package dank.mvc.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dank.mvc.dao.MemberDao;
import dank.mvc.vo.MemberVO;

@RestController
public class HDPayController {

	@Autowired
	private MemberDao memberDao;
	
	//hdpay login
	@ResponseBody
	@RequestMapping(value = "/hdpaylogin" , produces="text/plain;charset=UTF-8")
	public String hdpayLogin(MemberVO member) 
			throws JsonProcessingException {
//		String mem_email= req.getParameter("mem_email");
//		String mem_pwd= req.getParameter("mem_pwd");
//		System.out.println("mem_email:"+mem_email+",mem_pwd:"+mem_pwd);
//		
//		MemberVO member = new MemberVO();
//		member.setMem_email(mem_email);
//		member.setMem_pwd(mem_pwd);
		
		MemberVO user = memberDao.memLogin(member);
		
		if(user != null) {
			//return "login success";
			//session.setAttribute("login", user);
			
			String userInfo = new ObjectMapper().writeValueAsString(user);

            return userInfo;
		}else {
			//return "login failed";
			//session.invalidate(); //�α��� �����ÿ��� ���� ���̵� �ȵ���̵�� �Ѿ.
            return null;
		}
		
    }


}
