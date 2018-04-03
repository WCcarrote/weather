<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<title>心悦天气注册</title>
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
					<div class="register">
						<h2 style="color: rgb(240,144,28);">注册新账号</h2>
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<div class="col-sm-3">
									<label><span style="color: red;font-size: 1.7rem;">* </span>用户名:</label><br />
									<div class="prompt">
										<span class="glyphicon glyphicon-info-sign"></span>
										<span> 4-20个字符</span>
									</div>
								</div>
								<div class="col-sm-9">
									<input id="username" name="username" type="text" class="form-control has-error" placeholder="请输入用户名" required="required">
									<span></span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-3">
									<label><span style="color: red;font-size: 1.7rem;">* </span>密码:</label><br />
									<div class="prompt">
										<span class="glyphicon glyphicon-info-sign"></span>
										<span> 6-12个字符</span>
									</div>
								</div>
								<div class="col-sm-9">
									<input type="password" name="password" class="form-control password" placeholder="请输入密码" required="required">
									<span></span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-3">
									<label><span style="color: red;font-size: 1.7rem;">* </span>确认密码:</label><br />
									<div class="prompt">
										<span class="glyphicon glyphicon-info-sign"></span>
										<span> 重输密码</span>
									</div>
								</div>
								<div class="col-sm-9">
									<input type="password" name="passwordag" class="form-control password" placeholder="请再次输入密码" required="required">
									<span></span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-3">
									<label><span style="color: red;font-size: 1.7rem;">* </span>手机号:</label><br />
									<div class="prompt">
										<span class="glyphicon glyphicon-info-sign"></span>
										<span> 手机号码</span>
									</div>
								</div>
								<div class="col-sm-9">
									<input id="contact" name="contact" type="text" class="form-control" placeholder="请输入手机号" required="required">
									<span></span>
								</div>
							</div><br />
							<div class="form-group">
								<input id="checkbox" type="checkbox" value="">
								<span> 我同意<a> &laquo;服务协议&raquo;</a> 及 <a>&laquo;隐私条款&raquo;</a></span>
							</div>
							<div class="form-group">
								<button id="register" class="btn col-md-6" style="background-color: rgb(135,186,83);color: white;">立即注册！</button>
							</div>
						</form>
					</div>
				</div>
				<div id="content" class="col-md-6">
					<div class="login_link"><br />
						<h3>已有账号，请直接登录</h3>
						<form action="${PATH}/login.jsp"><button class="col-md-3 col-md-offset-1">登录</button></form>
					</div>
				</div>
			</div>
			<div id="footer" class="" style="height: 120px;box-shadow: 
         inset 0px 10px 40px #444;">footer</div>
		</div>
		<script type="text/javascript">
			$("#register").click(function(){
				//验证注册信息是否正确
				console.log("form click:");
				var namereg = /(^[a-zA-Z0-9_-]{4,20}$)|(^[\u2E80-\u9FFF]{2,6})/;
				var username = $("#username").val();
				//验证用户名是否正确
				if (!namereg.test(username)) {
					show_validate_msg("#username","error","用户名可以是2-6位中文或者是4-20位英文和数字的组合");
					return false;
				}else{
					show_validate_msg("#username","success","");
					console.log("用户名正确");
				}


				var passwordreg = /(^[a-zA-Z0-9_-]{6,12}$)|(^[\u2E80-\u9FFF]{2,6})/;
				var password1 = $(".password")[0].value;
				var password2 = $(".password")[1].value;
				//验证密码和再输密码是否相同并且验证密码格式是否正确
				if(passwordreg.test(password1)){
					show_validate_msg(".password:eq(0)","success","");
					if(password1 == password2 && password1 != ""){
						show_validate_msg(".password:eq(1)","success","");
						console.log("密码正确");
					}else{
						show_validate_msg(".password:eq(1)","error","密码不相同");
						return false;
					}
				}else{
					show_validate_msg(".password:eq(0)","error","密码可以是2-6位中文或者是6-12位英文和数字的组合");
					return false;
				}


				var phonereg = /(^[0-9-]{11}$)|(^[0-9-]{8}$)/;
				var phone = $("#contact").val();
				//验证号码是否正确
				if(!phonereg.test(phone)){
					show_validate_msg("#contact","error","手机号码为11位有效数字");
					return false;
				}else{
					show_validate_msg("#contact","success","");
					console.log("手机号正确");
				}

				/* var emailreg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				var email = $("#email").val();
				if(email != ""){
					if(!emailreg.test(email)){
						show_validate_msg("#email","error","邮箱格式不正确");
						return false;
					}else{
						show_validate_msg("#email","success","");
					}
				} */

				if(!$("#checkbox").is(':checked')){
					return false;
				}
				console.log("checkbox:"+$("#checkbox").is(':checked'));
				console.log("校验成功");
				$.ajax({
				    url: '${PATH}/register',
				    method: 'post',
				    data:$("form.form-horizontal").serialize(),
				    success:function(result){
				    	if(result.code==200){
				    		$("#username").next("span").text(result.extend.usn);
				    		$("#password").next("span").text(result.extend.psd);
				    		$("#contact").next("span").text(result.extend.con);
				    	}else{
				    		//alert("${PATH}/"+result.extend.url);
				    		window.location.assign("${PATH}/"+result.extend.url);
				    	}
				    	
				    },
				    error:function(result){
				    	console.log("error"+result);
				    }
				});
			});

			function show_validate_msg(ele,status,msg){
				//清除状态
				$(ele).parent().removeClass("has-success has-error");
				$(ele).next("span").text("");
				if("success"==status){
					$(ele).parent().addClass("has-success");
					$(ele).next("span").text(msg);
				}else if("error"==status){
					$(ele).parent().addClass("has-error");
					$(ele).next("span").text(msg);
				}
			}
			
			$("#username").change(function(){
				
			});
		</script>
	</body>

</html>