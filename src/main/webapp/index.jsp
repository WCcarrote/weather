<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-Ca-Key" content="LTAIjMObhlSpMHdX">
<title>Insert title here</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${APP_PATH}/static/font-awesome-4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="${APP_PATH}/static/meteocons-font/FONT/Font-face/stylesheet.css">
</head>
<style>
*{padding: 0;margin: 0}
body, input, textarea, select, button{background-color:#fff;color:#111; font: 14px Arial,"微软雅黑"; }
body, ul, dl, dd, p, h1, h2, h3, h4, h5, h6, form, div, fieldset, form, textarea, input { margin:0; padding:0; }
img {border:none;}
i{display: inline-block;}
input, textarea {outline:none; }
button::-moz-focus-inner{ border:0; padding:0; margin:0; }
.clear{zoom:1;}
.clear:after{content:".";display:block;visibility:hidden;height:0;clear:both;}
texearea {resize:none; }
em, cite, th { font-style:normal; font-weight:normal; }
table { border-collapse:collapse; }
dl,ol,dt,dd,ul,li {list-style:none; margin:0; padding:0; }
a { color:#dEdEdE; text-decoration:none; }
a:HOVER{color:rgb(243,170,11);text-decoration:none;}
html,body{width: 100%}

/*  */
.container{
      width:1240px;
      height:260px;
      overflow: hidden;
      padding-left:20px;
      padding-right:20px;
      margin:auto;
      margin-top: 12px;
      margin-bottom: 12px;
      background:#fff;
      border:1px solid #e5e5e5;
      border-radius: 8px;
      /*box-shadow: 0 .5px 3px #666;*/
    }
    .container .charts{
      width:2400px;
      height:152px;
    }
    .title{
      width: 2500px;
      height:100px;
      padding-top: 20px;
    }
    .item{
      float: left;
      width:100px;
      height:86px;
      text-align: center;
    }
    .item  .txt-item{
      line-height: 18px;
      font-size: 16px;
      color: #888;
    }
    .item .icon {
      display: block;
      height: 50px;
      width: 50px;
      margin: 0 auto;
      margin-top: 18px;
    }
    /* 按钮 */
    .btn{
      position: absolute;
      z-index: 2;
      width: 18px;
      color:#fff;
      font-size: 18px;
      font-weight:600;
      line-height: 30px;
      padding-left:6px;
      margin-left: 1210px;
      margin-top: 120px;
      border-radius: 4px;
      background-color: rgba(51,51,51,.4);
      box-shadow: 0 2px 4px 0 rgba(75,83,87,.2);
    }
    .btn:first-child{
      margin-left: -30px;
      margin-top: 120px;
      padding-left:0;
    }
    .btn:hover{
      background-color: rgba(51,51,51,.5);
    }
    #EContainer{
      margin-left:0px;
      transition: all 1000ms;
    }
    
/*Top*/
.top{height: 200px;color:white;background-color: rgb(0,165,240);margin-top: -10px}
  /*Logo*/
.logo{margin-top: 20px;}
.appname{font-size: 30px;margin-right: 30px}
.local{background-color:rgb(50,105,164);padding:5px;border-radius:4px;font-size: 15px;position: relative;}
.local :HOVER{cursor: pointer;}
.logo form{display:none;position: absolute;top:38px;left:225px;z-index: 100;}
.logo li{position: absolute;top: 0;right: 50px;width: auto;}
#change div,dl{display: inline-table;float: left;}
.search{display:none;position: absolute;top: 10px;left: 300px;}
.search input{display: block;border:none;background-color: white;text-indent: 5px;}
.search button{display: block;color:orange;}
  /*Info*/
.info{margin-top: 10px;}
.info div{float: left;}
.info i:first-child{font-size: 80px;float: left;margin-right: 20px;}
.info span.weather{font-size: 40px}
.info span.weather font{font-size: 60px;}
.info span.others{font-size: 20px;}
.info span.others i{font-size: 20px;}
.info .pm2_5{position:absolute;top:60px;right:20px;padding:10px 10px;background-color:white;color:rgb(243,149,11);border-radius:10px;font-size: 20px;text-align: center;}
.pm2_5 span{color:black;font-size: 17px;}


/*Body*/
.body{margin-top: 20px}
  /*24h */
#t_tendency{width: 100%;height: auto;overflow:hidden;position: relative;}
#t_tendency div{border:1px solid rgb(229,229,229);border-radius:5px;margin-top: 20px;}
#t_tendency span{padding:10px 5px;background-color: rgba(20,20,20,.8);position: absolute;top: 50px;cursor: pointer;}
#t_tendency #left{left: 0px}
#t_tendency #right{right: 0px}
#t_canvas{width: 2400;height: 150px;margin-left: 0px}
  /*Weatherweek*/
#weatherweek{width: 810px;margin:0px 20px;float: left;}
#weatherweek_time span,big{
	display:inline-block;
	width:114px;
	text-align: center;font-size: 20px;}
