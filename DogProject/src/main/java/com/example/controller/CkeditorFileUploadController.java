package com.example.controller;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
	
@Controller
@RequestMapping("/adm/")
public class CkeditorFileUploadController {
	@PostMapping("/fileupload.do")
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws IOException {
		
		JsonObject json = new JsonObject();
		// Json 객체를 출력하기 위해 PrintWriter 생성
		PrintWriter printWriter = null;
		OutputStream out = null;
		//파일을 가져오기 위해 MultipartHttpServletRequest 의 getFile 메서드 사용
		MultipartFile file = multiFile.getFile("upload");
	
		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {

					try {
						String fileName = file.getOriginalFilename();
			            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
			            String fileId = UUID.randomUUID().toString() + fileExtension;
						byte[] bytes;
						bytes = file.getBytes();
						String uploadPath = "C:/temp";
						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
		
						
						//업로드 경로 + 파일이름을 줘서  데이터를 서버에 전송
						uploadPath = uploadPath + "/" + fileId;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);
						
						//클라이언트에 이벤트 추가
						printWriter = response.getWriter();
						response.setContentType("text/html");
						
						String ckfileUrl = "/app/temp/" + fileId;
						
						//생성된 json 객체를 이용해 파일 업로드 + 이름 + 주소를 CkEditor에 전송
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileId);
						json.addProperty("url", ckfileUrl);
						printWriter.println(json);
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if(out !=null) {
							out.close();
						}
						if(printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
			return null;
	}

}