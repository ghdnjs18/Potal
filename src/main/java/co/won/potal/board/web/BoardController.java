package co.won.potal.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.won.potal.board.service.BoardService;
import co.won.potal.board.service.BoardVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardDao;
	
	// 이하 Mapper 메소드를 만들어 준다.
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		model.addAttribute("boards", boardDao.boardSelectList());
		return "board/noticeList";
	}
	
	@PostMapping("/boardRead.do")
	public String boardRead(BoardVO vo, Model model) {
		vo = boardDao.boardSelect(vo);
		if (vo != null) {
			model.addAttribute("board", vo); // 글 담고
			boardDao.boardHit(vo.getHit()); // 조회수 증가
		} else {
			model.addAttribute("message", "게시글이 존재하지 않습니다.");
		}
		
		return "board/boardRead";
	}
}