#mycanvas{width: 650px;height:250px;}
  /*Lifepoint*/
#lifepoint{width: 402px;float: left;overflow:hidden;margin-right: 5px}
#lifepoint ul li{height: 80px;overflow: hidden;float:left;margin:0 1px 2px 0;}
#lifepoint .hr{width: 100%;border:1px solid rgb(243,149,11);}
#lifepoint_msg{width: 100%;height:80px;border:none;text-align: center;position: relative;overflow: hidden;}
#lifepoint .notice_img{width:200px;height: 80px;vertical-align: middle;transition: margin .6s ease-in-out;background-color: rgba(0,0,0,.1);text-align: center;line-height: 80px;}
#lifepoint .notice_msg{height: 80px;width:200px;}
#lifepoint li:hover .notice_img{margin-top: -80px;}
#lifepoint li:hover .notice_msg{}




.hr{width: 100%;border:1px solid rgb(243,149,11)}
.block:before {
  content: '';
  display: inline-block;
  height: 0%;
  vertical-align: middle;
  margin-right: -0.25em; /* Adjusts for spacing */
}
</style>
<body>
	<div class="top">
		<div class="logo col-md-12">
			<a><img src="" alt=""></a><span class="appname">心悦天气</span>
			<span class="local"><i class="glyphicon glyphicon-map-marker"></i></span>
			<div class="search">
				<input type="text" class="form-control col-sm-8" placeholder="请输入查询的城市"/>
				<!-- <button class="glyphicon glyphicon-search btn col-sm-4"></button> -->
			</div>
			<ul>
				<li>
					<span id="load">
					<a href="${APP_PATH }/login.jsp">登录</a>&nbsp;|&nbsp;
					<a href="${APP_PATH }/register.jsp">注册</a>
					</span>
				<li>
				<li>
					<span id="change" style="diplay:inline-block;overflow: hidden;">
					<div style="margin-right: 20px"><span class="glyphicon glyphicon-repeat"></span>&nbsp;<a href="${APP_PATH }/index.jsp">注消</a></div>
					<dl id="in" style="diplay:inline-block;">
						<dt></dt>
					</dl>
					</span>
				</li>
				<div style="position: absolute;top: 0px;right: 200px">
					<a style="padding: 5px;" href="${APP_PATH }/manage.jsp">
						<span class="glyphicon glyphicon-cog"></span>&nbsp;管理页面
					</a>
				</div>
			</ul>
		</div>
		<div class="info" class="col-md-12">
			<div>
				<span class="weather"></span><br/>
				<span class="others"></span>
			</div>
			<div class="pm2_5">
				<big class="glyphicon glyphicon-leaf"></big><br/>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="body col-md-12">
		<div id="24h" class="col-md-12">
			<h3>24小时</h3><div class="hr"></div>
			<section class="container">
  <div id="btn">
    <a href="javascript:;" id="btn-pre" class="btn">〈</a>
    <a href="javascript:;" id="btn-next" class="btn">〉</a>
  </div>
  <div id="EContainer">
    <ul class="title">
      <li class="item">
        <p class="txt-item">9:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">10:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">11:00</p>
        <img src="svg/004.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">12:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">13:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">14:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">15:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">16:00</p>
        <img src="svg/004.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">17:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">18:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">19:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">20:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">21:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">22:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">23:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">24:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">01:00</p>
        <img src="svg/004.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">02:00</p>
        <img src="svg/004.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">03:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">04:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">05:00</p>
        <img src="svg/004.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">06:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">07:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
      <li class="item">
        <p class="txt-item">08:00</p>
        <img src="svg/005.svg " class="icon" />
      </li>
    </ul>
    <div id="main" class="charts"></div>
  </div>
