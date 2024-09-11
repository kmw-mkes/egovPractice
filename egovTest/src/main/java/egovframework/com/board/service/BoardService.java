package egovframework.com.board.service;

import java.util.HashMap;
import java.util.List;

public interface BoardService {
	
	public List<HashMap<String, Object>> selectBoardList(HashMap<String, Object> paramMap);
	
	public int selectBoardListCnt(HashMap<String, Object> paramMap);
	
	public int saveBoard(HashMap<String, Object> paramMap);
	
	public HashMap<String, Object> selectBoardDetail(int boardIdx);
	
	public int deleteBoard(HashMap<String, Object> paramMap);
	
	public int insertReply(HashMap<String, Object> paramMap);
	
	public List<HashMap<String, Object>> selectBoardReply(HashMap<String, Object> paramMap);

}
