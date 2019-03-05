$(document).ready(function(){
	
	var country = $('#country').html();
	
	var latlng = "https://maps.googleapis.com/maps/api/geocode/xml?address=" + country + "&language=ko&sensor=false&key=AIzaSyDBLJ3URwB6HcAHqAJiwwOOqgqwUe2Hu0M"

	$.ajax({
		url: latlng,
		dataType: "xml",
		type: "GET",
		async: "false",
		success: split,
		error: function(e){
			alert(json.stringify(e));
		}
	});
	
	function split (con) {
		var loc = $(con).find("location").text();
		
		$.ajax({
			url: 'split',
			type: 'POST',
			data: {loc: loc},
			dataType: 'text',
			success: function(){
				alert('성공');
			}
		});
	}
	
	var lat = $('#lat1').html();
	
	var lon = $('#lon1').html();
	
	var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid="+"c1ae780151cf0ef8cdce02451a0dcc70";
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
	    }
	});
})