<%@page import="java.util.List"%>
<%@page import="com.example.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
	/* 페이징 for문  */
    PageDTO pdto = (PageDTO)request.getAttribute("pDTO");
    int curPage = pdto.getCurPage();
    int perPage = pdto.getPerPage();
    int totalCount = pdto.getTotalCount();
    int totalNum = totalCount/perPage;
    if(totalCount%perPage!=0) totalNum++;
	String search=(String)request.getAttribute("search");
	String order= (String)request.getAttribute("order");
	
	/* if(search==null){search="";} */
	/* if(order==null){order="";} */
	
	
	int perBlock = pdto.getPerBlock();
	
 // 현재 화면에 보여질 페이지번호들의 시작페이지번호, 마지막페이지번호 구하기
    // 현재 페이지번호의 블럭번호 구하기
    int curBlock = ( int )Math.ceil( ( double )curPage / perBlock );
    // 시작페이지번호 구하기
    int startPage = ( curBlock - 1 ) * perBlock + 1;
    // 마지막페이지번호 구하기
    int endPage = startPage + perBlock - 1;
    if ( endPage > totalNum ) endPage = totalNum;
 // 페이지번호 출력 시작
	if(totalCount != 0){
    // 1. 첫 페이지로 바로 이동
    if ( curPage == 1 )
        out.print( "<div class='pageon'>처음</div>" );
    else
        out.print( "<a href='?curPage=1&search=" + search + "&order="+ order +"'>처음</a>" );
    out.print( "&nbsp;" );
    // 2. 이전 페이지 블럭으로 이동 &lt = 부등호 <
/*     if ( startPage == 1 )
        out.print( "<div class='pageon'>&lt;&lt;</div>" );
    else
        out.print( "<a  href='?curPage=" + ( startPage - 1 )+ "&search=" + search + "&order="+ order +"'>&lt;&lt;</a>" );
    out.print( "&nbsp;" ); */
    // 3. 이전 페이지로 이동
    if ( curPage == 1 )
        out.print( "<div class='pageon'>&lt;</div>" );
    else
        out.print( "<a href='?curPage=" + ( curPage - 1 ) + "&search=" + search+ "&order="+ order +"'>&lt;</a>" );
    out.print( "&nbsp;" );
    // 4. 페이지번호들
    for ( int i = startPage; i < endPage; i++  ) { // 마지막페이지번호는 표시 안 하고, for 루프 밑에서 표시( 공백 표시 때문에... )
        if ( curPage == i )
            out.print( "<div class='pageon'>"+ i+"</div>" );
        else
        out.print( "<a href='?curPage=" + i  + "&search=" + search + "&order="+ order +"'>" + i + "</a>" );
        out.print( "&nbsp;" );
    } // end for ( int i = startPage; i < endPage; i++  )
    if ( curPage == endPage )
        out.print( "<div class='pageon'>"+endPage+"</div>" );
    else
        out.print( "<a  href='?curPage=" + endPage + "&search=" + search + "&order="+ order +"'>" + endPage + "</a>" );
    // 3. 다음 페이지로 이동 &gt = 부등호 >
    out.print( "&nbsp;" );
    if ( curPage == totalNum )
        out.print( "<div class='pageon'>&gt;</div>" );
    else
        out.print( "<a  href='?curPage=" + ( curPage + 1 ) + "&search=" + search + "&order="+ order +"'>&gt;</a>" );
    // 2. 다음 페이지 블럭으로 이동
    /* out.print( "&nbsp;" );
    if ( endPage == totalNum )
        out.print( "<div class='pageon'>&gt;&gt;</div>" );
    else
        out.print( "<a  href='?curPage=" + ( endPage + 1 ) + "&search=" + search + "&order="+ order +"'>&gt;&gt;</a>" ); */
    // 1. 마지막 페이지로 바로 이동
    out.print( "&nbsp;" );
    if ( curPage == totalNum )
        out.print( "<div class='pageon'>마지막</div>" );
    else
        out.print( "<a  href='?curPage=" + totalNum + "&search=" + search + "&order="+ order +"'>마지막</a>" );
} else{
	out.print( " " );}%>