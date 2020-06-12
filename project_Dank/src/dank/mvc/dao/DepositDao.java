package dank.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dank.mvc.vo.deposit.AccountVO;
import dank.mvc.vo.deposit.Installment_savingVO;
import dank.mvc.vo.deposit.SavingVO;





@Repository
public class DepositDao {
	@Autowired
	private SqlSessionTemplate ss;
	

//	public SavingVO getSavingQuaDetail(int sav_code) {
//		return ss.selectOne("deposit.savingDetail",sav_code);
//	}
	// 비밀번호 체크
	public int pwdChk(int acNum) {
		return ss.selectOne("deposit.accountPwChk",acNum);
	}
	
	public List<AccountVO> getaclist(int mem_code){
		return ss.selectList("deposit.acinquery", mem_code);
	}
	public SavingVO getSavingQuaDetail(int sav_code) {
		return ss.selectOne("deposit.savingDetail",sav_code);
	}
	
	public Installment_savingVO getInsQuaDetail(int ins_code) {
		return ss.selectOne("deposit.insDetail",ins_code);
	}
	
	public List<SavingVO> getSavlist(){
		return ss.selectList("deposit.savlist");

	}
	public List<Installment_savingVO> getInslist(){
		return ss.selectList("deposit.inslist");

	}
}
