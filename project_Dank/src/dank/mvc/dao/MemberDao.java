<<<<<<< HEAD
package dank.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate ss;
	
	public String nameChk(String email) {
		return ss.selectOne("member.namechk", email);
	}
}
=======
package dank.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dank.mvc.vo.MemberVO;
import dank.mvc.vo.PageVO;

@Repository
public class MemberDao {

@Autowired
private SqlSessionTemplate ss;

public int memberAdd(MemberVO vo) {
	//�Է�ó���Ǹ�1, �����ϸ� 0�� ��ȯ�Ѵ�.
	return ss.insert("member.add", vo);
}

public List<MemberVO> getList(PageVO svo){
	return ss.selectList("member.list",svo);
}
public List<MemberVO> getSeachList(PageVO svo){
	return ss.selectList("member.searchlist",svo);
}
public int getTotalCount() {
	return ss.selectOne("member.totalCount");
}

}
>>>>>>> branch 'master' of https://github.com/wlsgb/HD_Bank.git
