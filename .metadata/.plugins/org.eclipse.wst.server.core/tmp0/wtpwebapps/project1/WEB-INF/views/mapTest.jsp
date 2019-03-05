<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">

html { height : 100% }

body { height : 100%; margin: 3% 0% 0% 1.5%; padding: 0 }

#map_canvas { height : 100% }

</style>

<script type = "text/javascript"
src = "http://maps.googleapis.com/maps/api/js?sensor=true">
</script>
<script>
var map;

var infowindow = new google.maps.InfoWindow();

var marker =[];

var geocoder;

var geocodemarker = [];





var GreenIcon = new google.maps.MarkerImage(

   "http://labs.google.com/ridefinder/images/mm_20_green.png",

   new google.maps.Size(12, 20),

   new google.maps.Point(0, 0),

   new google.maps.Point(6, 20));

// ��� ��Ŀ �������� �����ϴ� �κ�



function initialize(){



var latlng = new google.maps.LatLng(37.5240220, 126.9265940);

var myOptions = {

zoom: 10,

center:latlng,

mapTypeId: google.maps.MapTypeId.ROADMAP

};


map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

geocoder =  new google.maps.Geocoder();

google.maps.event.addListener(map, 'click', codeCoordinate);

        /*�Ʒ��ۿ��� ������ event�� �̿� ������ 'click'�ϸ� codeCoordinate�Լ��� �����մϴ�.

           codeCoordinate�Լ��� Ŭ���� ������ ��ǥ�� ������ �ּҸ� ã�� �Լ��Դϴ�. */

}



function Setmarker(latLng) {

     

if (marker.length > 0)

        {

marker[0].setMap(null);

}

// marker.length�� marker��� �迭�� ������ �����Դϴ�.

// ���� �� ������ 0�� �ƴ϶�� marker�� map�� ǥ�õ��� �ʰ� �մϴ�.

// �̴� �ٸ� ������ Ŭ���� �� ������ ��Ŀ�� �����ϱ� �����Դϴ�.



marker = [];

marker.length = 0;

// marker�� �� �迭�� �����, marker �迭�� ������ 0���� ����� marker �迭�� �ʱ�ȭ�մ�

// ��.



  marker.push(new google.maps.Marker({

position: latLng,

map: map

} ));

// marker �迭�� �� marker object�� push �Լ��� �߰��մϴ�.



}

/*Ŭ���� ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�.

   �׷��� �� �Լ��� �� ���� �ϴ� ���� �ٷ� marker�� �������� �ʰ� marker��� �迭 �ȿ� Marker 

   obejct  ���Ҹ� ��� �߰��ϰ� �ֽ��ϴ�. �̴� �Ź� Ŭ���� ������ ���ο� ��Ŀ�� �����ϱ� �����Դ�

   ��. */



//�Է� ���� �ּҸ� �����ڵ� ��û�ϰ� ����� ��Ŀ�� ������ ǥ���մϴ�.

function codeAddress(event) {



if (geocodemarker.length > 0)

{

for (var i=0;i<geocodemarker.length ;i++ )

{

geocodemarker[i].setMap(null);

}

geocodemarker =[];

geocodemarker.length = 0;

}

        //�� �κе� ���� ���� �ּҸ� �Է��� �� ǥ�õǴ� marker�� �Ź� ���� ��Ÿ���� �ϱ� �����Դ�

        //��.



var address = document.getElementById("addr1").value;

        //�Ʒ��� �ּ� �Է�â���� ���� ������ address ������ �����մϴ�.



        //�����ڵ��ϴ� �κ��Դϴ�.

geocoder.geocode( {'address': address}, function(results, status) {

if (status == google.maps.GeocoderStatus.OK)  //Geocoding�� �������̶��,

{

alert(results.length + "���� ����� ã�ҽ��ϴ�.");

   //����� ������ ǥ���ϴ� â�� ���ϴ�. alert �Լ��� �˸�â �Լ��Դϴ�.

for(var i=0;i<results.length;i++)

{

map.setCenter(results[i].geometry.location);

geocodemarker.push(new google.maps.Marker({

center: results[i].geometry.location,

position: results[i].geometry.location,

icon: GreenIcon,

map: map

}));

} 

                        //����� ���� ���� �� �ֱ� ������ ��� ����� ������ marker�� ǥ���մϴ�.

}

else

{ alert("Geocode was not successful for the following reason: " + status); 

}

});

}





//Ŭ�� �̺�Ʈ �߻� �� �� ��ǥ�� �ּҷ� ��ȯ�ϴ� �Լ��Դϴ�.

function codeCoordinate(event) {

        

Setmarker(event.latLng);

        //�̺�Ʈ �߻� �� �� ��ǥ�� ��Ŀ�� �����մϴ�.



        // ��ǥ�� �޾� reverse geocoding(��ǥ�� �ּҷ� �ٲٱ�)�� �����մϴ�.

geocoder.geocode({'latLng' : event.latLng}, function(results, status) {

if (status == google.maps.GeocoderStatus.OK)  {

if (results[1])

{

infowindow.setContent(results[1].formatted_address);
infowindow.open(map,marker[0]);
                                //infowindow�� �ּҸ� ǥ���մϴ�.
}
}
});
}
</script>
</head>
<body onload="initialize()">

<div id="map_canvas" style="width:80%; height:60%"></div>

<p> �ּ� : <input type="text" size="100" id="addr1" name="address"/>  <input name="submit" type="submit" value="Search" onclick='codeAddress(); return false;' /> </p>

<!-- �Է¹޴� �κ��� ���� �ּҸ� �Է¹ް�, ��ư�� ������ codeAddress() �Լ��� �����ϴ� �κ��Դϴ�. -->

<!-- <input type="text"�� �ؽ�Ʈ �Է��� <input type="submut"�� ��ư �Է��� �ǹ��մϴ�. -->

<!-- <p>�� </p> ���̿� �ִ� �κ��� �� ������ �����մϴ�. -->

<br>
</body>
</html>