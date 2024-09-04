package egovframework.com.main.service.impl;

import java.util.HashMap;
import java.util.List;

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
	
	public HashMap<String, Object> selectMemberInfo(HashMap<String, Object> paramMap){
		return selectOne("selectMemberInfo", paramMap);
	}
	
	public int deleteMemberInfo(int memberIdx) {
		return update("deleteMemberInfo", memberIdx);
	}
	
	public List<String> selectFindId(HashMap<String, Object> paramMap){
		return selectList("selectFindId", paramMap);
	}
	
	public int selectMemberCertification(HashMap<String, Object> paramMap) {
		return selectOne("selectMemberCertification", paramMap);
	}
	
	public int selectMemberCertificationChk(HashMap<String, Object> paramMap) {
		return selectOne("selectMemberCertificationChk", paramMap);
	}
	
	public int updatePwd(HashMap<String, Object> paramMap) {
		return update("updatePwd", paramMap);
	}
	
}
