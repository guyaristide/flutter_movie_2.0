import 'package:flutter/material.dart';

class Cinet {
  String title;
  List<String> genders;
  String cover;
  int star;

  Cinet(this.title, this.genders, this.cover, this.star);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Sample 1',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Animation Sample 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  List<Cinet> cinets = [];

  PageController _pageController;

  int currentPage = 0;

  bool _pageScrolled = false;

  @override
  void initState() {
    // TODO: implement initState

    _animationController = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _pageController = new PageController(initialPage: 0, viewportFraction: 0.8);
    cinets.add(new Cinet(
        "Joker",
        [
          "Action",
          "Drame",
        ],
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ0aWlrS1smAlmWpLaFXpkT599hW_320r6Uw4sKQxdnSckOYE0u&usqp=CAU",
        9));
    cinets.add(new Cinet(
        "BAD BOY",
        [
          "Action",
          "Drame",
        ],
        "https://fr.web.img6.acsta.net/pictures/19/11/22/09/44/3027567.jpg",
        9));
    cinets.add(new Cinet(
        "The girl next door",
        [
          "Romantic",
          "Commic",
        ],
        "https://www.1zoom.me/big2/59/157358-frederika.jpg",
        9));
    cinets.add(new Cinet(
        "Joker",
        [
          "Action",
          "Drame",
        ],
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ0aWlrS1smAlmWpLaFXpkT599hW_320r6Uw4sKQxdnSckOYE0u&usqp=CAU",
        9));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.white],
                ),
                image: DecorationImage(
                  image: NetworkImage("${cinets[currentPage].cover}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0), Colors.white],
              )),
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
          ),
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (currentPage) {
              setState(() {
                _pageScrolled = true;
                this.currentPage = currentPage;
                print("-------- LOG BEGIN-------");
                print("_pageController");
                print(_pageController.page);

                print("-------- currentPage -------");
                print(currentPage);

                print("-------- LOG END -------");
              });
            },
            itemBuilder: (context, index) => AnimatedBuilder(
              animation: _animationController,
              child: _movieItem(context, cinets[index]),
              builder: (context, child) {
                if (_pageScrolled) {}
                //print(_pageController.page);
                var addedHeight = 100 *
                    ((_pageScrolled && currentPage == index) ||
                            (currentPage == 0 && currentPage == index)
                        ? 1
                        : 0);
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 3 * MediaQuery.of(context).size.width / 4,
                    height: 3 * MediaQuery.of(context).size.height / 4 +
                        addedHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    padding: EdgeInsets.all(20),
                    child: child,
                  ),
                );
              },
            ),
            itemCount: cinets.length,
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

  Column _movieItem(BuildContext context, Cinet c) {
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
              image: NetworkImage("${c.cover}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "${c.title}",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ...c.genders.map((a) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  border: Border.all(color: Colors.black54),
                ),
                child: Text("${a}"),
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
              "${c.star}.0 ",
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
    _animationController.dispose();
    super.dispose();
  }
}
