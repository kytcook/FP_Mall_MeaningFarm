package com.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.vo.NoticeVO;


@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:\\mp\\file\\"; // 파일이 저장될 위치
	
	public List<Map<String, Object>> parseInsertFileInfo(NoticeVO noticeVO, 
			MultipartHttpServletRequest mpRequest) throws Exception{
		
		/*
			Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다.
			List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다.
			Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
		*/
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String noticefile_name = null;
		String noticefileExtension = null;
		String noticefile_rename = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int notice_no = noticeVO.getNotice_no();
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				noticefile_name = multipartFile.getOriginalFilename();
				noticefileExtension = noticefile_name.substring(noticefile_name.lastIndexOf("."));
				noticefile_rename = getRandomString() + noticefileExtension; //저장되고 난 후 이름
				
				file = new File(filePath + noticefile_rename);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("notice_no", notice_no);
				listMap.put("noticefile_name", noticefile_name);
				listMap.put("noticefile_rename", noticefile_rename);
				listMap.put("noticefile_size", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	
	public List<Map<String, Object>> parseUpdateFileInfo(NoticeVO noticeVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception{ 
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null; 
		String noticefile_name = null; 
		String noticefileExtension = null; 
		String noticefile_rename = null; 
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null; 
		int notice_no = noticeVO.getNotice_no();
		
		while(iterator.hasNext()){ 
			multipartFile = mpRequest.getFile(iterator.next()); 
			if(multipartFile.isEmpty() == false){ 
				noticefile_name = multipartFile.getOriginalFilename(); 
				noticefileExtension = noticefile_name.substring(noticefile_name.lastIndexOf(".")); 
				noticefile_rename = getRandomString() + noticefileExtension; 
				multipartFile.transferTo(new File(filePath + noticefile_rename)); 
			//리스트맵에 업데이트 정보담아두기
				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("notice_no", notice_no); 
				listMap.put("noticefile_name", noticefile_name);
				listMap.put("noticefile_rename", noticefile_rename); 
				listMap.put("noticefile_size", multipartFile.getSize()); 
				list.add(listMap); 
			} 
		}
		if(files != null && fileNames != null){ 
			for(int i = 0; i<fileNames.length; i++) {
					listMap = new HashMap<String,Object>();
                    listMap.put("IS_NEW", "N");
					listMap.put("noticefile_no", files[i]); 
					list.add(listMap); 
			}
		}
		return list; 
	}

	
	
	
	
}
 
