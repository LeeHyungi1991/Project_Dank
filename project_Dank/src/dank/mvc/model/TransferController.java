package dank.mvc.model;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dank.mvc.dao.TransferDao;
import dank.mvc.service.TransferService;

@Controller
public class TransferController {
	@Autowired
	private TransferDao transferdao;
	@Autowired
	private TransferService transferservice;
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
		
		
		
		
		if(transferdao.trAcChk(myac) >=1) {
			if(transferdao.trAcChk(yourac) >=1) {
				if(transferdao.balChk(mapmy) >=trmoney) {
					transferservice.transferprocess(trmoney, mapmy, mapmysp, mapyour, mapyoursp);
					System.out.println("��ü�����");
				}
			}
		}
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:inquire?mem_code="+session.getAttribute("mem_code"));
		return mav;
	}
}
