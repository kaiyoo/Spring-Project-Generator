package los.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import los.board.service.IBoardService;
import los.utils.PagingUtil;
import los.vo.BoardVO;
import los.vo.FileItemVO;
import los.vo.ReplyVO;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	private IBoardService service;
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	
	
	@Autowired
	private ServletContext application;
	
	
	@RequestMapping("{board_gubun}/boardList")
	private ModelAndView getBoardList(ModelAndView view, 
			@PathVariable(value="board_gubun") String board_gubun) throws SQLException {
		
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_gubun", board_gubun);
		params.put("board_status", "Y");
		params.put("search_keycode", request.getParameter("search_keycode"));
		params.put("search_keyword", request.getParameter("search_keyword"));
		
		int totalCount = this.service.getTotalBoardCount(params);
		
		int currentPage;
		if(request.getParameter("currentPage") == null){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한페이지 당 게시물의 수
		int blockCount = 10;
		//표시할 페이지
		int blockPage = 5;
		String pagingHtml;
		
		PagingUtil pageUtil = new PagingUtil(currentPage, totalCount, blockCount, blockPage, request);
		params.put("start_count", String.valueOf(pageUtil.getStartCount()));
		params.put("end_count", String.valueOf(pageUtil.getEndCount()));
		
		List<BoardVO> boardList = this.service.getBoardList(params);
		pagingHtml = pageUtil.getPageHtml().toString();
		
		view.addObject("boardList", boardList);
		view.addObject("board_gubun", board_gubun);
		view.addObject("pagingHtml", pagingHtml);
		view.setViewName("board/boardList");
		
		return view;
	}
	
	@RequestMapping("boardView")
	private ModelAndView boardView(ModelAndView view,
			@RequestParam("board_no") String board_no) throws SQLException{
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_no", board_no);
		params.put("gubun", "select");
		BoardVO boardInfo = this.service.getBoardInfo(params);
		
		view.addObject("boardInfo",boardInfo);
		view.setViewName("board/boardView");
		return view;
	}
	
	@RequestMapping("{board_gubun}/insertBoardForm")
	private ModelAndView insertBoardForm(ModelAndView view,
			@PathVariable(value="board_gubun")String board_gubun){
		view.addObject("board_gubun",board_gubun);
		view.addObject("gubun", "insert");
		view.setViewName("board/boardForm");
		return view;
	}
	
	
	
	@RequestMapping("{board_gubun}/updateBoardForm")
	private ModelAndView updateBoardForm(ModelAndView view,
			@RequestParam("board_no") String board_no,
			@PathVariable(value="board_gubun")String board_gubun) throws SQLException{
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_no", board_no);
		params.put("board_gubun", board_gubun);
		params.put("gubun", "update");
		
		BoardVO boardInfo = this.service.getBoardInfo(params);
		
		view.addObject("board_gubun",board_gubun);		
		view.addObject("gubun", "update");		
		view.addObject("boardInfo",boardInfo);		
		view.setViewName("board/boardForm");
		
		return view;
	}
	
	/**
	 * 1. 메소드명 : updateBoardInfo
	 * 2. 작성일 : 2015. 11. 30. 오후 8:14:06
	 * 3. 작성자 : "Jeong seokjune"
	 * 4. 설명 :   게시판 글 수정 및 파일 유무에 따른 파일 수정
	 * @param request
	 * @param boardInfo
	 * @return
	 * @throws SQLException
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("updateBoardInfo")
	private String updateBoardInfo( MultipartHttpServletRequest request,
			BoardVO boardInfo) throws SQLException, IllegalStateException, IOException{
		
		String savePath = this.application.getRealPath("upload");
		
		List<MultipartFile> files = request.getFiles("files");
		String fileName = files.get(0).getOriginalFilename();//파일 수정 첨부 파일
		String orgFileDelYn = boardInfo.getOrgFileDelYn();
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_no",boardInfo.getBoard_no());
		if(!fileName.isEmpty()) {
			FileItemVO fileInfo = this.service.getFileInfo(params);
			if(fileInfo != null) {
				
				File delFile = new File(savePath,fileInfo.getFile_name());
				if(delFile.exists()) {
					delFile.delete();
				}
				this.service.deleteFileInfo(params);
			}
			boardInfo.setFileList(setFileInfo(files, savePath));
			
		} else {
			if(orgFileDelYn.equals("Y")) {
				FileItemVO fileInfo = this.service.getFileInfo(params);
				File delFile = new File(savePath,fileInfo.getFile_name());
				if(delFile.exists()){
					delFile.delete();
				}
				this.service.deleteFileInfo(params);
			}
		}
		
		this.service.updateBoardInfo(boardInfo);
		
		return "redirect:/board/"+boardInfo.getBoard_gubun()+"/boardList.do";
	}
	
	@RequestMapping("{board_gubun}/deleteBoardInfo")
	private String deleteBoardInfo(@RequestParam("board_no") String board_no,
			@PathVariable(value="board_gubun") String board_gubun,
			BoardVO boardInfo) throws SQLException{
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_no", board_no);
		params.put("board_gubun", board_gubun);
		
		this.service.deleteBoardInfo(params);
		
		return "redirect:/board/"+board_gubun+"/boardList.do";
	}
	
	
	@RequestMapping("{board_gubun}/deleteAllBoardInfo")
	private String deleteAllBoardInfo(@RequestParam("board_no") String board_no,
			@PathVariable(value="board_gubun") String board_gubun,
			BoardVO boardInfo) throws SQLException{
		
		Map<String, String> params = new HashMap<String, String>();
		
		String[] deleteBoardInfo = board_no.split(",");
		
		for(String delete_board_no : deleteBoardInfo) {
			params.put("board_no", delete_board_no);
			service.deleteAllBoardInfo(params);
		}
		
		return "redirect:/board/"+board_gubun+"/boardList.do";
	}
	
	/**
	 * 1. 메소드명 : insertBoardInfo
	 * 2. 작성일 : 2015. 11. 30. 오후 8:13:06
	 * 3. 작성자 : "Jeong seokjune"
	 * 4. 설명 :	게시판 글 등록  (파일 등록가능ㄴ)
	 * @param view
	 * @param request
	 * @param boardInfo
	 * @return
	 * @throws SQLException
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("insertBoardInfo")
	private ModelAndView insertBoardInfo( ModelAndView view , 
			MultipartHttpServletRequest request , BoardVO boardInfo) throws SQLException, IllegalStateException, IOException{
		String savePath = this.application.getRealPath("upload");
		List<MultipartFile> files = request.getFiles("files");
		String fileName = files.get(0).getOriginalFilename();//파일 수정 첨부 파일
		
		if(fileName!=""){
			boardInfo.setFileList(setFileInfo(files, savePath));
		}
		this.service.insertBoardInfo(boardInfo);
		
		view.setViewName("redirect:"+boardInfo.getBoard_gubun()+"/boardList.do");
		return view;
	}
	
	
	/**
	 * 1. 메소드명 : downloadFile
	 * 2. 작성일 : 2015. 11. 30. 오후 8:12:23
	 * 3. 작성자 : "Jeong seokjune"
	 * 4. 설명 :   파일 다운로드 시 downloadView로 연결한다. 
	 * @param mav
	 * @param fileName
	 * @param fileSeq
	 * @return
	 * @throws SQLException 
	 * @throws IOException 
	 */
	@RequestMapping("fileDownload")
	private ModelAndView fileDownload( ModelAndView view,
							HttpServletResponse response,
							@RequestParam("file_name") String file_name,
							@RequestParam("file_no") String file_no) throws SQLException, IOException {
		String downloadPath = this.application.getRealPath("upload");
		File downloadFile = new File(downloadPath, file_name);
		
		if(!downloadFile.exists()){
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out =response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("    alert('해당 경로에 파일이 존재하지 않습니다.');");
			out.println("    history.back();");
			out.println("</script>");
			
			return null;
		}else{
			this.service.updateFileDownHit(request.getParameter("file_no"));
			view.addObject("file_no",file_no);
			view.addObject("downloadFile", downloadFile);		
			view.setViewName("downloadView");
			return view;
		}
	}	
	
	
	//리플라이
	/**
	 * 1. 메소드명 : showReplyList
	 * 2. 작성일 : 2015. 11. 30. 오전 10:29:46
	 * 3. 작성자 : 유홍상
	 * 4. 설명 : 답글 목록을 ajax로 가져온다
	 */
	@RequestMapping("showReplyList")
	@ResponseBody
	private String replyList(ModelAndView mav, @RequestParam("board_no") String board_no
			) throws SQLException, JsonGenerationException, JsonMappingException, IOException{
		Map<String, String> params = new HashMap<String, String>();
		params.put("board_no", board_no);
		List<ReplyVO> replyList = this.service.getReplyList(params);		
		mav.addObject("replyList", replyList);
		//mav.addObject("gubun",gubun);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(replyList);
		
		return jsonData;
	}	
	
	
	/**
	 * 1. 메소드명 : insertCommentInfo
	 * 2. 작성일 : 2015. 11. 30. 오전 10:29:46
	 * 3. 작성자 : 유홍상
	 * 4. 설명 : 해당 게시글(boardView)에 대한 댓글을 등록한다.
	 */
	@RequestMapping(value="insertCommentInfo")
	@ResponseBody		
	private String insertCommentInfo(ReplyVO commentInfo) 
			throws SQLException, JsonGenerationException, JsonMappingException, IOException{		
		this.service.insertCommentInfo(commentInfo);
		Map<String, String> target = new HashMap<String, String>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(target);
		
		return jsonData;
	}
	
	
	/**
	 * 1. 메소드명 : insertReplyInfo
	 * 2. 작성일 : 2015. 11. 30. 오전 10:30:46
	 * 3. 작성자 : 유홍상
	 * 4. 설명 : 댓글에 대한 댓글을 등록한다.
	 */
	@RequestMapping(value="insertReplyInfo")
	@ResponseBody		
	private String insertReplyInfo(ReplyVO replyInfo) 
			throws SQLException, JsonGenerationException, JsonMappingException, IOException{		
		this.service.insertReplyInfo(replyInfo);
		Map<String, String> target = new HashMap<String, String>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(target);
		
		return jsonData;
	}

	
	/**
	 * 1. 메소드명 : deleteReplyInfo
	 * 2. 작성일 : 2015. 11. 30. 오전 10:32:46
	 * 3. 작성자 : 유홍상
	 * 4. 설명 : 댓글을 삭제한다.
	 */
	@RequestMapping("deleteReplyInfo")
	@ResponseBody
	private String deleteReplyInfo(String gubun,
			@RequestParam(required=false) String reply_group, 
			@RequestParam(required=false) String reply_no) 			
			throws SQLException, JsonGenerationException, JsonMappingException, IOException{
		Map<String, String> params = new HashMap<String, String>();
		if(gubun.equals("reply_no")){
			params.put("reply_no", reply_no);
		}
		if(gubun.equals("reply_group")){
			params.put("reply_group", reply_group);
		}			
		
		this.service.deleteReplyInfo(params);
		Map<String, String> target = new HashMap<String, String>();
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(target);
		
		return jsonData;
	}
	
	/**
	 * 1. 메소드명 : setFileInfo
	 * 2. 작성일 : 2015. 11. 30. 오후 8:11:38
	 * 3. 작성자 : "Jeong seokjune"
	 * 4. 설명 :     파일 정보를 받아와 저장한다.
	 * @param files
	 * @param savePath
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	private List<FileItemVO> setFileInfo(List<MultipartFile> files,String savePath) throws IllegalStateException, IOException{
		List<FileItemVO> fileList = new ArrayList<FileItemVO>();
		FileItemVO fileItem = new FileItemVO();
		for(MultipartFile file :files){
			if(file.getSize()>0){
				String file_save_name = file.getOriginalFilename().split("\\.")[0] + "_" + System.currentTimeMillis() + "." + file.getOriginalFilename().split("\\.")[1];
				fileItem.setFile_name(file.getOriginalFilename());
				fileItem.setFile_save_name(file_save_name);
				fileItem.setFile_content_type(file.getContentType());
				fileItem.setFile_size(String.valueOf(file.getSize()));
				File saveFile = new File(savePath,file_save_name);
				file.transferTo(saveFile);
			}
		}
		fileList.add(fileItem);
		
		return fileList;
	}

}
