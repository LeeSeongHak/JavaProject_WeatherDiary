<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	geoCode();
});

function geoCode() {
	var faddr = '서울특별시 금천구 가산동 371-50';
	var geocoder;
	geocoder = new google.maps.Geocoder();
	geocoder.geocode( { 'address': faddr}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			var faddr_lat = results[0].geometry.location.lat();	//위도
			var faddr_lng = results[0].geometry.location.lng();	//경도
		} else {
			var faddr_lat = "";
			var faddr_lng = "";
		}
		document.frm.sangchaji_faddr_lat.value = faddr_lat;
		document.frm.sangchaji_faddr_lng.value = faddr_lng;
		alert('주소 : ' + faddr + '\n\n위도 : ' + faddr_lat + '\n\n경도 : ' + faddr_lng);
		return;
	});
}

var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+"37.56826"+"&lon="+"126.977829"+"&appid="+"c1ae780151cf0ef8cdce02451a0dcc70";
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
    	//지역
    	var country = resp.sys.country;
    	var name = resp.name;
    	$("#outputDiv0").html(country + " - " + name);
    	
    	//기온
    	var temp = resp.main.temp- 273.15;
    	temp = Math.floor(temp*10)/10;
    	$("#outputDiv1").html(temp);
        
    	//날씨 컨디션
    	var weather = 0;
    	var weather2 = null;
    	var weather3 = "";
    	for(var i = 0; i < resp.weather.length; i++){
    		weather = resp.weather[i].id;
    		if(weather >=200 && weather <= 232){
    			weather2 = "천둥";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather >= 300 && weather <= 321){
    			weather2 = "가랑비";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather >= 500 && weather <= 531){
    			weather2 = "비";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather >= 600 && weather <= 622){
    			weather2 = "눈";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 701 || weather == 721 || weather == 741){
    			weather2 = "안개";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 711){
    			weather2 = "연기";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 731 || weather == 751 || weather == 761){
    			weather2 = "모래, 먼지";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 762){
    			weather2 = "화산재";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 771){
    			weather2 = "스콜스";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 781){
    			weather2 = "폭풍";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 800){
    			weather2 = "맑은 하늘";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 801){
    			weather2 = "구름 없는 날씨";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather >= 802 && weather <= 804){
    			weather2 = "구름 있는 날씨";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		$('#outputDiv2').html(weather3);
    	}
    	
    	/* console.log(resp);
        console.log("현재온도 : "+ (resp.main.temp- 273.15) );
        console.log("현재습도 : "+ resp.main.humidity);
        console.log("날씨 : "+ resp.weather[0].main );
        console.log("상세날씨설명 : "+ resp.weather[0].description );
        console.log("날씨 이미지 : "+ resp.weather[0].icon );
        console.log("바람   : "+ resp.wind.speed );
        console.log("나라   : "+ resp.sys.country );
        console.log("도시이름  : "+ resp.name );
        console.log("구름  : "+ (resp.clouds.all) +"%" );                */  
    }
})

</script>
<title>Insert title here</title>
<script>

</script>
</head>
<body>
지역 : <div id="outputDiv0"></div><br>
현재 기온 : <div id="outputDiv1"></div><br>
날씨 : <div id="outputDiv2"></div><br>

</body>
</html>