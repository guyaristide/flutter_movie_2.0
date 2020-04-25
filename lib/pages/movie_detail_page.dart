import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutteranimationssample/models/movie.dart';
import 'package:flutteranimationssample/main.dart';

class MovieDetailPage extends StatefulWidget {
  Movie movie;
  final int movieIndex;

  MovieDetailPage(this.movieIndex, {Key key}) : super(key: key) {
    movie = moviesList[movieIndex];
  }

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  List<Movie> movies = moviesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.adjust,
                  color: Colors.white,
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Hero(
                      tag:
                          "${widget.movieIndex > 0 ? moviesList[widget.movieIndex - 1].title : moviesList[moviesList.length - 1].title}",
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Image.network(
                            "${widget.movieIndex > 0 ? moviesList[widget.movieIndex - 1].cover : moviesList[moviesList.length - 1].cover}",
                            width: 200,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                      tag:
                          "${widget.movieIndex < moviesList.length - 1 ? moviesList[widget.movieIndex + 1].title : moviesList[0].title}",
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Image.network(
                          "${widget.movieIndex < moviesList.length - 1 ? moviesList[widget.movieIndex + 1].cover : moviesList[0].cover}",
                          width: 200,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: "${widget.movie.title}",
                      child: Image.network(
                        "${widget.movie.cover}",
                        width: 200,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Joker",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                  border: Border.all(color: Colors.black54),
                                ),
                                child: Text("Action"),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                  border: Border.all(color: Colors.black54),
                                ),
                                child: Text("Drama"),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                  border: Border.all(color: Colors.black54),
                                ),
                                child: Text("History"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "9.0 ",
                                style: TextStyle(fontSize: 19),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.deepOrange,
                              ),
                              Icon(Icons.star_border),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Director / Todd Phillips",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Actors",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Image.asset(
                                    "images/niro.jpg",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Robert De Niro",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Image.asset(
                                    "images/niro.jpg",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Robert De Niro",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Image.asset(
                                    "images/niro.jpg",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Robert De Niro",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Introduction",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ante massa, dictum ac ante quis, viverra bibendum ligula. Fusce porta, mauris non maximus laoreet, ipsum risus feugiat metus, pretium consectetur dui metus at lorem. Praesent eget imperdiet turpis. Ut tincidunt ut elit convallis vehicula. Quisque facilisis, augue et blandit vulputate, magna nibh pharetra enim",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 50,
                    right: 50,
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      child: FlatButton(
                        child: Text(
                          "BUY TICKET",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  /*Positioned(
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.adjust,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
