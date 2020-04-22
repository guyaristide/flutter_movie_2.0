import 'package:flutter/material.dart';
import 'package:flutteranimationssample/main.dart';
import 'package:flutteranimationssample/models/movie.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<Movie> movies = [];

  PageController _pageController;
  PageController _backgroundController;

  int currentPage = 0;

  bool _pageScrolled = false;

  _onMainScroll() {
    _backgroundController.animateTo(_pageController.offset / 0.8,
        duration: Duration(milliseconds: 1), curve: Curves.decelerate);
  }

  @override
  void initState() {
    _pageController = new PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(_onMainScroll);
    _backgroundController =
        new PageController(initialPage: 0, viewportFraction: 1);

    movies = [
      new Movie(
          "Joker",
          [
            "Action",
            "Drame",
          ],
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ0aWlrS1smAlmWpLaFXpkT599hW_320r6Uw4sKQxdnSckOYE0u&usqp=CAU",
          9),
      new Movie(
          "BAD BOY",
          [
            "Action",
            "Drame",
          ],
          "https://fr.web.img6.acsta.net/pictures/19/11/22/09/44/3027567.jpg",
          9),
      new Movie(
          "The girl next door",
          [
            "Romantic",
            "Commic",
          ],
          "https://www.1zoom.me/big2/59/157358-frederika.jpg",
          9),
      new Movie(
          "Joker",
          [
            "Action",
            "Drame",
          ],
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ0aWlrS1smAlmWpLaFXpkT599hW_320r6Uw4sKQxdnSckOYE0u&usqp=CAU",
          9),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            reverse: true,
            controller: _backgroundController,
            itemBuilder: (context, index) => AnimatedBuilder(
              animation: _backgroundController,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "${movies[index].cover}",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              builder: (BuildContext context, Widget child) {
                return child;
              },
            ),
            itemCount: movies.length,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0), Colors.white],
              ),
            ),
          ),
          Positioned(
            top: 40,
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
          ) ,
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (currentPage) {
              setState(() {
                _pageScrolled = true;
                this.currentPage = currentPage;
              });
            },
            itemBuilder: (context, index) => AnimatedBuilder(
              animation: _pageController,
              child: _movieItem(context, movies[index]),
              builder: (context, child) {
                if (_pageScrolled) {}
                //print(_pageController.page);
                var result =
                    _pageScrolled ? _pageController.page : currentPage * 1.0;
                /* var value = ((_pageScrolled && currentPage == index) ||
                        (currentPage == 0 && currentPage == index)
                    ? 1.0
                    : 0.0) as double;*/

                var value = result - index;
                value = (1 - (value.abs() * .5)).clamp(0.0, 1.0) as double;

                double addedHeight = 100.0;
                //setState(() {});
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 3 * MediaQuery.of(context).size.width / 4,
                    height: (Curves.easeOut.transform(value) * addedHeight) +
                        4 * MediaQuery.of(context).size.height / 6,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                      ),
                      padding: EdgeInsets.all(20),
                      child: child,
                    ),
                  ),
                );
              },
            ),
            itemCount: movies.length,
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
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Column _movieItem(BuildContext context, Movie movie) {
    return Column(
      children: <Widget>[
        Container(
          width: 3 * MediaQuery.of(context).size.width / 4,
          height: 3 * MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            image: DecorationImage(
              image: NetworkImage("${movie.cover}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "${movie.title}",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ...movie.genders.map((gender) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  border: Border.all(color: Colors.black54),
                ),
                child: Text("${gender}"),
              );
            }).toList()
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${movie.star}.0 ",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.more_horiz,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _backgroundController.dispose();
  }
}
