import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:loadmore/loadmore.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int pagenumber = 1;
  ScrollController controller;
  Map valueMap ;
  List userData ;
  int get count => userData.length;

  Future _getData(int pagenumber) async {

    var dio = Dio();
   Response response = await dio.get('https://reqres.in/api/users?page=$pagenumber');

    if(response.statusCode == 200) {
      setState(() {
        valueMap = response.data;

        userData = valueMap["data"];

      });
    }

  }

  Future _getMoreData(int pagenumber) async {

    var dio = Dio();
    Response response = await dio.get('https://reqres.in/api/users?page=$pagenumber');

    if(response.statusCode == 200) {
      setState(() {
        valueMap = response.data;
        userData.addAll(valueMap["data"]);
        print(userData);
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor:   Color(0xff212121),
        backgroundColor:   Colors.white,
        body: Container(
          child: RefreshIndicator(

            child: LoadMore(
              isFinish: count >= 12,

              onLoadMore:  () => _loadMore(pagenumber),
              child: ListView.builder(
                controller: controller,
                itemCount: count,
                padding: const EdgeInsets.all(5.5),
                // itemCount: userData == null ? 0 : userData.length,
                itemBuilder: _itemBuilder,

              ),

              whenEmptyLoad: false,
              delegate: DefaultLoadMoreDelegate(),
              textBuilder: DefaultLoadMoreTextBuilder.english,

            ),
            onRefresh: _refresh,

          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return InkWell(
      child:
         Container(
           child:  Card(
             color: Colors.blueAccent,
           child: Container(
             padding: EdgeInsets.all(5),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 CircleAvatar(
                   backgroundImage: NetworkImage("${userData[index]["avatar"]}",),
                   radius: 50,
                 ),
                 Column(
                   children: [
                     Container(
                       padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                       child: Text(
                         "${userData[index]["first_name"]} ${userData[index]["last_name"]}",
                         style: TextStyle(
                           fontWeight: FontWeight.w900,
                           color: Colors.white,
                         ),
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                       child: Text(
                         "${userData[index]["email"]} ",
                         style: TextStyle(
                           fontWeight: FontWeight.w500,
                           color: Colors.white,
                         ),
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
         ),
         ),
      onTap: null,
         );

  }

  @override
  void initState() {


    _getData(pagenumber);
  }
  @override
  void dispose() {

    super.dispose();
  }


  Future<bool> _loadMore(int pagenumber) async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    setState(() {
      pagenumber+=pagenumber;
      _getMoreData(pagenumber);
      print("done");
    });
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    userData.clear();
    _getData(pagenumber);
  }
}
