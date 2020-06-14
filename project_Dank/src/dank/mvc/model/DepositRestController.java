package dank.mvc.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import dank.mvc.dao.BangkingDao;
import dank.mvc.dao.DepositDao;
import dank.mvc.vo.MemberVO;
import dank.mvc.vo.deposit.Installment_savingVO;
import dank.mvc.vo.deposit.SavingVO;



@RestController
public class DepositRestController {
	@Autowired
	private DepositDao depositDao;
	
	@RequestMapping(value = "/savlist")
	public List<SavingVO> savlist() {
		return depositDao.getSavlist();
	}
	
	@RequestMapping(value = "/inslist")
	public List<Installment_savingVO> inslist() {
		return depositDao.getInslist();
	}
	//////////����////////////////////////////////////////////////////
	//////////38��///////////////////////////////////////////////////
	//////////����///////////////////////////////////////////////////
	@Autowired
	private BangkingDao bangkingdao;
	@RequestMapping(value = "/getmemcodewhentr")
	public List<Map<String, String>> gettransfermemcode(String acnum) {/////ac_num �̾ƴ϶� acnum��
		List<Map<String, String>>  val= 	bangkingdao.getmemcodewhentr(acnum);
	
		return val;
	}
	@RequestMapping(value = "/getmybalwhentr")
	public int getmybalwhentr(HttpSession session,String ac_num) {
		MemberVO sessionmem = (MemberVO) session.getAttribute("member");
		Map<String, String> getmybalwhentr = new HashMap<String, String>();
		getmybalwhentr.put("mem_code", String.valueOf(sessionmem.getMem_code()));
		getmybalwhentr.put("ac_num", ac_num);
		return bangkingdao.getmybalwhentr(getmybalwhentr);
	}
}
