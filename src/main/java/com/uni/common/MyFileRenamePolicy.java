package com.uni.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		
		String originName = originFile.getName(); //원본 파일명
		// 수정명 : 파일업로드한시간(년월일시분초) + 10000~99999사이의 랜덤값 (5자리랜덤값) + 확장자

		// 원본명  	--> 수정명
		// aaa.jpg 	--> 2019120109065323456.jpg

		//파일 업로드 시간
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddmmss");
		String currentTime = sdf.format(new Date()); //util
		
		//5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		//확장자
		String ext = "";
		int dot = originName.lastIndexOf("."); // .위치부터 마지막까지
		ext = originName.substring(dot);
		
		//합치기
		String fileName = currentTime+ranNum+ext;
		
		File renameFile = new File(originFile.getParent(), fileName);
		
		//전달받은 파일을 변경된 파일명으로 파일객체를 생성해서 리턴
		return renameFile;
	}

}
