package los.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import los.vo.BoardVO;
import los.vo.FileItemVO;
import los.vo.ReplyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IBoardDaoImpl implements IBoardDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<BoardVO> getBoardList(Map<String, String> params)	throws SQLException {
		return this.client.queryForList("board.boardList", params);
	}

	@Override
	public int getTotalBoardCount(Map<String, String> params)	throws SQLException {
		return (int) client.queryForObject("board.totalBoardCount", params);
	}

	@Override
	public BoardVO getBoardInfo(Map<String, String> params) throws SQLException {
		BoardVO boardInfo = null;
		try {
			
			client.startTransaction();
			
			if(params.get("gubun").equals("select")){
				client.update("board.updateBoardHit", params);
			}
			
			boardInfo = (BoardVO) client.queryForObject("board.boardInfo", params);
			
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		
		return boardInfo;
	}

	@Override
	public void insertBoardInfo(BoardVO boardInfo) throws SQLException {
		List<FileItemVO> filesInfo = boardInfo.getFileList();
		if(filesInfo == null ){
			this.client.insert("board.insertBoardInfo", boardInfo);
		}else{
			for(FileItemVO fileInfo : filesInfo){
				fileInfo.setFile_board_no((String)client.insert("board.insertBoardInfo", boardInfo));
				if(fileInfo.getFile_name() != ""){
					this.client.insert("board.insertFileInfo", fileInfo);
				}
			}
		}
	}

	@Override
	public void updateBoardInfo(BoardVO boardInfo) throws SQLException {
		List<FileItemVO> filesInfo = boardInfo.getFileList();
			if(filesInfo != null) {
				for(FileItemVO fileInfo : filesInfo) {
					fileInfo.setFile_board_no(boardInfo.getBoard_no());
					if(fileInfo.getFile_name() != "") {
						this.client.insert("board.insertFileInfo", fileInfo);
					}
				}
			}
			this.client.update("board.updateBoardInfo", boardInfo);
 		}
	

	
	@Override
	public void deleteBoardInfo(Map<String, String> params) throws SQLException {
		client.update("board.updateBoardStatusDel", params);		
	}

	@Override
	public void updateFileDownHit(String file_no) throws SQLException {
		this.client.update("board.updateFileDownHit", file_no);
	}

	@Override
	public void deleteAllBoardInfo(Map<String, String> params)
			throws SQLException {
		try {
			client.startTransaction();
			client.delete("board.deleteFileInfo", params);
			client.delete("board.deleteReplyInfo", params);
			client.delete("board.deleteBoardInfo", params);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
	}
	
	//리플라이
	@Override
	public List<ReplyVO> getReplyList(Map<String, String> params) throws SQLException {
		return this.client.queryForList("board.replyList", params);
	}
	
	@Override
	public void insertCommentInfo(ReplyVO commentInfo) throws SQLException {
		this.client.insert("board.insertCommentInfo", commentInfo);
	}

	@Override
	public String insertReplyInfo(ReplyVO replyInfo) throws SQLException {
		String reply_group = null;		
		String reply_seq = null;
		
		if("0".intern() == replyInfo.getReply_seq().intern()){
			reply_seq = (String) client.queryForObject("board.incrementReplySeq", replyInfo);
			replyInfo.setReply_seq(reply_seq);
		}else{
			this.client.update("board.updateReplySeq", replyInfo);
			reply_seq = String.valueOf(Integer.parseInt(replyInfo.getReply_seq()) + 1);
			replyInfo.setReply_seq(reply_seq);
		}
		
		String reply_depth = String.valueOf(Integer.parseInt(replyInfo.getReply_depth()) + 1);
		replyInfo.setReply_depth(reply_depth);
		reply_group = (String) client.insert("board.insertReplyInfo", replyInfo);	
		
		return reply_group;
	}

	@Override
	public void deleteReplyInfo(Map<String, String> params)throws SQLException {
		this.client.delete("board.deleteReplyInfo", params);		
	}

	@Override
	public void deleteFileInfo(Map<String, String> params) throws SQLException {
		this.client.delete("board.deleteFileInfo",params);
	}
	@Override
	public FileItemVO getFileInfo(Map<String, String> params)throws SQLException{
		return (FileItemVO)this.client.queryForObject("board.fileInfo",params);
	}

}
