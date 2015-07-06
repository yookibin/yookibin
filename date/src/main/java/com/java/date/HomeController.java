package com.java.date;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	/*
	 * SmartEditor RequestMapping
	 */
	
	@RequestMapping(value="/test")
	public String writeTest(){
		System.out.println("1");
		return "smarteditors/SmartEditor2_test";
	}
	
	@RequestMapping(value="/SmartEditor2Skin")
	public String SmartEditor2Skin(){
		System.out.println("2");
		return "smarteditors/SmartEditor2Skin";
	}
	
	@RequestMapping(value="/smartEditor2Inputarea")
	public String smartEditor2Inputarea(){
		System.out.println("3");
		return "smarteditors/smart_editor2_inputarea";
	}
	
	@RequestMapping(value="/smartEditor2InputareaIe8")
	public String smartEditor2InputareaIe8(){
		System.out.println("4");
		return "smarteditors/smart_editor2_inputarea_ie8";
	}
	
	/*이미지 업로더 매핑*/
	
	@RequestMapping(value="/photoUploader")
	public String photo_uploader(){
		System.out.println("5");
		return "smarteditors/photo_uploader/photo_uploader";
	}
	
	@RequestMapping(value="/callback")
	public String callback(){
		System.out.println("6");
		return "smarteditors/photo_uploader/callback";
	}
	
	/*파일처리*/
	
	public String fileHandler(HttpServletRequest request, @RequestParam("file") MultipartFile file){
		System.out.println("7");
		String fileName=file.getOriginalFilename();
		String fileExtension=fileName.substring(fileName.lastIndexOf(".")+1);
		fileExtension.toLowerCase(); // 확장자를 소문자로 변경
		
		String serverRoot=request.getSession().getServletContext().getRealPath("/");
		String saveRoot=serverRoot+"resources"+File.separator+"upload"+File.separator+"board"+File.separator;
		/* 폴더가 존재한다고 가정 */
		try{
			file.transferTo( new File(saveRoot+"image."+fileExtension)); // 서버에 "image" 라는 명으로 파일 저장(쓰기)
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping(value="/singleAjax", method=RequestMethod.POST)
	public String SingleAjax(HttpServletRequest request, @RequestParam("Filedata") MultipartFile file_data, @RequestParam("callback") String callback, @RequestParam("callback_func") String callback_func){
		System.out.println("8");
		String file_result ="";
		
		try{
			//파일이 존재하면
			if(file_data !=null && file_data.getOriginalFilename()!=null){
				
				String original_name=file_data.getOriginalFilename(); // 파일이름
				String filename_extension=original_name.substring(original_name.lastIndexOf(".")+1); // 파일 확장자
				filename_extension=filename_extension.toLowerCase(); //확장자를 소문자로 변경
				String defaultPath=request.getSession().getServletContext().getRealPath("/"); // 서버 기본경로(프로젝트폴더까지 :서버내의 해당경로에 저장되는 것임)
				String path= defaultPath+"resources"+File.separator+"upload"+File.separator+"board"+File.separator; // 파일 저장경로
				
				File file= new File(path);
				// 디렉토리 존재하지 않을 경우 디렉토리 생성
				
				if(!file.exists()) {
					file.mkdirs();
				}
				
				SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				
				// 서버에 업로드 할 파일명 변경(한글문제로 인해 원본파일은 올리지 않는 것이 좋음)
				String modify_name=today+"-"+UUID.randomUUID().toString().substring(20)+"."+filename_extension;
				
				// 서버에 이미지 저장(쓰기)
				file_data.transferTo(new File(path+modify_name));
				file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=/date/resources/upload/board/"+modify_name;
				
				System.out.println("upload 정보");
				System.out.println("defaultpath:"+defaultPath);
				System.out.println("path"+path);
				System.out.println("original_name:"+original_name);
				System.out.println("modify_Name:"+modify_name);
				System.out.println("redirect:"+callback+"?callback_func="+callback_func+file_result);
				
			}else{
				file_result += "&errstr=error";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:"+callback+"?callback_func="+callback_func+file_result;
	}
	
	// 익스플로러 버전이 높을때 다수 이미지 업로드
	@RequestMapping(value="/multipleAjax", method=RequestMethod.POST)
	public void multipleAjax(HttpServletRequest request, HttpServletResponse response){
		System.out.println("9");
		try{
			String sFileInfo=""; // 파일 정보
			String filename=request.getHeader("file-name"); // 파일명 -싱글파일업로드와 다르게 멀티파일업로드는 HEADER로 넘어옴
			String filename_extension=filename.substring(filename.lastIndexOf(".")+1); // 파일 확장자
			filename_extension=filename_extension.toLowerCase(); // 확장자를 소문자로 변경
			String defaultPath=request.getSession().getServletContext().getRealPath("/"); // 서버기본경로(프로젝트폴더까지: 서버내의 해당 경로에 저장되는 것임)
			String path = defaultPath+"resources"+File.separator+"upload"+File.separator+"board"+File.separator; //파일저장경로
			
			// 디렉토리 존재하지 않을경우 디렉토리 생성
			File file= new File(path);
			if(!file.exists()){
				file.mkdirs();
			}
			
			SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMddHHmmss");
			String today=formatter.format(new java.util.Date());
			
			// 서버에 업로드 할 파일명 변경(한글문제로 인해 원본파일은 올리지 않는 것이 좋음)
			String modify_name=today+"-"+UUID.randomUUID().toString().substring(20)+"."+filename_extension;
			
			//서버에 이미지저장(쓰기)
			InputStream is=request.getInputStream();
			OutputStream os=new FileOutputStream(path+modify_name);
			int numRead;
			byte b[]=new byte[Integer.parseInt(request.getHeader("file-size"))]; // 파일 쓰기
			while((numRead=is.read(b,0,b.length)) !=-1){
				os.write(b,0,numRead);
			}
			if(is!=null){
				is.close();
			}
			os.flush();
			os.close();
			
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			sFileInfo += "&sFileName="+filename; // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함.
			sFileInfo += "&sFileURL=" + "/date/resources/upload/board/" + modify_name;
			PrintWriter print=response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
			
			System.out.println("upload 정보");
			System.out.println("defaultpath:"+defaultPath);
			System.out.println("path:"+path);
			System.out.println("original_name:"+filename);
			System.out.println("modify_name"+modify_name);
			System.out.println("sFileInfo:"+sFileInfo);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