</section>
		</div>
		<div id="weatherweek">
			<h3>6日天气</h3><div class="hr"></div>
			<div class="weekInfo">
				<div class="weatherweek_time" id="date"></div>
				<div style="width: 100%;height: 5px;"></div>
				<div class="weatherweek_time" id="weaicon"></div>
				<div id="h"></div>
				<canvas id="mycanvas" width="700" height="250"></canvas>
				<div id="l"></div>
				<div class="weatherweek_time" id="fx"></div>
				<div class="weatherweek_time" id="fl"></div>
			</div>
		</div>
		<div id="lifepoint">
			<h3>生活指数</h3><div class="hr"></div>
		</div>
		<div>
			<img src="" width="100%">
		</div>
	</div>
	<div class="bottom" style="text-align: center;">
		<img src="" width="100%" height="" alt="数据来源">
		<span></span>
		<span></span>
		<span></span>
	</div>
	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>  
<script type="text/javascript" src="${APP_PATH}/static/js/ajax.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/echarts.simple.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/EventUtil.js"></script>
<script type="text/javascript">
	/* var city = ""; */
	window.onload = function(){
		var cname = returnCitySN["cname"].split("省");
		var province = cname[0]+"省";
		var city = cname[1];
		var pm25;
		var id = GetQueryString("userid");
		var user = null;
		if((id!="")&&(id!=null)){
			$.ajax({
				url:"${APP_PATH}/getuser/"+id,
				type:"get",
				dataType:"json",
				success:function(result){
					console.log(result);
					user = result.extend.user;
					if(user.localplace!=""&&user.localplace!=null){
						province = user.localplace.split("省")[0]+"省";
						city = user.localplace.split("省")[1];
					}
					$("#load").toggle();
					$("#change").toggle();
					$("#in dt").html(user.username);
				},
				error:function(result){
					console.log("getUserInfo---error!");
				}
			});
		}
		console.log("province:"+province+"-->>city"+city);
		initialize(province,city);
		get24h(city);
		$("img[alt='数据来源']").attr("src","${APP_PATH }/static/img/bottom.jpg");
	};
	
	/* function set24h(result){
		console.log("set24hStart:");
		var arr_t = new Array();
		var time = new Array();
		var pre_t,min,max;
		min = 888;
		max = -888;
		for(var i=0;i<result.extend.data.result.hourly.length;i++){
			time[i] = result.extend.data.result.hourly[i].time;
			arr_t[i] = parseInt(result.extend.data.result.hourly[i].temp);
			if(arr_t[i]>max){
				max = arr_t[i];
			}else if(arr_t[i]<min){
				min = arr_t[i];
			}
		} 
		pre_t = (min+max)/2;
		console.log(arr_t+"\n"+pre_t+min+max+"\n"+time[1]);

		canvas = document.getElementById("t_canvas");
		ctx = canvas.getContext('2d');
		ctx.fillText(time[0],40,20);
		ctx.fillText(arr_t[0]+"℃",40,85+(pre_t-arr_t[0])*10);
		ctx.moveTo(50,90+(pre_t-arr_t[0])*10);
		for(var j = 1;j<arr_t.length;j++){
			console.log("for:");
			ctx.fillText(time[j],40+(100*j),20);
			ctx.fillText(arr_t[j]+"℃",40+(100*j),85+(pre_t-arr_t[j])*10);
			ctx.lineTo(50+100*j,90+(pre_t-arr_t[j])*10);
		}ctx.stroke();
		console.log("set24hEnd:");
	}*/
	
	//初始化页面
	function clear(){
		$("#change").hide();
		$("#lifepoint ul").remove();
		$(".local span").remove();
		$(".weather").empty();
		$(".others").empty();
		$(".pm2_5").html("<big class='glyphicon glyphicon-leaf'></big><br/>");
		$("#weatherweek div *").empty();
		$("#mycanvas").attr('width', '700');
		//canvas.attr('height', canvas.height());
	}
	//读写数据
	function initialize(province,city){
		clear();
		$(".local").append("<span>"+province+"&nbsp;"+city+"</span>");
		var result = $.ajax({
			url: url0+city,
			type:"get",
			dataType:"xml",
			success:function(result){
                painting(result);
                var _ul = $("<ul/>");
        		var lifepoint = $("#lifepoint");
                for(var i=0 ;i<$(result).find("zhishu").length;i++){
                	var _result = $(result).find("zhishu").eq(i);
                	name_value = _result.children("name").text();              //获取节点文本
            		detail_value = _result.children("detail").text();
            		_value = _result.children("value").text();

            		var _h4 = $("<h4/>").addClass(notice_img_classes[i]);
		            var _span = $("<span/>").append(name_value);
		            var _li = $("<li/>").attr("id","lifepoint_msg");
		            var _div1 = $("<div/>").addClass("notice_img block").append(_h4).append(_span);
		            var _div2 = $("<div/>").addClass("notice_msg").append("<span>"+detail_value+"</span>");
		            var _li = $("<li/>").append(_div1).append(_div2);
		            _ul.append(_li);
                }
                lifepoint.append(_ul);
                creatTendency(result);
                paint(result);
                return result;
			},
            error:function(){
            	alert("error");
            }
        });
	}

	//获取页面链接地址的参数
	function GetQueryString(name)
	{
	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	     var r = window.location.search.substr(1).match(reg);
	     if(r!=null)return  unescape(r[2]); return null;
	}
	//正则表达式校验：手机号、用户名、密码、邮箱、中文
	var check = function(argument) {
		var regxCellphone = /^1[3|4|5|8][0-9]\d{4,8}$/;
		var regxUsername = /^[a-zA-Z0-9_-]{4,16}$/;
		var regxpassword = /^[a-zA-Z0-9_-]{6,16}$/;
		var regxEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		var regxChinese = /[\u4E00-\u9FA5]/;
	}


	//判断是否联网
	var condition = function(){
		return navigator.onLine ? true : false;
	}

	//点击定位图标事件
	$(".local i").click(function(){
		var cname = returnCitySN["cname"].split("省");
		var province = cname[0]+"省";
		var city = cname[1];
		initialize(province,city);
		get24h(city);
	});
	
	$(".local").click(function(){
		$(".search input").toggle;
	});
	
	$(".search").keydown(function(event){
		if(event.which==13){
			var city = $(this).children("input").val();
			$("local ")
			initialize("",city);
			get24h(city);
		}
	});
	
	//写入空气质量
	function pm2_5(result){
		var pm25,quality;
		console.log(result.extend);
		pm25 = parseInt(result.extend.data.result.aqi.aqi);
		quality = result.extend.data.result.aqi.quality;
		$(".pm2_5").append("<span>"+pm25.toString()+"</span></br>"+quality);
		$(".pm2_5 span").css("color","orange");
		if(pm25<50){
			$(".glyphicon-leaf").css("color","green");
		}else if(pm25>200){
			$(".glyphicon-leaf").css("color","purple");
		}
	}
	
	//画出趋势图
	function painting(result){
	console.log("paintingStart:");
	var info = $(".info");
	var weather = $(".weather");
	var others = $(".others");

	var _weather = $(result).find("type").eq(0).text();		//今天天气状态
	// var _pm25 = $(result).find("pm25");

	//初始化
	info.children("i").attr("data-icon","");

	//显示天气气象
	switch(_weather){
		case "晴" : info.prepend($("<i/>").attr("data-icon","B"));
					weather.append(_weather);
			break;
		case "多云" : info.prepend($("<i/>").attr("data-icon","H"));
					weather.append(_weather);
			break;
		case "阴" : info.prepend($("<i/>").attr("data-icon","Y"));
					weather.append(_weather);
			break;
		case "小雨" : info.prepend($("<i/>").attr("data-icon","Q"));
					weather.append(_weather);
			break;
		case "中雨" : info.prepend($("<i/>").attr("data-icon","R"));
					weather.append(_weather);
			break;
		case "大雨" : info.prepend($("<i/>").attr("data-icon","X"));
					weather.append(_weather);
			break;
		case "暴雨" : info.prepend($("<i/>").attr("data-icon","$"));
					weather.append(_weather);
			break;
		case "阵雨" : info.prepend($("<i/>").attr("data-icon","T"));
					weather.append(_weather);
			break;
		case "雷阵雨" : info.prepend($("<i/>").attr("data-icon","Z"));
					weather.append(_weather);
			break;
		case "小雪" : info.prepend($("<i/>").attr("data-icon","U"));
					weather.append(_weather);
			break;
		case "中雪" : info.prepend($("<i/>").attr("data-icon","V"));
					weather.append(_weather);
			break;
		case "大雪" : info.prepend($("<i/>").attr("data-icon","W"));
					weather.append(_weather);
			break;
		default : info.prepend($("<i/>").attr("data-icon","N"));
					weather.append(_weather);
	}

	//显示此时温度
	weather.prepend("<font>"+$(result).find("wendu").text()+"&#176;</font>");

	//显示风向、湿度、气压等
	var _wind = $(result).find("resp").children("fengxiang").text();
	var fengli = $(result).find("fengli").eq(0).text();
	var _i = $("<i/>");
	switch(_wind){
		case "北风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(-45deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "东北风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(0deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "东风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(45deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "东南风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(90deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "南风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(135deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "西南风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(180deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "西风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(225deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "西北风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(270deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		default:_i.addClass("fa fa-superpowers");others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");
	}
	others.append("<i class='glyphicon glyphicon-tint'></i>湿度&nbsp;"+$(result).find("shidu").text()+"&nbsp;&nbsp");
	others.append("<i class='glyphicon glyphicon-dashboard'></i>&nbsp;气压&nbsp;"+""+"&nbsp;&nbsp");

	console.log("paintingEnd:");
}
function creatTendency(result){
	console.log("creatTendencyStart:");
	var date = $("#date");
	var weaicon = $("#weaicon");
	var fx = $("#fx");
	var fl = $("#fl");
	
	var _date0 = $(result).find("date_1");
	var _date = $(result).find("date");
	
	var _type0 = $(result).find("type_1");
	var _type = $(result).find("type");
	
	var _fx0 = $(result).find("fx_1");
	var _fx = $(result).find("fengxiang");
	
	var _fl0 = $(result).find("fl_1");
	var _fl = $(result).find("fengli");
	
	var windfx = $("<big/>");
	date.append("<big>昨天</big>");
	weaicon.append($("<big/>").attr("data-icon",icon(_type0.text()))).css({"color":"rgb(243,149,11)","font-size":"20px"});
	wind(windfx,_fl0.text());
	fx.append(windfx).css({"color":"rgb(0,165,240)","font-size":"20px"});
	fl.append("<big>"+_fl0.eq(0).text()+"</big>");
	for(var i = 0;i<_date.length;i++){
		var windfx = $("<big/>");
		if(i==0){
			date.append("<big>今天</big>");
		}else{
			date.append("<big>"+_date.eq(i).text()+"</big>");
		}
		weaicon.append($("<big/>").attr("data-icon",icon(_type.eq(i).text())));
		wind(windfx,_fx.eq(i).text());
		fx.append(windfx);
		fl.append("<big>"+_fl.eq(i).text()+"</big>");
	}
	console.log("creatTendencyEnd:");
}

function icon(_weather){
	var icon;
	switch(_weather){
	case "晴" : icon = "B";break;
	case "多云" : icon = "H";break;
	case "阴" : icon = "Y";break;
	case "小雨" : icon ="Q";break;
	case "中雨" : icon ="R";break;
	case "大雨" : icon = "X";break;
	case "暴雨" : icon ="$";break;
	case "阵雨" : icon ="T";break;
	case "雷阵雨" : icon ="Z";break;
	case "小雪" : icon ="U";break;
	case "中雪" : icon ="V";break;
	case "大雪" : icon ="W";break;
	default : icon ="N";
	}
	return icon;
}

function wind(_i,_wind){
	switch(_wind){
	case "北风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(-45deg)");
		break;
	case "东北风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(0deg)");
		break;
	case "东风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(45deg)");
		break;
	case "东南风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(90deg)");
		break;
	case "南风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(135deg)");
		break;
	case "西南风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(180deg)");
		break;
	case "西风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(225deg)");
		break;
	case "西北风" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(-90deg)");
		break;
	default:_i.text("无持续风向");
	}
}

