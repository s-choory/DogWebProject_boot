<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.section{
	height: 100%;
	max-width: 800px;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
        }
.pick_scrollbar{
	overflow: scroll;
	scroll-snap-type: x mandatory;
	white-space: nowrap;
		}
.pick_img{
    width: 370px;
    height: 470px;
    margin: 0;
    padding: 0;
    object-fit: cover;
    border-radius: 10px;
        }
.pick_container{
	display: inline-block;
	margin-right: 10px;
	border-radius: 10px;
	overflow: hidden;
	scroll-snap-align: start;
}
.all{
	display: flex;
	flex-direction: column;
	align-items: center;
}
.main_Title{
	display: flex;
	font-weight: bolder;
	gap: 50px;
}
.sub_Title{
    font-weight: 300;
    /* color: #777777; */
    display: inline-block;
    line-height: 17px;
    gap: 50px;
}
</style>
<div class="all">
<div class="main_Title">
	Pick 가이드
</div>
<div class="sub_Title">
	<h7>누구나 갈 수 있는 특별한 장소 가이드</h7>
</div>
<!-- 컨텐츠 보여주기 시작 -->
<div class="section">
<div class="pick_scrollbar">

	<div class="pick_container">
		<div class= "pick_img">
			<a href="https://m.blog.naver.com/csduio/222253509148" target="_blank">
			<img src="${pageContext.request.contextPath}/resources/img/with/with_cafe.png" alt width="370px" height= "470px">
			</a>
		</div>
	</div>
	
	<div class="pick_container">
		<div class= "pick_img">
			<a href="https://www.ban-life.com/content/view?id=10439" target="_blank">
			<img src="${pageContext.request.contextPath}/resources/img/with/with_camp.png" alt width="370px" height= "470px"> <!-- width="50%" -->
			</a>
		</div>
	</div>
 	<div class="pick_container">
		<div class= "pick_img">
			<a href="https://vkdu.tistory.com/47" target="_blank">
			<img src="${pageContext.request.contextPath}/resources/img/with/with_eat.png" alt width="370px" height= "470px">
			</a>
		</div>
	</div>
	
	<div class="pick_container">
		<div class= "pick_img">
			<a href="https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=flzlflzl93&logNo=221648266375" target="_blank">
			<img src="${pageContext.request.contextPath}/resources/img/with/with_pool.png" alt width="370px" height= "470px">
			</a>
		</div>
	</div>
			
	<div class="pick_container">
		<div class= "pick_img">
			<a href="https://m.blog.naver.com/na10050/223170089433?isInf=true" target="_blank">
			<img src="${pageContext.request.contextPath}/resources/img/with/with_camp2.png" alt width="370px" height= "470px">
			</a>
		</div>
	</div>
	
</div>
</div>
</div>