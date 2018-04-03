var url_json = "http://www.sojson.com/open/api/weather/json.shtml?city=";
var url_xml = "http://www.sojson.com/open/api/weather/xml.shtml?city=";
var url = "http://wthrcdn.etouch.cn/weather_mini?city=";
var url0 = "http://wthrcdn.etouch.cn/WeatherApi?city=";
var notice_img_classes = ["fa fa-dribbble","",""];
var ajax = {
	getjson:function() {
		var result = getajax(url_json,"get","json","鍖椾含");
		if(!result == false){
			/* 瓒嬪娍鍥� */
		}else{
			return "json鑾峰彇澶辫触";
		}
	},
	getxml:function() {
		var result = getajax(url_xml,"get","xml","鍖椾含");
		if(!result == false){
			creatnotice(result);
		}else{
			return "xml鑾峰彇澶辫触";
		}
	},
	getajax:function(url,type,dataType,city) {
		$.ajax({
			url: url+city,
			type:type,
			dataType:dataType,
			success:function(result){
                return result;
			},
            error:function(result){
                return false;
            }
		});
	},
	creatnotice:function(xml){
		var _ul = $("<ul/>");
        var lifepoint = $("#lifepoint");
        console.log("creatnotice:");
		$(xml).find("zhishu").each(function(i){
			console.log("zhishu:");
            var name = $(this).children("name");   // 鑾峰彇id鑺傜偣
            var value = $(this).children("value");
            var detail = $(this).children("detail");
            name_value = name.text();              // 鑾峰彇鑺傜偣鏂囨湰
            detail_value = detail.text();
            _value = value.text();
            console.log(name+">>"+value+">>"+detail);
            console.log(name_value+">"+_value+">"+detail_value);

            var _h4 = $("<h4/>").addClass(notice_img_classes[i]);
            var _span = $("<span/>").append(name_value);
            var _li = $("<li/>").attr("id","lifepoint_msg");
            var _div1 = $("<div/>").addClass("notice_img block").append(_h4).append(_span);
            var _div2 = $("<div/>").addClass("notice_msg").append("<span>"+detail_value+"</span>");
            var _li = $("<li/>").append(_div1).append(_div2);
            _ul.append(_li);
        });
        lifepoint.append(_ul);
	}
}

function painting(result){
	console.log(painting);
	var info = $(".info");
	var weather = $(".weather");
	var others = $(".others");

	var _weather = $(result).find("forecast").children("weather")[0].children("day").children("type").text();		// 浠婂ぉ澶╂皵鐘舵��
	var _pm25 = $(result).find("pm25");

	// 鍒濆鍖�
	info.children("i").prop("data-icon","");

	// 鏄剧ず澶╂皵姘旇薄
	switch(_weather){
		case "鏅�" : info.prepend($("<i/>").prop("data-icon","B"));
					weather.append(_weather);
			break;
		case "澶氫簯" : info.prepend($("<i/>").prop("data-icon","H"));
					weather.append(_weather);
			break;
		case "闃�" : info.prepend($("<i/>").prop("data-icon","Y"));
					weather.append(_weather);
			break;
		case "灏忛洦" : info.prepend($("<i/>").prop("data-icon","Q"));
					weather.append(_weather);
			break;
		case "涓洦" : info.prepend($("<i/>").prop("data-icon","R"));
					weather.append(_weather);
			break;
		case "澶ч洦" : info.prepend($("<i/>").prop("data-icon","X"));
					weather.append(_weather);
			break;
		case "鏆撮洦" : info.prepend($("<i/>").prop("data-icon","$"));
					weather.append(_weather);
			break;
		case "闃甸洦" : info.prepend($("<i/>").prop("data-icon","T"));
					weather.append(_weather);
			break;
		case "闆烽樀闆�" : info.prepend($("<i/>").prop("data-icon","Z"));
					weather.append(_weather);
			break;
		case "灏忛洩" : info.prepend($("<i/>").prop("data-icon","U"));
					weather.append(_weather);
			break;
		case "涓洩" : info.prepend($("<i/>").prop("data-icon","V"));
					weather.append(_weather);
			break;
		case "澶ч洩" : info.prepend($("<i/>").prop("data-icon","W"));
					weather.append(_weather);
			break;
		default : info.prepend($("<i/>").prop("data-icon","N"));
					weather.append(_weather);
	}

	// 鏄剧ず姝ゆ椂娓╁害
	weather.prepend("<font>"+$(result).find("wendu").text()+"&#176;</font>");

	// 鏄剧ず椋庡悜銆佹箍搴︺�佹皵鍘嬬瓑
	var _wind = $(result).find("resp").children("fengxiang").text();
	var fengli = $(result).find("fengli").eq(0).text();
	var _i = $("<i/>");
	switch(_wind){
		case "鍖楅" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(-45deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "涓滃寳椋�" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(0deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "涓滈" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(45deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "涓滃崡椋�" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(90deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "鍗楅" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(135deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "瑗垮崡椋�" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(180deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break
		case "瑗块" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(225deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		case "瑗垮寳椋�" : _i.addClass("fa fa-location-arrow").css("-webkit-transform","rotate(270deg)");
			others.append(_i).append("&nbsp;"+_wind+"&nbsp;"+fengli+"&nbsp;&nbsp;");break;
		default:console.log("椋庡悜鑾峰彇澶辫触.");
	}
	others.append("<i class='glyphicon glyphicon-tint'></i>&nbsp;婀垮害&nbsp;"+$(result).find("shidu").text()+"&nbsp;&nbsp");
	others.append("<i class='glyphicon glyphicon-dashboard'></i>&nbsp;姘斿帇&nbsp;"+""+"&nbsp;&nbsp");

	// 鏄剧ず绌烘皵璐ㄩ噺
	// $(".pm2_5").append(+"<br/><span>"+pm25+"</span>");
	// if(pm25<60){
	// $(".glyphicon-leaf").css("color","green");
	// }else if(pm25>120){
	// $(".glyphicon-leaf").css("color","purple");
	// }
}



var citys = {
		"武汉":"101200101",
		"宜昌":"101200901",
		"黄冈":"101200501",
		"恩施":"101201001",
		"荆州":"101200801",
		"神农架":"101201201",
		"十堰":"101201101",
		"咸宁":"101200701",
		"襄阳":"101200201",
		"孝感":"101200401",
		"随州":"101201301",
		"黄石":"101200601",
		"荆门":"101201401",
		"鄂州"  :"101200301"
}