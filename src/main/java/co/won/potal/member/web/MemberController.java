package co.won.potal.member.web;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.won.potal.member.service.MemberService;
import co.won.potal.member.service.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService memberDao; // DAO 자동주입
	
//	@Autowired // 테스트용
//	String upload; // 파일 저장소 bean 객체로 만들은 것 운영서버 배포시 삭제해야한다.
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "member/loginForm"; // 폼 호출
	}
	
	// model 객체 : 결과 값을 리턴 페이지에 전달 해준다.
	// session 객체 : 서버에 보관
	@PostMapping("/memberLogin.do")
	public String memberLogin(MemberVO vo, Model model, HttpSession session) {
		vo = memberDao.memberSelect(vo); // 아이디 패스워드로 보내서 결과를 vo객체에 받음
		if (vo != null) {
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("author", vo.getAuthor());
			model.addAttribute("message", "님 환영합니다.");
		} else {
			model.addAttribute("message", "아이디 또는 패스워드가 틀립니다.");
		}
		return "member/memberLoginResult";
	}
	
	@RequestMapping("/memberLogout.do")
	public String memberLogout(HttpSession session, Model model) {
		String name = (String) session.getAttribute("name"); // 세션에 보관된 이름 가져오기
		model.addAttribute("message", name + "님 정상적으로 로그아웃 되었습니다.");
		session.invalidate(); // sessiong 
		return "member/memberLoginResult";
	}
	
	@RequestMapping("/memberJoinForm.do")
	public String memberJoinForm() {
		return "member/memberJoinForm";
	}
	
	@PostMapping("/idCheck.do")
	@ResponseBody // 호출한 페이지로 값을 돌려주겠다.
	public String idCheck(@RequestParam("id") String id) {
		boolean b = memberDao.memberIdCheck(id);
		if (b) {
			return "0"; // 존재할 때
		} else {
			return "1"; // 존재하지 않을 때
		}
	}
	
	@PostMapping("/memberJoin.do")
	public String memberJoin(MemberVO vo, MultipartFile file, Model model) {
		String upload = servletContext.getRealPath("resources"); // resources 폴더를 찾는다.
		upload = upload + "/fileUpload/"; // 배포시 사용할 파일저장공간
		String sourceFileName = file.getOriginalFilename(); // 원본파일 명
		String uuid = UUID.randomUUID().toString(); // 서버저장 파일명 충돌방지를 위해 알리아스명을 사용
		String targetFileName = uuid + sourceFileName.substring(sourceFileName.lastIndexOf(".")); // 파일 확장자 구하기
		
		if (!sourceFileName.isEmpty()) { // 파일이 존재할 때만 연결해 준다.
			try {
				file.transferTo(new File(upload, targetFileName)); // (저장할 공간, 저장할 파일명)
				vo.setImgFile(sourceFileName);
				vo.setPimgFile(targetFileName);
				
				int result = memberDao.memberInsert(vo);
				if (result == 0) {
					model.addAttribute("message", "회원가입이 실패 했습니다. <br> 다시 가입 해주세요.");
				} else {
					model.addAttribute("message", "축하합니다! <br> 회원가입이 성공 했습니다. <br> 로그인 후 사용이 가능합니다.");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			int result = memberDao.memberInsert(vo);
			if (result == 0) {
				model.addAttribute("message", "회원가입이 실패 했습니다. <br> 다시 가입 해주세요.");
			} else {
				model.addAttribute("message", "축하합니다! <br> 회원가입이 성공 했습니다. <br> 로그인 후 사용이 가능합니다.");
			}
		}
		
		return "member/memberJoin";
	}
	
	@RequestMapping("/memberInfo.do")
	public String memberInfo(MemberVO vo, Model model, HttpSession session) {
		vo.setId((String) session.getAttribute("id"));
		model.addAttribute("member", memberDao.memberSelect(vo));
		return "member/memberInfo";
	}
}
