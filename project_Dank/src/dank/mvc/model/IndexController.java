package dank.mvc.model;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskRejectedException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import dank.mvc.dao.BangkingDao;
import dank.mvc.othersetting.AsyncConfig;
import dank.mvc.othersetting.AsyncTaskAutoTransfer;
import dank.mvc.vo.deposit.At_applicationVO;

@Controller
public class IndexController {
		//������
		@Resource(name = "asyncTaskAutoTransfer")
		private AsyncTaskAutoTransfer asyncTaskAutoTransfer;
		//AsyncConfig
		@Resource(name = "asyncConfig")
		private AsyncConfig asyncConfig;
		@Autowired
		boolean autoTransferChk;
		@Autowired
		private BangkingDao bangkingdao;
	
		@RequestMapping(value= {"/","/index"})
		public String indexPage(HttpSession session) throws Exception {
			HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String ip = req.getHeader("X-FORWARDED-FOR");
			if (ip==null) {
				ip = req.getRemoteAddr();
			}
			System.out.println("ip����: "+ip);
			session.removeAttribute("error");
			session.removeAttribute("pageName");
			
			

			//�ڵ���ü ������
			try {
				
	            // ��� ���� ���� üũ
	            if (asyncConfig.isTaskExecute()) {
	            	//�ι����� ����
	            	if(autoTransferChk) {
	            		autoTransferChk=false;
		            	Set<Thread> threadSet = Thread.getAllStackTraces().keySet();
		            	for (Thread e : threadSet) {
		            		System.out.println(e.getName()+autoTransferChk);
		            	}
		            	System.out.println("now thread name"+Thread.currentThread().getName());
		            	asyncTaskAutoTransfer.executorAutotrnsfer("atr");
	            	}
	            } else {
	                System.out.println("==============>>>>>>>>>>>> THREAD ���� �ʰ�");
	            }
	        } catch (Exception e) {
	            // TaskRejectedException : ���� �ʰ��� �߻�
	            System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
	            System.out.println("TaskRejectedException : ��� ���� �ʰ�");
	            System.out.println("==============>>>>>>>>>>>> THREAD ENDs");
	        }
			
			
			return "index/index";
		}

}