function setwendu(canvas){
	var hvalue = hh-hl;
	var lvalue = lh-ll;
	var j = 1;
	for(var i =2;i<=hvalue;i++){
		if((hvalue%i==0)&&(lvalue%i==0)){
			j = i*j;
		}
	}
	var empx = (canvas.height-40)/j;
}

function getwendu(result){
	console.log("getwendu-Start:\n"+result);
	var high = new Array();
	var low = new Array();
	var hh,hl,lh,ll;

	high[0] = $(result).find("high_1").text();
	low[0] = $(result).find("low_1").text();
	console.log("high[0]:"+high[0]+"   "+"low[0];"+low[0]);
	
	for(var  i = 0;i<$(result).find("high").length;i++){
		high[i+1] = $(result).find("high").eq(i).text();
		console.log(high[i+1]);
		low[i+1] = $(result).find("low").eq(i).text();
	}
	console.log("high:"+high+"  low:"+low);
	hh = hl = high[0];
	lh = ll =low[0];
	for(var j =0;j<high.length;j++){
		high[j] = high[j].split(" ")[1];
		low[j] = low[j].split(" ")[1];
		if(high[j]>hh){
			hh = high[j];
		}else if(high[j]<hl){
			hl = high[j];
		}
		if(low[j]>lh){
			lh = high[j];
		}else if(low[j]<ll){
			ll = high[j];
		}
	}
	console.log(hh+hl+lh+ll);
	console.log("getwendu-End:");
	return {"high":high,"low":low,"hh":hh,"hl":hl,"lh":lh,"ll":ll};
}

