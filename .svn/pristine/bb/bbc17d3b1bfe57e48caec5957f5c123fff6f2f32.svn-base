package los.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import los.board.dao.IBoardDao;
import los.vo.BoardVO;
import los.vo.FileItemVO;
import los.vo.ReplyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IBoardServiceImpl implements IBoardService {
	@Autowired
	private IBoardDao dao;
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public List<BoardVO> getBoardList(Map<String, String> params) throws SQLException {
		return this.dao.getBoardList(params);
	}
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public int getTotalBoardCount(Map<String, String> params) throws SQLException {
		return this.dao.getTotalBoardCount(params);
	}
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public BoardVO getBoardInfo(Map<String, String> params) throws SQLException {
		return this.dao.getBoardInfo(params);
	}
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void insertBoardInfo(BoardVO boardInfo) throws SQLException {
		this.dao.insertBoardInfo(boardInfo);
	}
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void updateBoardInfo(BoardVO boardInfo) throws SQLException {
		this.dao.updateBoardInfo(boardInfo);
	}
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void deleteBoardInfo(Map<String, String> params) throws SQLException {
		this.dao.deleteBoardInfo(params);
	}
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void deleteAllBoardInfo(Map<String, String> params) throws SQLException {
		this.dao.deleteAllBoardInfo(params);
	}
	
	
	
	//리플라이
	@Transactional(readOnly=true)
	@Override
	public List<ReplyVO> getReplyList(Map<String, String> params) throws SQLException {
		return this.dao.getReplyList(params);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void insertCommentInfo(ReplyVO commentInfo) throws SQLException {
		this.dao.insertCommentInfo(commentInfo);
	}

	@Transactional(rollbackFor={SQLException.class})
	@Override
	public String insertReplyInfo(ReplyVO replyInfo) throws SQLException {
		return this.dao.insertReplyInfo(replyInfo);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void deleteReplyInfo(Map<String, String> params) throws SQLException {
		this.dao.deleteReplyInfo(params);;		
	}
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void deleteFileInfo(Map<String, String> params) throws SQLException {
		this.dao.deleteFileInfo(params);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public FileItemVO getFileInfo(Map<String, String> params)throws SQLException{
		return this.dao.getFileInfo(params);
	}
	
	@Transactional(rollbackFor={SQLException.class})
	@Override
	public void updateFileDownHit(String file_no) throws SQLException {
		this.dao.updateFileDownHit(file_no);
	}
	
}
