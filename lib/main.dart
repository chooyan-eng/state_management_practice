import 'package:flutter/material.dart';
import 'package:state_management_practice/articles_page.dart';
import 'package:state_management_practice/articles_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ArticlesProvider(
      child: MaterialApp(
        home: ArticlesPage(),
      ),
    );
  }
}