function paint(result){
	var canvas = document.getElementById("mycanvas");
	var h1 = $(result).find("high_1").text();
	var l1 = $(result).find("low_1").text();

	var h = new Array();
	var l = new Array();
	h[0]=h1.split(" ")[1].split("℃")[0];
	l[0]=l1.split(" ")[1].split("℃")[0];
	console.log(h[0]+" "+l[0]);
	for(var i = 0;i<$(result).find("high").length;i++){
		h[i+1]=$(result).find("high").eq(i).text().split(" ")[1].split("℃")[0];
		l[i+1]=$(result).find("low").eq(i).text().split(" ")[1].split("℃")[0];
		console.log(h[i+1]+" "+l[i+1]);
	}
	var hmax,lmin;
	hmax = parseInt(h[0]);
	lmin = parseInt(l[0]);
	for(var j =0;j<h.length;j++){
		if(parseInt(h[j])>hmax){hmax = h[j];}
		if(parseInt(l[j])<lmin){lmin = l[j];}
	}
	console.log(hmax+lmin);
	var count = parseInt(parseInt(hmax) - parseInt(lmin));
	var Y = parseInt(75/count)+2;
	var X = 124;
	var pen = parseInt(parseInt(hmax) + parseInt(lmin))/2;
	console.log(Y+"//"+pen);
	
	var ctx = canvas.getContext("2d");
	ctx.strokeStyle ="rgb(243,149,11)";
	ctx.moveTo(60,75+((pen-parseInt(h[0]))*Y));
	ctx.font = "20px Courier New";
	ctx.fillText(".", 60,75+((pen-parseInt(h[0]))*Y));
	ctx.fillText(h[0], 60,70+((pen-parseInt(h[0]))*Y));
	for(var m =1;m<h.length;m++){
		ctx.lineTo(60+(m*X),75+((pen-parseInt(h[m]))*Y));
		ctx.fillText(".", 50+(m*X),75+((pen-parseInt(h[m]))*Y));
		ctx.fillText(h[m], 45+(m*X),70+((pen-parseInt(h[m]))*Y));
	}ctx.stroke();
	
	var ctx2 = canvas.getContext("2d");
	ctx2.strokeStyle ="rgb(0,165,240)";
	ctx2.moveTo(60,75+((pen-parseInt(l[0]))*Y));
	ctx2.font = "20px Courier New";
	ctx2.fillText(".", 60,75+((pen-parseInt(l[0]))*Y));
	ctx2.fillText(l[0], 50,90+((pen-parseInt(l[0]))*Y));
	for(var n =1;n<h.length;n++){''
		ctx2.lineTo(60+(n*X),75+((pen-parseInt(l[n]))*Y));
		ctx2.fillText(".", 50+(n*X),75+((pen-parseInt(l[n]))*Y));
		ctx2.fillText(l[n], 45+(n*X),90+((pen-parseInt(l[n]))*Y));
	}ctx2.stroke();
	
}

