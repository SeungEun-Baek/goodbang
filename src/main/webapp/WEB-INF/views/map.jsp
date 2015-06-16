<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<title>Good Bang</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- JQuery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<style type="text/css">
html, body, #root-container {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
	background-color: silver;
}

#map-container {
	height: 80%;
	margin: 0;
	padding: 0;
	-webkit-perspective: 800px;
	-moz-perspective: 800px;
	-o-perspective: 800px;
	perspective: 800px;
}

#flip-container {
	height: 100%;
	width: 100%;
	position: absolute;
	margin: 0;
	padding: 0;
	-webkit-transition: -webkit-transform 0.5s;
	-moz-transition: -moz-transform 0.5s;
	-o-transition: -o-transform 0.5s;
	transition: transform 0.5s;
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	-o-transform-style: preserve-3d;
	transform-style: preserve-3d;
	-webkit-transform-origin: right center;
	-moz-transform-origin: right center;
	-o-transform-origin: right center;
	transform-origin: right center;
}

#flip-container.flipped {
	-webkit-transform: translateX(-100%) rotateY(-180deg);
	-moz-transform: translateX(-100%) rotateY(-180deg);
	-o-transform: translateX(-100%) rotateY(-180deg);
	transform: translateX(-100%) rotateY(-180deg);
}

#front-container {
	height: 100%;
	width: 100%;
	position: absolute;
	margin: 0;
	padding: 0;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	backface-visibility: hidden;
}

#back-container {
	height: 100%;
	width: 100%;
	position: absolute;
	margin: 0;
	padding: 0;
	background-color: white;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	backface-visibility: hidden;
	-webkit-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
	-o-transform: rotateY(180deg);
	transform: rotateY(180deg);
}

#input-form-container {
	height: 100%;
	width: 100%;
	position: absolute;
	margin: 0;
	padding: 5%;
	overflow: auto;
}

#list-container {
	height: 20%;
	background-color: lime;
}

#input-button-container, #map-button-container {
	position: fixed;
	right: 30px;
	bottom: 30px;
}

#map-canvas {
	height: 100%;
}

input[type=number] {
	text-align: right;
}
</style>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7EhkrRElzup1DjiaNZlHakWyPw7X5LuM">
	
