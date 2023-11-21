import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  // final Future<Position> currentLocation = _determinePosition();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NaverMap(
            options: const NaverMapViewOptions(
              initialCameraPosition: NCameraPosition(target: NLatLng(37.413294, 126.764166), zoom: 10, bearing: 0, tilt: 0),
            ),
            onMapReady: (controller) {
              print("네이버 맵 로딩됨!");
            },
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber.shade400, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade700),
                hintText: '검색할 장소를 입력하세요.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
