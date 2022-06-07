import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:appsample/category.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final _searchTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(_printLatestValue);
  }
  _printLatestValue() {
    print('search_text field: ${_searchTextController.text}');
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: TextFormField(
              decoration: InputDecoration(hintText: '검색어를 입력해주세요'),
              controller: _searchTextController,
              validator: (value){
                if(value.toString().trim().isEmpty){
                  return '검색어를 1글자 이상 입력해주세요!';
                }
                else{
                  return "!!!!!";
                }

              },
            ),
          ),
        ),
      ],
    ));
  }
}
