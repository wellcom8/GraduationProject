package com.board.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.BoardService;
import com.common.common.CommandMap;

@Controller
public class BoardController {
	Logger logger = (Logger) LogManager.getLogger(this.getClass());
	
	@Resource(name="boardService")
	BoardService boardService;
	
	/**
	 * SummerNote에서 이미지 파일을 업로드하면 서버에 저장하고 URL을 가져와서 매핑된다.
	 * @author	김도영
	 * @param	multipartFile
	 * @return	파일 URL
	 * @throws	Exception
	 */
	@RequestMapping(value="/board/uploadImage.do", produces = "application/json")
	@ResponseBody
	public Map<String, Object> uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {
		return boardService.uploadSummernoteImageFile(multipartFile);
	}
	
	/**
	 * 
	 * @param	commandMap 제목, 작성자, 내용이 들어이는 map
	 * @return	글 작성 후 게시판으로 돌아간다.
	 * @throws	Exception
	 */
	@RequestMapping(value="/board/insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/AlbumBoard");
		boardService.insertBoard(commandMap.getMap());
		
		return mv;
	}
}