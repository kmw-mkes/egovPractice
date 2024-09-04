package egovframework.com.main.service;

import java.util.HashMap;
import java.util.List;

public interface MainService {

	public int selectIdChk(HashMap<String, Object> paramMap);
	
	public int insertMember(HashMap<String, Object> paramMap);
	
	public HashMap<String, Object> selectLoginInfo(HashMap<String, Object> paramMap);
	
	public int updateMember(HashMap<String, Object> paramMap);
	
	public HashMap<String, Object> selectMemberInfo(HashMap<String, Object> paramMap);
	
	public int deleteMemberInfo(int memberIdx);
	
	public List<String> selectFindId(HashMap<String, Object> paramMap);
	
	public int selectMemberCertification(HashMap<String, Object> paramMap);
	
	public int updatePwd(HashMap<String, Object> paramMap);
}
