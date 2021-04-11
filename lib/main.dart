import 'package:flutter/material.dart';
import 'package:flutter_test_project/widgets/Feed.dart';
import 'package:flutter_test_project/widgets/Post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          backgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu_open_rounded,
            color: Colors.black,
          ),
        ),
        title: Text("Star"),
        elevation: 1.0,
        bottom: PreferredSize(
          child: Container(color: Colors.grey[400], height: 0.0),
          preferredSize: Size.fromHeight(4.0),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
              onPressed: null),
        ],
      ),
      body: Stack(
        children: [
          Feed(),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 60,
              child: Stack(children: [
                CustomPaint(
                  size: Size(size.width, 60),
                  painter: MenuPainter(),
                ),
                Center(
                  heightFactor: 0.6,
                  child: FloatingActionButton(
                      backgroundColor: Colors.pink,
                      child: Icon(Icons.add),
                      elevation: 0.1,
                      onPressed: () {}),
                ),
                Container(
                  width: size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.home,
                          color: currentIndex == 0
                              ? Colors.pink
                              : Colors.grey.shade400,
                        ),
                        onPressed: () {
                          setBottomBarIndex(0);
                        },
                        splashColor: Colors.white,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.search,
                            color: currentIndex == 1
                                ? Colors.pink
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(1);
                          }),
                      Container(
                        width: size.width * 0.20,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: currentIndex == 2
                                ? Colors.pink
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.account_circle,
                            color: currentIndex == 3
                                ? Colors.pink
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(3);
                          }),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.35, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
