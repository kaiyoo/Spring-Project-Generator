package los.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import los.vo.BoardVO;
import los.vo.FileItemVO;
import los.vo.ReplyVO;

public interface IBoardService {
	// 게시글 목록 조회
	public List<BoardVO> getBoardList(Map<String, String> params) throws SQLException;
	// 게시글 수 조회
	public int getTotalBoardCount(Map<String, String> params) throws SQLException;
	// 게시글 상세 조회
	public BoardVO getBoardInfo(Map<String, String> params) throws SQLException;
	// 게시글 등록
	public void insertBoardInfo(BoardVO boardInfo) throws SQLException;
	// 게시글 수정
	public void updateBoardInfo(BoardVO boardInfo) throws SQLException;
	// 게시글 삭제(상태변경)
	public void deleteBoardInfo(Map<String, String> params) throws SQLException;
	// 게시글 완전 삭제(데이터 및 파일 삭제)
	public void deleteAllBoardInfo(Map<String, String> params) throws SQLException;

	//리플라이
	public List<ReplyVO> getReplyList(Map<String, String> params) throws SQLException;	
	public void insertCommentInfo(ReplyVO commentInfo) throws SQLException;	
	public String insertReplyInfo(ReplyVO replyInfo) throws SQLException;
	public void deleteReplyInfo(Map<String, String> params) throws SQLException;

	//파일 삭제
	public void deleteFileInfo(Map<String, String> params) throws SQLException;
	//파일 상세 조회
	public FileItemVO getFileInfo(Map<String, String> params)throws SQLException;
	//파일 다운로드
	public void updateFileDownHit(String file_no) throws SQLException;
}
