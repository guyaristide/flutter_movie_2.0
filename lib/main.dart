import 'package:flutter/material.dart';
import 'package:flutteranimationssample/models/movie.dart';
import 'package:flutteranimationssample/pages/movie_detail_page.dart';
import 'package:flutteranimationssample/pages/movie_list_page.dart';

List<Movie> moviesList = [
  new Movie(
      "BAD BOY",
      [
        "Action",
        "Drame",
      ],
      "https://fr.web.img6.acsta.net/pictures/19/11/22/09/44/3027567.jpg",
      9),
  new Movie(
      "Joker",
      [
        "Action",
        "Drame",
      ],
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ0aWlrS1smAlmWpLaFXpkT599hW_320r6Uw4sKQxdnSckOYE0u&usqp=CAU",
      9),
  new Movie(
      "The girl next door",
      [
        "Romantic",
        "Commic",
      ],
      "https://www.1zoom.me/big2/59/157358-frederika.jpg",
      9),
/*new Movie(
          "Joker",
          [
            "Action",
            "Drame",
          ],
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ0aWlrS1smAlmWpLaFXpkT599hW_320r6Uw4sKQxdnSckOYE0u&usqp=CAU",
          9),*/
];

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
      home: MovieListPage(),
    );
  }
}
