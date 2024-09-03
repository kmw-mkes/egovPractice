package egovframework.com.main.service.impl;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("MainDAO")
public class MainDAO extends EgovAbstractMapper{

	public int selectIdChk(HashMap<String, Object> paramMap) {
		return selectOne("selectIdChk", paramMap);
	}
	
	public int insertMember(HashMap<String, Object> paramMap) {
		return insert("insertMember", paramMap);
	}
	
	public HashMap<String, Object> selectLoginInfo(HashMap<String, Object> paramMap){
		return selectOne("selectLoginInfo", paramMap);
	}
	
	public int updateMember(HashMap<String, Object> paramMap) {
		return update("updateMember", paramMap);
	}
	
	
	
}
