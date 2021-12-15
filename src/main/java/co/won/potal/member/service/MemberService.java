package co.won.potal.member.service;

import java.util.List;

public interface MemberService {
	List<MemberVO> memberSelectList();
	MemberVO memberSelerct(MemberVO vo); // 한명 정보 조회 / 로그인 채크
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
	boolean memberIdCheck(String id); // 아이디 중복 체크용
}
