package egovframework.com.board.service;

import java.util.HashMap;
import java.util.List;

public interface BoardService {
	
	public List<HashMap<String, Object>> selectBoardList(HashMap<String, Object> paramMap);
	
	public int selectBoardListCnt(HashMap<String, Object> paramMap);
	
	public int saveBoard(HashMap<String, Object> paramMap);

}
