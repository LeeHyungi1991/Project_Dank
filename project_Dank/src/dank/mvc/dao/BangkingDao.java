package dank.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dank.mvc.vo.deposit.AccountHistoryVO;
import dank.mvc.vo.deposit.AccountVO;
import dank.mvc.vo.deposit.At_applicationVO;

@Repository
public class BangkingDao {
	@Autowired
	private SqlSessionTemplate ss;
	//������ȸ�� ó�� ������ ������ ���ڵ带 �̿��Ͽ� ���� ���� ��ü ���
	public List<AccountVO> getaclist(int mem_code){
		return ss.selectList("bangking.acinquery", mem_code);
	}
	
	// ���¹�ȣ�� ������ ��� ��ȣ�� �����´�.
	public int acnumToMemcode(String ac_num) {
		return ss.selectOne("bangking.actomemnum",ac_num);
	}
	
	///////////////////////////////////////////////////////////�Աݽ���@
	public int depcheckac(String ac_num) {
		System.out.println("checkac");
		return ss.selectOne("bangking.depcheckac", ac_num);
	}
	public void depplusdep(String dep_money) {
		System.out.println("plusdep");
		ss.insert("bangking.depplusdep", dep_money);
	}
	public void depplussp(Map<String, String> paramapsp ) {
		System.out.println("plussp");
		ss.insert("bangking.depplussp", paramapsp );
	}
	public void depdepupbalance(Map<String, String> paramapbal) {
		System.out.println("depupbalance");
		ss.update("bangking.depdepupbalance", paramapbal);
	}
	///////////////////////////////////////////////////////////�Ա�����/@
	
	///////////////////////////////////////////////////////////��ݽ���@
	public int witcheckac(String ac_num) {
		System.out.println("checkac");
		return ss.selectOne("bangking.witcheckac", ac_num);
	}
	
	public String witcheckbal(Map<String, String> paramckbal) {
		System.out.println("checkbalance");
		return ss.selectOne("bangking.witcheckbalance", paramckbal);
	}
	
	public void witpluswit(String wit_money) {
		System.out.println("pluswit");
		ss.insert("bangking.witpluswit", wit_money);
	}
	public void witplussp(Map<String, String> paramapsp ) {
		System.out.println("plussp");
		ss.insert("bangking.witplussp", paramapsp );
	}
	public void witwitupbalance(Map<String, String> paramapbal) {
		System.out.println("witupbalance");
		ss.update("bangking.witwitupbalance", paramapbal);
	}
	///////////////////////////////////////////////////////////�������/@
	///////////////////////////////////////////////////////////������ü����@
	public int trtrAcChk(String ac_num) {
		return ss.selectOne("bangking.tracchk", ac_num);
	}
	public String trbalChk(Map<String, String> mapmy) {
		return ss.selectOne("bangking.trbalchk", mapmy);
	}
	
	
	public void trpluswit(String wit_money) {
		ss.insert("bangking.trpluswit", wit_money);
	}
	public void trpluswittr(Map<String, String> mapmy) {
		ss.insert("bangking.trpluswittr", mapmy);
	}
	public void trplusspwit(Map<String, String> mapmysp) {
		ss.insert("bangking.trplusspwit", mapmysp);
	}
	public void trtrwitupbal(Map<String, String> mapmy) {
		ss.update("bangking.trtrwitupbal", mapmy);
	}
	
	
	public void trplusdep(String dep_money) {
		ss.insert("bangking.trplusdep", dep_money);
	}
	public void trplusdeptr(Map<String, String> mapyour) {
		ss.insert("bangking.trplusdeptr", mapyour);
	}
	public void trplusspdep(Map<String, String> mapyoursp) {
		ss.insert("bangking.trplusspdep", mapyoursp);
	}
	public void trtrdepupbal(Map<String, String> mapyour) {
		ss.update("bangking.trtrdepupbal", mapyour);
	}
	///////////////////////////////////////////////////////////������ü����/@
	
	///////////////////////////////////////////////////////////�ŷ�������ȸ����@
	public List<AccountHistoryVO> gethistory(Map<String, String> historymap){
		return ss.selectList("bangking.achistory", historymap);
	}
	public int gettotalcnt(Map<String, String> historymap) {
		return ss.selectOne("bangking.totalcnt", historymap);
	}
	//������ü�Ҷ� ����Ʈ��Ʈ�ѷ����� ���޾ƿ�
	public List<Map<String, String>> getmemcodewhentr(String ac_num) {
		return ss.selectList("bangking.getmemcodewhentr", ac_num);
	}
	public List<String> getmyaclistwhentr(Map<String, String> getmyaclistwhentr) {
		return ss.selectList("bangking.getmyaclistwhentr", getmyaclistwhentr);
	} 
	public String getmybalwhentr(Map<String, String> getmybalwhentr) {
		return ss.selectOne("bangking.getmybalwhentr", getmybalwhentr);
	}
	///////////////////////////////////////////////////////////�ŷ�������ȸ����/@
	///////////////////////////////////////////////////////////�ڵ���ü����@
	public void insertatapply(At_applicationVO atapplyvo) {
		ss.insert("bangking.atapply", atapplyvo);
	}
	
	///////////////////////////////////////////////////////////�ڵ���ü����/@
	
}
