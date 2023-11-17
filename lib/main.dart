import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: 'n9cmbys95e');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          NaverMap(
            options: const NaverMapViewOptions(),
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
        ]),
      ),
    );
  }
}
