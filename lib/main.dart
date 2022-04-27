import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_flutter/widgets/factHistoryPage/factHistory.dart';
import 'package:test_flutter/widgets/myHomePage/myHomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tз',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
      routes: {
        'main': (context) => const MyHomePage(),
        'main/history': (context) => const FactHistoryWidget(),
      },
      initialRoute: 'main',
    );
  }
}
