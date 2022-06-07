import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:appsample/category.dart';
import 'package:appsample/search.dart';
import 'package:appsample/cameraPage.dart';
import 'package:appsample/myPage.dart';

final dummyItems = [
  'assets/beready.jpeg',
  'assets/eyebrow.jpeg',
  'assets/lee.jpeg',
  'assets/lipstick.jpeg',
  'assets/lipstick2.jpeg',
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme:
            GoogleFonts.notoSansNKoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  var _bottomPage = [category(), search(), cameraPage(), mainPage(), myPage()];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //as
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: _bottomPage[_index],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        height: 50,
        backgroundColor: Colors.pinkAccent[100],
        activeColor: Colors.pinkAccent[100],
        color: Colors.white,
        items: [
          TabItem(
              activeIcon: Icon(
                CupertinoIcons.list_bullet,
                color: Colors.white,
                size: 30,
              ),
              icon: Icon(
                CupertinoIcons.list_bullet,
                color: Colors.white,
                size: 20,
              ),
              title: '카테고리'),
          TabItem(
              activeIcon: Icon(
                CupertinoIcons.search,
                color: Colors.white,
                size: 30,
              ),
              icon: Icon(
                CupertinoIcons.search,
                color: Colors.white,
                size: 20,
              ),
              title: '검색'),
          TabItem(
              activeIcon: Icon(
                CupertinoIcons.bag,
                color: Colors.white,
                size: 30,
              ),
              icon: Icon(
                CupertinoIcons.bag,
                color: Colors.white,
                size: 20,
              ),
              title: '카메라'),
          TabItem(
              activeIcon: Icon(
                CupertinoIcons.home,
                color: Colors.white,
                size: 30,
              ),
              icon: Icon(
                CupertinoIcons.home,
                color: Colors.white,
                size: 20,
              ),
              title: '홈'),
          TabItem(
              activeIcon: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
                size: 30,
              ),
              icon: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
                size: 20,
              ),
              title: '마이페이지'),
        ],
      ),
    );
  }
}

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          MainTop(),
          MainMiddle(),
          MainBottom()
        ],
      ),
    );
  }

  @override
  Widget MainTop() {
    String name = 'jaeyeon';
    return Column(
      children: <Widget>[
        Text(
          '${name}님,',
          style: TextStyle(fontSize: 40),
        ),
        Text(
          '안녕하세요!',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

  @override
  Widget MainMiddle() {
    return CarouselSlider(
      options: CarouselOptions(height: 400.0, autoPlay: true), //높이 400
      items: dummyItems.map((url) {
        //5페이지
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context)
                    .size
                    .width, //context를 사용하고자 할 때, 기기의 가로 길이
                margin: EdgeInsets.symmetric(horizontal: 5.0), //좌우여백 5
                decoration: const BoxDecoration(color: Colors.white //배경색
                    ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    url,
                    fit: BoxFit.cover,
                  ),
                ));
          },
        );
      }).toList(),
    );
  }

  @override
  Widget MainBottom() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: Column(
            children: <Widget>[
              Text(
                '\'화장품을 직접 써보지 않고\'',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '구매해도 괜찮다고?',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          curve: Curves.easeInOut,
        ),
        SizedBox(
          height: 80,
        ),
        Text(
          '그 이유 확인하기',
          style: TextStyle(fontSize: 20),
        ),
        Icon(
          CupertinoIcons.arrow_down,
          size: 200,
          color: Colors.lightBlue[200],
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
