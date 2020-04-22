import 'package:flutter/material.dart';
import 'package:flutteranimationssample/pages/movie_detail_page.dart';
import 'package:flutteranimationssample/pages/movie_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Sample 1',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieDetailPage(),
    );
  }
}

