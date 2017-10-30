package los.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import los.vo.BoardVO;
import los.vo.FileItemVO;
import los.vo.ReplyVO;

public interface IBoardDao {
	public List<BoardVO> getBoardList(Map<String, String> params) throws SQLException;
	public int getTotalBoardCount(Map<String, String> params) throws SQLException;
	public BoardVO getBoardInfo(Map<String, String> params) throws SQLException;
	public void insertBoardInfo(BoardVO boardInfo) throws SQLException;
	public void updateBoardInfo(BoardVO boardInfo) throws SQLException;
	public void deleteBoardInfo(Map<String, String> params) throws SQLException;
	public void deleteAllBoardInfo(Map<String, String> params) throws SQLException;

	
	//리플라이
	public List<ReplyVO> getReplyList(Map<String, String> params) throws SQLException;
	public void insertCommentInfo(ReplyVO commentInfo) throws SQLException;
	public String insertReplyInfo(ReplyVO replyInfo) throws SQLException;
	public void deleteReplyInfo(Map<String, String> params) throws SQLException;

	//파일
	public void deleteFileInfo(Map<String, String> params) throws SQLException;
	public FileItemVO getFileInfo(Map<String, String> params)throws SQLException;
	public void updateFileDownHit(String file_no) throws SQLException;
	
}