$(".local").click(function(){
	$(".search").toggle();
});

$("#right").click(function(){
	var div = $("#t_tendency div");
	console.log(div.css("margin-left")-100);
	if(div.css("margin-left")>-2400){
		div.animate("margin-left",div.css("margin-left")-100);
	}else{
		div.animate("margin-left",div.css("margin-left")-100);
	}
});

$("#left").click(function(){
	var div = $("#t_tendency div");
	if(div.css("margin-left")==0){
		div.animate("margin-left","0px");
	}else{
		div.animate("margin-left",div.css("margin-left")+100);
	}
});

function Dcharts(time,data){
	// 基于准备好的DOM,初始化echarts实例
	var myCharts = echarts.init(document.getElementById("main"));

	  //指定图标的配置项和数据
	var option = {

	  // 设置组件的位置等信息
	  grid:{
	    left:40,
	    right:40,
	    // width:2400,
	    // height:'160px'
	  },

	  // 设置X坐标
	  xAxis:{
	    // 坐标轴类型
	    type: 'category',
	    // 数据
	    data:time,
	    // 坐标轴两边留白策略
	    boundaryGap:false,
	    // 坐标轴线相关
	    axisLine:{
	      show:false,
	    },
	    // 坐标轴刻度线相关
	    axisTick: {
	      show: false,
	    },
	    // 坐标轴值相关
	    axisLabel:{
	      show:false,
	      fontSize:16,
	      color:"#333",
	      padding:[20,0,0,0]
	    }
	  },

	  // 设置Y坐标轴
	  yAxis:{
	    show:false,
	    axisLine:{
	      show:false,
	    },
	    axisTick: {
	      show: false,
	    },
	    // 分割线相关
	    splitLine: {
	      show: false,
	    },
	  },

	  // 配置图标相关
	  series:[{
	    type:'line',        // 图标类型
	    symbol:'circle',    // 标记样式
	    symbolSize:'10',    // 标记大小
	    lineStyle: {        // 折线的样式
	      normal: {
	        color: '#EB9A0E',
	        width: 4
	      }
	    },
	    itemStyle: {        // 折点样式
	      normal: {
	        color: '#EB9A0E',
	      }
	    },
	    label: {            // 折点的文本标签
	      normal: {
	        show: true,
	        distance:10,
	        color:'#333',
	        fontSize:16
	      }
	    },
	    // itemStyle:{
	    //   normal: {
	    //     label : {
	    //       show: true
	    //     }
	    //   }
	    // },
	    data:data
	  }]
	};
	// 使用刚指定的配置项和数据显示图表。
	myCharts.setOption(option);
};