</script>
<script type="text/javascript">
	var map;
	var myLatlng = new google.maps.LatLng(37.484910, 126.897239);

	var neighborhoods = [ new google.maps.LatLng(37.486030, 126.893921),
			new google.maps.LatLng(37.484349, 126.895444),
			new google.maps.LatLng(37.485196, 126.898244),
			new google.maps.LatLng(37.486702, 126.898952),
			new google.maps.LatLng(37.485802, 126.898952),
			new google.maps.LatLng(37.486902, 126.898952),

	];

	var markers = [];

	function initialize() {
		var mapOptions = {
			center : myLatlng,
			zoom : 16
		};
		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		var marker = new google.maps.Marker({
			position : myLatlng,
			map : map,
			animation : google.maps.Animation.DROP,
		});
		drop();
	}

	function drop() {
		clearMarkers();
		for (var i = 0; i < neighborhoods.length; i++) {
			window.setTimeout(function() {
				addMarker(neighborhoods[--i]);
			}, i * 200);
		}
		iterator = 0;
	}

	function addMarker(position) {
		markers.push(new google.maps.Marker({
			position : position,
			map : map,
			animation : google.maps.Animation.DROP
		}));
	}

	function clearMarkers() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
	<div id="root-container">

		<div id="map-container">
			<div id="flip-container">
				<div id="front-container">
					<div id="map-canvas"></div>
					<div id="input-button-container">
						<button id="input-button" type="button"
							class="btn btn-primary btn-lg" aria-label="To Input Form">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						</button>
					</div>
				</div>
				<div id="back-container">
					<div id="input-form-container">
						<form:form commandName="room" cssClass="form-horizontal">
							<div class="form-group">
								<label for="subject" class="col-sm-2 control-label">Subject
								</label>
								<div class="col-sm-8">
									<form:input path="subject" cssClass="form-control" id="subject"
										placeholder="Subject" />
								</div>
							</div>

							<div class="form-group">
								<label for="latitude" class="col-sm-2 control-label">Latitude</label>
								<div class="col-sm-3">
									<form:input path="latitude" type="number" class="form-control"
										id="latitude" placeholder="Latitude" />
								</div>
								<label for="longitude" class="col-sm-2 control-label">Longitude</label>
								<div class="col-sm-3">
									<form:input path="longitude" type="number" class="form-control"
										id="longitude" placeholder="Longitude" />
								</div>
							</div>
							<div class="form-group">
								<label for="deposit" class="col-sm-2 control-label">Deposit</label>
								<div class="col-sm-3">
									<div class="input-group">
										<form:input path="deposit" type="number" class="form-control"
											id="deposit" placeholder="Deposit" />
										<div class="input-group-addon">만원</div>
									</div>
								</div>
								<label for="monthlyRent" class="col-sm-2 control-label">Monthly
									Rent</label>
								<div class="col-sm-3">
									<div class="input-group">
										<form:input path="monthlyRent" type="number"
											class="form-control" id="monthlyRent"
											placeholder="Monthly Rent" />
										<div class="input-group-addon">만원</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="managementExpenses" class="col-sm-2 control-label">관리비</label>
								<div class="col-sm-3">
									<div class="input-group">
										<form:input path="managementExpenses" type="number"
											class="form-control" id="managementExpenses" />
										<div class="input-group-addon">만원</div>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="shape" class="col-sm-2 control-label">Shape
								</label>
								<div class="col-sm-8">
									<form:select path="shape" cssClass="form-control" id="shape">
										<form:option value="oneRoomOpened" label="원룸(오픈형)" />
										<form:option value="oneRoomSeparated" label="원룸(분리형)" />
										<form:option value="oneRoomDuplexed" label="원룸(복층형)" />
										<form:option value="twoRoom" label="투룸" />
										<form:option value="threeRoom" label="쓰리룸" />
									</form:select>
								</div>
							</div>

							<div class="form-group">
								<label for="buildingType" class="col-sm-2 control-label">Building
									Type </label>
								<div class="col-sm-8">
									<form:select path="buildingType" cssClass="form-control"
										id="buildingType">
										<form:option value="multiplexHouse" label="다세대/다가구" />
										<form:option value="officetel" label="오피스텔" />
										<form:option value="apartment" label="아파트" />
									</form:select>
								</div>
							</div>

							<div class="form-group">
								<label for="floor" class="col-sm-2 control-label">Floor</label>
								<div class="col-sm-3">
									<div class="input-group">
										<form:input path="floor" type="number" class="form-control"
											id="floor" />
										<div class="input-group-addon">층</div>
									</div>
								</div>
								<label for="topFloor" class="col-sm-2 control-label">Top
									Floor</label>
								<div class="col-sm-3">
									<div class="input-group">
										<form:input path="topFloor" type="number" class="form-control"
											id="topFloor" />
										<div class="input-group-addon">층</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="" class="col-sm-2 control-label">관리비 포함항목</label>
								<div class="checkbox col-sm-8">
									<label class="checkbox-inline"> <form:checkbox
											path="managementServices" id="option1" value="수도" />수도
									</label> <label class="checkbox-inline"> <form:checkbox
											path="managementServices" id="option2" value="TV" />TV
									</label> <label class="checkbox-inline"> <form:checkbox
											path="managementServices" id="option5" value="인터넷" />인터넷
									</label> <label class="checkbox-inline"> <form:checkbox
											path="managementServices" id="option3" value="전기" />전기
									</label> <label class="checkbox-inline"> <form:checkbox
											path="managementServices" id="option4" value="가스" />가스
									</label> <label class="checkbox-inline"> <form:checkbox
											path="managementServices" id="option6" value="주차" />주차
									</label>
								</div>
							</div>

							<div class="form-group">
								<label for="dimensions" class="col-sm-2 control-label">크기</label>
								<div class="col-sm-3">
									<div class="input-group">
										<div class="input-group-addon">전용면적</div>
										<form:input path="dimensions" type="number"
											class="form-control" id="dimensions" />
										<div class="input-group-addon">
											m<sup>2</sup>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="" class="col-sm-2 control-label">주차</label>
								<div class="checkbox col-sm-3">
									<label class="checkbox-inline"> <form:checkbox
											path="parking" id="parking" />
									</label>
								</div>

								<label for="" class="col-sm-2 control-label">엘리베이터</label>
								<div class="checkbox col-sm-3">
									<label class="checkbox-inline"> <form:checkbox
											path="elevator" id="elevator" />
									</label>
								</div>
							</div>

							<div class="form-group">
								<label for="" class="col-sm-2 control-label">옵션</label>
								<div class="checkbox col-sm-3">
									<label class="checkbox-inline"> <form:checkbox
											path="options" id="option1" value="싱크대" />싱크대
									</label> <label class="checkbox-inline"> <form:checkbox
											path="options" id="option2" value="책장" />책장
									</label> <label class="checkbox-inline"> <form:checkbox
											path="options" id="option5" value="에어컨" />에어컨
									</label> <label class="checkbox-inline"> <form:checkbox
											path="options" id="option3" value="인덕션" />인덕션
									</label> <label class="checkbox-inline"> <form:checkbox
											path="options" id="option4" value="침대" />침대
									</label> <label class="checkbox-inline"> <form:checkbox
											path="options" id="option6" value="냉장고" />냉장고
									</label> <label class="checkbox-inline"> <form:checkbox
											path="options" id="option6" value="전자레인지" />전자레인지
									</label> <label class="checkbox-inline"> <form:checkbox
											path="options" id="option6" value="옷장" />옷장
									</label> <label class="checkbox-inline"> <form:checkbox
											path="options" id="option6" value="세탁기" />세탁기
									</label> <label class="checkbox-inline"> <form:checkbox
											path="options" id="option6" value="책상" />책상
									</label> <label class="checkbox-inline"> <form:checkbox
											path="options" id="option6" value="신발장" />신발장
									</label>
								</div>
							</div>

							<div class="form-group">
								<label for="movingDate" class="col-sm-2 control-label">입주가능일
								</label>
								<div class="col-sm-8">
									<form:input path="movingDate" cssClass="form-control"
										id="movingDate" placeholder="즉시입주 / 날짜협의 / 2015년 12월 31일" />
								</div>
							</div>

							<div class="form-group">
								<label for="address" class="col-sm-2 control-label">주소 </label>
								<div class="col-sm-8">
									<form:input path="address" cssClass="form-control" id="address"
										placeholder="서울시 강남구 역삼동" />
								</div>
							</div>

							<div class="form-group">
								<label for="description" class="col-sm-2 control-label">상세설명
								</label>
								<div class="col-sm-8">
									<form:textarea path="description" rows="10"
										cssClass="form-control" id="description" placeholder="상세설명" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="exampleInputFile" class="col-sm-2 control-label">사진</label>
								<div class="col-sm-8">
									<input type="file" id="exampleInputFile" multiple="multiple">
									<p class="help-block">Example block-level help text here.</p>
								</div>
							</div>

							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">등록</button>
							</div>

							<!-- end of room property form -->

						</form:form>
					</div>
					<div id="map-button-container">
						<button id="map-button" type="button"
							class="btn btn-primary btn-lg" aria-label="To Map">
							<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
						</button>
					</div>
				</div>
			</div>
			<div id="list-container">
				<div id="inner-list-container">
					<p>
						<button id="flip-button1">click1</button>
					</p>
					<p>
						<button id="flip-button2">click2</button>
					</p>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("#flip-container").removeClass("flipped");
			$("#front-container").css("z-index", "1");
			$("#flip-container").addClass("flipped");
			$("#back-container").css("z-index", "1");

			$("#input-button").click(function() {
				$("#flip-container").addClass("flipped");
				$("#back-container").css("z-index", "1");
			});
			$("#flip-button1").click(function() {
				$("#flip-container").addClass("flipped");
				$("#back-container").css("z-index", "1");
			});
			$("#map-button").click(function() {
				$("#flip-container").removeClass("flipped");
				$("#front-container").css("z-index", "1");
			});
			$("#flip-button2").click(function() {
				$("#flip-container").removeClass("flipped");
				$("#front-container").css("z-index", "1");
			});
		});
	</script>
</body>
</html>
