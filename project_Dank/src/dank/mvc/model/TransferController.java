package dank.mvc.model;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dank.mvc.dao.TransferDao;

@Controller
public class TransferController {
	@Autowired
	private TransferDao transfer;
	@RequestMapping(value = "/transfer_process")
	public ModelAndView transferprocess(HttpSession session
			,@RequestParam(value = "myac") String myac
			,@RequestParam(value = "yourac") String yourac
			,@RequestParam(value = "trmoney") int trmoney
			,@RequestParam(value = "youracwrite") String youracwrite
			,@RequestParam(value = "myacwrite") String myacwrite
			
			) {
		System.out.println("Ʈ�������Դϴ�."+session.getAttribute("mem_code"));
		System.out.println("���ǰ���"+myac);
		System.out.println("�Աݰ���"+yourac);
		System.out.println("�Աݾ�"+trmoney);
		System.out.println("�޴º�����ǥ��"+youracwrite);
		System.out.println("��������ǥ��"+myacwrite);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:inquire?mem_code="+session.getAttribute("mem_code"));
		return mav;
	}
}
