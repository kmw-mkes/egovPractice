package egovframework.com.board.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("BoardDAO")
public class BoardDAO extends EgovAbstractMapper{
	
	public List<HashMap<String, Object>> selectBoardList(HashMap<String, Object> paramMap){
		return selectList("selectBoardList", paramMap);
	}
	
	public int selectBoardListCnt(HashMap<String, Object> paramMap) {
		return selectOne("selectBoardListCnt", paramMap);
	}
	
	public int insertBoard(HashMap<String, Object> paramMap) {
		return insert("insertBoard", paramMap);
	}
	
	public int updateBoard(HashMap<String, Object> paramMap) {
		return update("updateBoard", paramMap);
	}
	
	public HashMap<String, Object> selectBoardDetail(int boardIdx){
		return selectOne("selectBoardDetail", boardIdx);
	}
	
	public int deleteBoard(HashMap<String, Object> paramMap) {
		return update("deleteBoard", paramMap);
	}
	
	public int insertReply(HashMap<String, Object> paramMap) {
		return insert("insertReply", paramMap);
	}
	
	public List<HashMap<String, Object>> selectBoardReply(HashMap<String, Object> paramMap){
		return selectList("selectBoardReply", paramMap);
	}
	
	public int getFileGroupMaxIdx() {
		return selectOne("getFileGroupMaxIdx");
	}
	
	public int getFileGroupIdx(HashMap<String, Object> paramMap) {
		return selectOne("getFileGroupIdx", paramMap);
	}
	
	public int insertFileAttr(HashMap<String, Object> paramMap) {
		return insert("insertFileAttr", paramMap);
	}
	
	public List<HashMap<String, Object>> selectFileList(int fileGroupIdx){
		return selectList("selectFileList", fileGroupIdx);
	}
	
	
	public int deleteFileAttr(HashMap<String, Object> paramMap) {
		return update("deleteFileAttr", paramMap);
	}
}
