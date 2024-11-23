import 'package:cat_app/pages/pages.dart';
import 'package:cat_app/provider/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider.value(
    value: CatProvider(),
    child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Colors.white)
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/details': (_) => const DetailPage()
      },
    );
  }
}
