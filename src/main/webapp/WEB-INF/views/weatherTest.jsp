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
	var faddr = '����Ư���� ��õ�� ���굿 371-50';
	var geocoder;
	geocoder = new google.maps.Geocoder();
	geocoder.geocode( { 'address': faddr}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			var faddr_lat = results[0].geometry.location.lat();	//����
			var faddr_lng = results[0].geometry.location.lng();	//�浵
		} else {
			var faddr_lat = "";
			var faddr_lng = "";
		}
		document.frm.sangchaji_faddr_lat.value = faddr_lat;
		document.frm.sangchaji_faddr_lng.value = faddr_lng;
		alert('�ּ� : ' + faddr + '\n\n���� : ' + faddr_lat + '\n\n�浵 : ' + faddr_lng);
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
    	//����
    	var country = resp.sys.country;
    	var name = resp.name;
    	$("#outputDiv0").html(country + " - " + name);
    	
    	//���
    	var temp = resp.main.temp- 273.15;
    	temp = Math.floor(temp*10)/10;
    	$("#outputDiv1").html(temp);
        
    	//���� �����
    	var weather = 0;
    	var weather2 = null;
    	var weather3 = "";
    	for(var i = 0; i < resp.weather.length; i++){
    		weather = resp.weather[i].id;
    		if(weather >=200 && weather <= 232){
    			weather2 = "õ��";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather >= 300 && weather <= 321){
    			weather2 = "������";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather >= 500 && weather <= 531){
    			weather2 = "��";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather >= 600 && weather <= 622){
    			weather2 = "��";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 701 || weather == 721 || weather == 741){
    			weather2 = "�Ȱ�";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 711){
    			weather2 = "����";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 731 || weather == 751 || weather == 761){
    			weather2 = "��, ����";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 762){
    			weather2 = "ȭ����";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 771){
    			weather2 = "���ݽ�";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 781){
    			weather2 = "��ǳ";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 800){
    			weather2 = "���� �ϴ�";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather == 801){
    			weather2 = "���� ���� ����";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		if(weather >= 802 && weather <= 804){
    			weather2 = "���� �ִ� ����";
    			if(weather3.search(weather2) == -1){
    				weather3 = weather2 + " " + weather3;
    			}
    		}
    		$('#outputDiv2').html(weather3);
    	}
    	
    	/* console.log(resp);
        console.log("����µ� : "+ (resp.main.temp- 273.15) );
        console.log("������� : "+ resp.main.humidity);
        console.log("���� : "+ resp.weather[0].main );
        console.log("�󼼳������� : "+ resp.weather[0].description );
        console.log("���� �̹��� : "+ resp.weather[0].icon );
        console.log("�ٶ�   : "+ resp.wind.speed );
        console.log("����   : "+ resp.sys.country );
        console.log("�����̸�  : "+ resp.name );
        console.log("����  : "+ (resp.clouds.all) +"%" );                */  
    }
})

</script>
<title>Insert title here</title>
<script>

</script>
</head>
<body>
���� : <div id="outputDiv0"></div><br>
���� ��� : <div id="outputDiv1"></div><br>
���� : <div id="outputDiv2"></div><br>

</body>
</html>