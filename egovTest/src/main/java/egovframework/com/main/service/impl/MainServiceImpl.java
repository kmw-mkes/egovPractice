package egovframework.com.main.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.main.service.MainService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("MainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService{
	@Resource(name="MainDAO")
	private MainDAO mainDAO;

	@Override
	public int selectIdChk(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDAO.selectIdChk(paramMap);
	}

	@Override
	public int insertMember(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDAO.insertMember(paramMap);
	}

	@Override
	public HashMap<String, Object> selectLoginInfo(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDAO.selectLoginInfo(paramMap);
	}

	@Override
	public int updateMember(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDAO.updateMember(paramMap);
	}

	@Override
	public HashMap<String, Object> selectMemberInfo(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDAO.selectMemberInfo(paramMap);
	}

	@Override
	public int deleteMemberInfo(int memberIdx) {
		// TODO Auto-generated method stub
		return mainDAO.deleteMemberInfo(memberIdx);
	}

	@Override
	public List<String> selectFindId(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDAO.selectFindId(paramMap);
	}

	@Override
	public int selectMemberCertification(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		int chk = 0;
		int memberIdx = 0;
		chk = mainDAO.selectMemberCertificationChk(paramMap);
		if(chk > 0) {
			memberIdx = mainDAO.selectMemberCertification(paramMap);
		}
		return memberIdx;
	}

	@Override
	public int updatePwd(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mainDAO.updatePwd(paramMap);
	}
}