var Main = {

};
Main.DOM = {
  btn:document.getElementById("btn"),
  echarts:document.getElementById("EContainer"),
}
Main.variate = {
  num:0,
};

EventUtil.addHandler(Main.DOM.btn,'click',function(e){
  var event = EventUtil.getEvent(e);
  var target = EventUtil.getTarget(event);
  switch(target.id){
    case 'btn-next':
      var num = Main.variate.num;
      if(num>0){
        break;
      }else{
        num = ++Main.variate.num;
        Main.DOM.echarts.style.marginLeft = -num*1200+'px';
      }
      break;
    case 'btn-pre':
      var num = Main.variate.num;
      if(num<1){
        break;
      }else{
        num = --Main.variate.num;
        Main.DOM.echarts.style.marginLeft = -num*1200+'px';
      }
      break;
    default:
      alert("逻辑错误!");
  }
});

function set24H(time,icon){
	var $txtItem = $(".txt-item");
	var $icon = $(".icon");
	var len = time.length;
	for(var i=0;i<len;i++){
		$txtItem.eq(i).text(time[i]);
		$icon.eq(i).attr("src","static/svg/"+icon[i]+".svg");
	};
}

//get24h(city);
function get24h(city){
	$.ajax({
		url : '${APP_PATH}/getuser',
		data : "city=" + city,
		type : 'post',
		success : function(result) {
			console.log(result);
			var len = result.extend.data.result.hourly.length,
				time=[],
				Sdata=[],
				Dimg=[];
			var hour = result.extend.data.result.hourly;
			for(var i=0;i<len;i++){
				time[i] = hour[i].time;
				Sdata[i] = hour[i].temp;
				Dimg[i]=hour[i].img;
			}
			Dcharts(time,Sdata);
			set24H(time,Dimg);
			pm2_5(result);
		}
	});
};

	
</script>
</body>

</html>