import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bonniemap/screens/main_screen.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  String? apiKey = dotenv.env['KAKAO_MAP_API_KEY'];
  WidgetsFlutterBinding.ensureInitialized();
  AuthRepository.initialize(appKey: apiKey!);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
