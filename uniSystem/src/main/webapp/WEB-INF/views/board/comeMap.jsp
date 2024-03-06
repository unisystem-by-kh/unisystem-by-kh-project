<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNI-SYSTEM</title>

    <link rel="stylesheet" href="/resources/css/style-main.css">
    <link rel="stylesheet" href="/resources/css/board/comeMap.css">
    <script src="https://kit.fontawesome.com/9cd918496e.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="mainContainer">
            <div class="map-area" id="map"></div>
            <div class="info-area">
                <div>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F-6F</div>
                <div>TEL : 02-123-4657</div>
                <div>FAX : 02-123-4568</div>
                <div>지하철 2호선 역삼역 3번 출구 100M 도보 5분 거리 이내</div>
            </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    <script src="/resources/js/header.js"></script>

    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43c5f3622e2bed3749fb58b9abecd944&libraries=services"></script>
    <script>

        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(37.500108, 127.032729), // 좌표 설정
            level: 3 // 줌 레벨 설정
        };
        var map = new kakao.maps.Map(container, options);
        
        // 주소를 좌표로 변환하여 위치 설정
        var geocoder = new kakao.maps.services.Geocoder();
        var address = '서울특별시 강남구 테헤란로 14길 6';
        geocoder.addressSearch(address, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords,
                    title: address
                });
                map.setCenter(coords);
            }
        });

        var map;
        var directionsService;

        function initMap() {
            map = new kakao.maps.Map(document.getElementById('map'), {
                center: new kakao.maps.LatLng(37.500108, 127.032729),
                level: 3
            });
            directionsService = new kakao.maps.services.Directions();
        }



        var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

        // 클릭한 위치의 좌표를 주소로 변환하는 함수
        function getAddressFromCoords(coords, callback) {
            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }

        // 클릭 이벤트를 등록하여 인포윈도우를 엽니다
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
            getAddressFromCoords(mouseEvent.latLng, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var address = result[0].address.address_name;

                    // 인포윈도우에 표시될 내용을 설정합니다
                    var content = '<div class="info-window">' +
                                    '<div class="info-title">주소</div>' +
                                    '<div class="info-content"><a href="#" id="address-link">' + address + '</a></div>' +
                                '</div>';

                    // 인포윈도우를 생성하고 설정합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: content,
                        zIndex: 1,
                        removable: true
                    });

                    // 인포윈도우를 지도 위에 표시합니다
                    infowindow.setPosition(mouseEvent.latLng);
                    infowindow.open(map);

                    // 주소 클릭 시 해당 주소에 대한 검색을 수행합니다
                    document.getElementById('address-link').addEventListener('click', function(event) {
                        event.preventDefault();
                        // 주소에 대한 검색을 수행합니다
                        var searchQuery = address; // 검색할 주소
                        var searchURL = 'https://map.kakao.com/?q=' + encodeURIComponent(searchQuery);
                        window.open(searchURL, '_blank');
                    });

                    // 다른 곳을 클릭하면 인포윈도우가 닫히도록 설정합니다
                    kakao.maps.event.addListener(map, 'click', function() {
                        infowindow.close();
                    });
                }
            });
        });

        // JavaScript를 사용하여 border 스타일 삭제
        document.querySelector('.info-window').style.border = 'none';

        // 또는 display 속성을 변경하여 해당 요소를 숨김
        document.querySelector('.info-window').style.display = 'none';



    </script>

</body>
</html>