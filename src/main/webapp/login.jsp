<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	pageContext.setAttribute("PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<title>登录</title>
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://cdn.bootcss.com/angular.js/1.4.6/angular.min.js"></script>
		<style>
			ul,
			li {
				list-style: none;
			}
			
			a {
				text-decoration: none;
			}
			
			* {
				margin: 0;
				padding: 0;
			}
			
			input,
			select,
			textarea {
				outline: none;
			}
			
			textarea {
				resize: none;
				text-align: center;
				padding: 2px 0;
				width: 180px;
				height: auto;
			}
			
			a {
				text-decoration: none;
				color: rgb(8,138,254);
			}
			
			td {
				border-right: 1px solid black;
				border-bottom: 1px solid black;
			}
			
			.fl {
				float: left;
			}
			
			.fr {
				float: right;
			}
			
			.clearfix:before,
			.clearfix:after {
				content: '';
				display: table;
			}
			
			.clearfix:after {
				clear: both;
			}
			
			.hr_30{
				width: 100%;
				height: 30px;
			}
			
			#cols{margin: 20px;background-color: rgb(248,248,248);}
			.register,
			.login_link {
				width: 80%;
				width: -moz-calc(100% - 80px * 2);
				width: -webkit-calc(100% - 80px * 2);
				width: calc(100% - 80px * 2);
				margin: 40px auto;
			}
			#aside{
				border-right: 1px solid rgb(241,241,241);
			}
			.prompt{
				margin-top: 0.5rem;
				font-size: 1rem;
				line-height: 2rem;
			}
			.prompt span:nth-child(1){
				color: rgb(150,150,200);
			}
			.prompt span:nth-child(2){
				color: #1B1B1B;
			}
		</style>
	</head>

	<body>
		<div id="wrapper">
			<div id="head" class="" style="height: 50px;background-color: #dedef8;box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">head</div>
			<div id="cols" style="overflow: hidden;">
				<div id="aside" class="col-md-6">
					<div class="register" ng-app="">
						<h2 style="color: rgb(240,144,28);">登录到您的天气账户</h2>
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-md-3">用户名:</label>
								<div class="col-sm-9">
									<input type="text" name="username" class="form-control" placeholder="请输入用户名" ng-model="username" required="required">
									<span id="u"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3">密码:</label>
								<div class="col-sm-9">
									<input type="password" name="password" class="form-control" placeholder="请输入密码" ng-model="password" required="required">
									<span id="p"></span>
								</div>
								<a href="">忘记密码？</a>
							</div>							
							<div class="form-group">
								<div class="hr_30"></div>
								<input id="submit" type="button" class="btn col-md-3 col-md-offset-1" style="background-color: rgb(135,186,83);color: white;" value="登录"/><br />
								<div class="hr_30"></div>
								<div class="col-md-10 col-md-offset-1" style="background-color:white;text-align: center;box-shadow: 1px 1px 2px #999999;">
									还没有心悦天气天气账户吗?<a href="${PATH }/register.jsp">立即注册</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div id="footer" class="" style="height: 120px;box-shadow: 
         inset 0px 10px 40px #444;">footer</div>
		</div>
		<script>
			$("#submit").click(function(){
				$("span").html("");
				var regxUsername = /^[a-zA-Z0-9_-]{4,16}$/;
				var regxpassword = /^[a-zA-Z0-9_-]{6,16}$/;
				var username = $("input[name='username']").val();
				var password = $("input[name='password']").val();
				var span = $(".form-group span");
				console.log(username);
				if(regxUsername.test(username)&&regxpassword.test(password)){
					$.ajax({
						type:"post",
						url:"${PATH}/checklogin?username="+username+"&password="+password,
						async:true,
						success:function(result){
							console.log("checklogin:"+result);
							if(result.msg=="处理失败!"){
								$("#u").html(result.extend.usn);
								$("#p").html(result.extend.psd);
							}else{
								$.ajax({
									type:"post",
									url:"${PATH}/logn",
									data:$(".form-horizontal").serialize(),
									success:function(result){
										console.log("logn:"+result);
										console.log(result);
										if(result.code==200){
											$("#u").html(result.extend.erroru);
											$("#p").html(result.extend.errorp);
										}else{
											window.location.assign("${PATH}/"+result.extend.url);
										}
									},
									error:function(result){
										console.log("error");
									}
								});
							}
						}
					});	
				}else if(!regxUsername.test(username)){
					$("#u").html("用户名格式不正确，4-20个字符");
				}else if(!regxpassword.test(password)){
					$("#p").html("密码格式不正确，6-12个字符");
				}
			});
		</script>
	</body>

</html>