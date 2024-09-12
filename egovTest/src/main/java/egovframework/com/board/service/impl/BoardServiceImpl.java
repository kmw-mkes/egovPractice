package egovframework.com.board.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.board.service.BoardService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("BoardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService{

	@Resource(name="BoardDAO")
	private BoardDAO boardDAO;

	@Override
	public List<HashMap<String, Object>> selectBoardList(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList(paramMap);
	}

	@Override
	public int selectBoardListCnt(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardListCnt(paramMap);
	}

	@Override
	public int saveBoard(HashMap<String, Object> paramMap, List<MultipartFile> multipartFile) {
		// TODO Auto-generated method stub
		System.out.println(1);
		int resultChk = 0;
		
		String flag = paramMap.get("statusFlag").toString();
		int fileGroupIdx = 0;
		if("I".equals(flag)) {
			resultChk = boardDAO.insertBoard(paramMap);
			fileGroupIdx = boardDAO.getFileGroupMaxIdx();
		}else if("U".equals(flag)) {
			resultChk = boardDAO.updateBoard(paramMap);
			fileGroupIdx = boardDAO.getFileGroupIdx(paramMap);
		}
	
		String filePath = "/ictsaeil/egovTest";
		int index = 0;
		if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
			for(MultipartFile file : multipartFile) {
				SimpleDateFormat date = new SimpleDateFormat("yyyyMMddHms");
				Calendar cal = Calendar.getInstance();
				String today = date.format(cal.getTime());
				
				try {
					File fileFolder = new File(filePath);
					if(!fileFolder.exists()) {
						if(fileFolder.mkdirs()) {
							System.out.println("[file.mkdirs] : Success");
						}
					}
					String fileExt = FilenameUtils.getExtension(file.getOriginalFilename());
					File saveFile = new File(filePath, "file_"+today+"_"+index+"."+fileExt);
					file.transferTo(saveFile);
					HashMap<String, Object> uploadFile = new HashMap<String, Object>();
					uploadFile.put("fileGroupIdx", fileGroupIdx);
					uploadFile.put("originalFileName", file.getOriginalFilename());
					uploadFile.put("saveFileName", "file_"+today+"_"+index+"."+fileExt);
					uploadFile.put("saveFilePath", filePath);
					uploadFile.put("fileSize", file.getSize());
					uploadFile.put("fileExt", fileExt);
					uploadFile.put("memberId", paramMap.get("memberId").toString());
					resultChk = boardDAO.insertFileAttr(uploadFile);
					index++;
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return resultChk;
	}

	@Override
	public HashMap<String, Object> selectBoardDetail(int boardIdx) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardDetail(boardIdx);
	}

	@Override
	public int deleteBoard(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.deleteBoard(paramMap);
	}

	@Override
	public int insertReply(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.insertReply(paramMap);
	}

	@Override
	public List<HashMap<String, Object>> selectBoardReply(HashMap<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardReply(paramMap);
	}
	
}
