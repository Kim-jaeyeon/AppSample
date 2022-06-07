import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class category extends StatelessWidget {
  const category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[categryTop(), categoryMiddle(),categoryBottom(context)],
    ),
    );
  }

  @override
  Widget categryTop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: Colors.pinkAccent,
                blurRadius: 20.0,
                spreadRadius: 2.0,
                offset: Offset(0,5)
              )],
              color: Colors.pinkAccent[100],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(120)),
            ),
            width: 500,
            height: 200,
            child: Center(
                child: Text('상품목록',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center))),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }

  @override
  Widget categoryMiddle() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Icon(CupertinoIcons.hand_thumbsup_fill,size:45,color: Colors.lightBlue[200],),
                  Text('베스트 상품',style: TextStyle(fontSize:15),),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Icon(CupertinoIcons.tickets,size:50,color: Colors.lightBlue[200],),
                  Text('타임세일',style: TextStyle(fontSize:15),),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Icon(CupertinoIcons.sun_dust,size:50,color: Colors.lightBlue[200],),
                  Text('썬크림',style: TextStyle(fontSize:15),),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Icon(CupertinoIcons.eye,size:50,color: Colors.lightBlue[200],),
                  Text('눈',style: TextStyle(fontSize:15),),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Icon(CupertinoIcons.lab_flask_solid,size:50,color: Colors.lightBlue[200],),
                  Text('얼굴',style: TextStyle(fontSize:15),),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Icon(CupertinoIcons.ear,size:50,color: Colors.lightBlue[200],),
                  Text('악세서리',style: TextStyle(fontSize:15),),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget categoryBottom(BuildContext context){
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

}
