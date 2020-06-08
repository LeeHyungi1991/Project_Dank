package dank.mvc.method;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dank.mvc.dao.SecurityDao;
import dank.mvc.vo.security.Security_CardVO;

@Repository
public class SecurityCode {

	@Autowired
	private SecurityDao securityDao;

	// �Է��� ���ڸ�ŭ �ڸ����� ������ ���ڷ� �����ȴ�.
	// �� ) 4 => 5249
	public String securityCodeMaking(int len) {
		StringBuffer emailSecuCode = new StringBuffer();
		int a = len / 2;
		String front = "";
		String back = "";
		int random = 0;

		// ���ڸ��� ���ڸ��� ���ڰ� ������ ���ڸ��� �ٽ� ������.
		do {
			front = "";
			back = "";
			// �� �ڸ��� ���ڸ� �������� �Է��Ѵ�.
			for (int i = 0; i < a; i++) {
				random = (int) (Math.random() * 9);
				front += random;
			}
			// �� �ڸ��� ���ڸ� �������� �Է��Ѵ�.
			for (int i = 0; i < a; i++) {
				random = (int) (Math.random() * 9);
				back += random;
			}
		} while (front.equals(back));
		
		emailSecuCode.append(front).append(back);
		System.out.println(emailSecuCode.toString());
		return emailSecuCode.toString();
	}

	public Security_CardVO securityCardCreate() {
		Security_CardVO vo = new Security_CardVO();
		// �Ϸù�ȣ�� �־��ش�.
		String priCode = "";
		do {
			priCode = securityCodeMaking(8);
			vo.setSc_code(Integer.parseInt(priCode));
		} while (securityDao.priCodeChk(vo) == 1);

		// 30���� ��ȣ�� �־��ش�.
		String[] subCode = new String[30];
		for (int i = 0; i < 30; i++) {
			subCode[i] = securityCodeMaking(4);
		}
		vo.setSc_detcode_1(subCode[0]);
		vo.setSc_detcode_2(subCode[1]);
		vo.setSc_detcode_3(subCode[2]);
		vo.setSc_detcode_4(subCode[3]);
		vo.setSc_detcode_5(subCode[4]);
		vo.setSc_detcode_6(subCode[5]);
		vo.setSc_detcode_7(subCode[6]);
		vo.setSc_detcode_8(subCode[7]);
		vo.setSc_detcode_9(subCode[8]);
		vo.setSc_detcode_10(subCode[9]);
		vo.setSc_detcode_11(subCode[10]);
		vo.setSc_detcode_12(subCode[11]);
		vo.setSc_detcode_13(subCode[12]);
		vo.setSc_detcode_14(subCode[13]);
		vo.setSc_detcode_15(subCode[14]);
		vo.setSc_detcode_16(subCode[15]);
		vo.setSc_detcode_17(subCode[16]);
		vo.setSc_detcode_18(subCode[17]);
		vo.setSc_detcode_19(subCode[18]);
		vo.setSc_detcode_20(subCode[19]);
		vo.setSc_detcode_21(subCode[20]);
		vo.setSc_detcode_22(subCode[21]);
		vo.setSc_detcode_23(subCode[22]);
		vo.setSc_detcode_24(subCode[23]);
		vo.setSc_detcode_25(subCode[24]);
		vo.setSc_detcode_26(subCode[25]);
		vo.setSc_detcode_27(subCode[26]);
		vo.setSc_detcode_28(subCode[27]);
		vo.setSc_detcode_29(subCode[28]);
		vo.setSc_detcode_30(subCode[29]);
		return vo;
	}
}
