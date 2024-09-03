package egovframework.com.main.service.impl;

import java.util.HashMap;

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
}
