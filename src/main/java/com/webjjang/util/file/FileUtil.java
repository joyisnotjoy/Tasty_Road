package com.webjjang.util.file;

import java.io.File;

public class FileUtil {

	// 파일이 존재하는지 확인하는 메서드
	public static boolean exist(File file) throws Exception{
		return file.exists();
	}
	
	// 파일이 존재하는지 확인하는 메서드
	public static boolean exist(String fileName) throws Exception{
		return toFile(fileName).exists();
	}
	
	// 문자열을 파일 객체로 만들어 주는 메서드
	public static File toFile(String fileName) throws Exception{
		return new File(fileName);
	}
	
	// 파일 지우기
	public static boolean delete(File file) throws Exception {
		return file.delete();
	}
	// 파일 지우기
	public static boolean delete(String fileName) throws Exception {
		return delete(toFile(fileName));
	}
	
	// 파일의 정보를 문자열로 넣어주면 지워주는 메서드
	// 파일은 realPath 정보의 파일명을 넘겨야 한다.
	public static boolean remove(String fileName) throws Exception {
		// 1. 문자열을 파일 객체로 만든다. 2. 있는지 확인한다. 3. 삭제한다. 4. 결과 리턴
		File file = toFile(fileName);
		// 파일이 존재하지 않는 경우 예외 발생
		if(!exist(file)) throw new Exception("삭제하려는 파일이 존재하지 않습니다.");
		// 파일이 존재하는 경우 처리
		if(!delete(file)) throw new Exception("삭제하려는 파일이 삭제되지 않았습니다.");
		System.out.println("FileUtil.remove() - 파일이 삭제 되었습니다.");
		return true;
	}
	
	// 중복된 파일에 대한 처리 - 중복이 되지 않는 파일 객체를 리턴해 준다.
	public static File noDuplicate(String fileFullName) throws Exception {
		System.out.println("FileUtil.noDuplicate().fileFullName"+fileFullName);
		
		File file = null;
		int dotPos = fileFullName.lastIndexOf(".");
		// image.jpg - fileName : image, ext : .jpg
		String fileName = fileFullName.substring(0, dotPos); // image
		String ext = fileFullName.substring(dotPos); // .jpg
		int cnt = 0; // 중복이 됐을 때 카운트를 중간에 넣는다. fileName + cnt + ext. 중복이 되면 cnt++ 한다.

		// 파일 정보확인
		System.out.println("FileUtil.noDuplicate().fileName = " + fileName + ", ext = " + ext);
		
		while(true) {
			if(cnt == 0)
				file = toFile(fileFullName);
			else file = toFile(fileName + cnt + ext);
			// 중복되면 계속 반복처리한다. 중복이 되지 않으면 빠져 나간다.
			if(!exist(file)) break;
			// 중복이 된다.
			cnt++;
		}
		
		return file;
	}
	
	
}
