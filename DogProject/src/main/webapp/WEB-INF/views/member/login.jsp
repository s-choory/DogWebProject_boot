<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>Login</title>
	<!-- CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/main.css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">

</head>
<script type="text/javascript">
<%	String msg = (String)session.getAttribute("msg");
	if(msg != null){%>
		alert("<%= msg %>");
<% } 
	session.removeAttribute("msg");
%>

	function memadd(){
		var link = 'membership_agree';
		location.href=link;
	}
	
	function findID(){
		location.href = "findID";
	}
	function findPW(){
		location.href = "findPW";
	}
</script>
<style type="text/css">
	
  .find-btn{
    border-radius: 0px;
    line-height: 35px;
    width: 25%;
    text-transform: uppercase;
    border: none;
  }
</style>
<body>

<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>


	<!--================Login Box Area =================-->
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<video class="img-fluid" src="resources/img/login_img.mp4" controls autoplay muted loop></video>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Log in to enter</h3>
						<!-- Form Area -->
						<form class="row login_form" action="loginChk" method="post" id="contactForm" novalidate="novalidate">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="UserID" placeholder="UserID">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="name" name="Password" placeholder="Password">
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="primary-btn">Log In</button>
							</div>
							<div class="col-md-12 form-group">
								<button type="button" class="primary-btn" onclick="memadd()">Create an Account</button>
							</div>
<%-- 							    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/> --%>
						</form>
								<button class="primary-btn find-btn" onclick="findID()">Find ID</button>
								<button class="primary-btn find-btn" onclick="findPW()">Find PW</button>
					</div>
				</div>
				
			</div>
		</div>
	<!--================End Login Box Area =================-->

<jsp:include page = "../common/footer.jsp" flush="true"/>
</body>
</html>