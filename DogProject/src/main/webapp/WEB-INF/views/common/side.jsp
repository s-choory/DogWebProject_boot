<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
/* 고정 사이드바 */
	.fixed-sidebar {
	    position: fixed;
	    top: 90%;
	    transform: translateY(-50%);
	    right: 20px;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    z-index: 1000;
	}

	/* 스크롤 버튼 스타일 */
	.scroll-button {
		background: linear-gradient(135deg, #7AFF7A, #429F6B); /* 그라데이션 색상 지정 */
	    border: none;
	    border-radius: 40px;
	    color: white;
	    font-size: 15px;
	    padding: 10px;
	    margin-bottom: 3px;
	    cursor: pointer;
	    transition: color 0.3s, background-color 0.3s, transform 0.3s;
	    box-shadow: 0 3px 5px 0 gray;
	}
	
	.scroll-button:hover {
	    transform: translateY(-5px);
	    color: black;
	    font-weight: bolder;
	}
	
	
	#mypageImg{
		transition: transform 0.3s;
		margin-bottom: 20px;
	}
	
	#mypageImg:hover {
	    transform: translateY(-5px);
	}
	
	
	/* 스크롤 버튼 위치 조정 */
	#scroll-up-button {
	    margin-bottom: 10px;
	}
	
	#scroll-down-button {
	    margin-top: 10px;
	    margin-bottom: 15px;
	}
</style>
    
<div class="fixed-sidebar">
    <button class="scroll-button" id="scroll-up-button">
        <span>&#9650;</span>
    </button>
    <button class="scroll-button" id="scroll-down-button">
        <span>&#9660;</span>
    </button>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script type="text/javascript">
	
	document.addEventListener("DOMContentLoaded", function() {
	    const scrollStep = 10000; // 스크롤 간격 (픽셀 단위)
	
	    const scrollUpButton = document.getElementById("scroll-up-button");
	    scrollUpButton.addEventListener("click", function() {
	        window.scrollBy({
	            top: -scrollStep,
	            behavior: "smooth"
	        });
	    });
	
	    const scrollDownButton = document.getElementById("scroll-down-button");
	    scrollDownButton.addEventListener("click", function() {
	        window.scrollBy({
	            top: scrollStep,
	            behavior: "smooth"
	        });
	    });
	});
</script>

