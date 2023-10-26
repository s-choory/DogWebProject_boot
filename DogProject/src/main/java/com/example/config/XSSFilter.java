package com.example.config;

import org.springframework.context.annotation.Configuration;

//lucy-xss-servlet-filter를 적용하면 편하게 xss를 방어할 수 있지만, 간단하게 직접 구현해봤다.
//만약 lucy필터를 사용한다면 JSON에 대해서는 따로 xss방어 처리를 해줘야 한다고 한다.
//JSON에 대한 XSS가 필요하다면 해당 XSSFilter.java 클래스처럼 Jackson의 CharacterEscapes를 상속하는 클래스 A를 직접 만들어서 처리해야할 특수문자를 지정하고 ObjectMapper에 A를 설정하고, ObjectMapper를 MessageConverter에 등록해서 Response가 클라이언트에 나가기 전에 XSS 방지 처리 해준다.
//issue는 값을 입력하지 않을 때, DB에 (null) 형태로 저장되어서 xssFilter()함수를 실행할 때 ')' 때문에 구문이 안닫히는 현상이 발생하여 에러가 뜬다.

@Configuration
public class XSSFilter {
	
	public String xssFilter(String str) {
		String result = "";
		
		result = str;
		result = result.replaceAll("&", "&amp;");
		result = result.replaceAll("<", "&lt;");
		result = result.replaceAll(">", "&gt;");
		result = result.replaceAll("\'", "&#x27;");
		result = result.replaceAll("\"", "&quot;");
//		result = result.replaceAll("(", "&#40;");
//		result = result.replaceAll(")", "&#41;");
		result = result.replaceAll("/", "&#x2F;");
		
		return result;
	}
	
	public String xssDecoding(String str) {
		String result = "";
		
		result = str;
		result = result.replaceAll("&amp;", "&");
		result = result.replaceAll("&lt;", "<");
		result = result.replaceAll("&gt;", ">");
		result = result.replaceAll("&#x27;", "\'");
		result = result.replaceAll("&quot;", "\"");
//		result = result.replaceAll("&#40;", "(");
//		result = result.replaceAll("&#41;", ")");
		result = result.replaceAll("&#x2F;", "/");
		
		return result;
	}
}
