package dank.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dank.mvc.vo.MemberVO;
import freemarker.core.ReturnInstruction.Return;
@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate ss;
	//ss ���̹�Ƽ�� �����Ѱ�
	//�Է�ó��
	public int memberAdd(MemberVO vo) {
		// �Է�ó���� �Ǹ� 1, �����ϸ� 0 ��ȯ�Ѵ�.
		return ss.insert("member.add",vo);
	}
	
}
