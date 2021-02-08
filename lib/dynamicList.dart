import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:loadmore/loadmore.dart';
import 'dart:convert';

class dynamicList extends StatefulWidget {
  @override
  dynamicListState createState() => dynamicListState();
}

class dynamicListState extends State<dynamicList> {


  ScrollController controller;
  Map valueMap ;
  List userData ;
  // int get count => userData.length;

  Future _getData() async {

    var dio = Dio();
   Response response = await dio.get('https://www.reddit.com/r/memes.json');

    if(response.statusCode == 200) {
      setState(() {
        valueMap = response.data['data'];
        userData = valueMap['children'];
        print(userData);
      });
    }

  }

  Future _getMoreData(String after) async {

    var dio = Dio();
    Response response = await dio.get('https://www.reddit.com/r/memes.json?after=${after}');

    if(response.statusCode == 200) {
      setState(() {
        valueMap = response.data['data'];
        userData = valueMap['children'];
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
              // isFinish: count >= 12,

              onLoadMore:  () => _loadMore(valueMap['after']),
              child: ListView.builder(
                controller: controller,
                itemCount: userData.length,
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
    return Card(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            leading: Image.network("${userData[index]["data"]["thumbnail"]}"),
            title: Text("${userData[index]["data"]["title"]}"),
            
            subtitle: Text('posted by/${userData[index]["data"]["author_fullname"]}'),
          ),

          Image.network("${userData[index]["data"]["url_overridden_by_dest"]}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('BUY TICKETS'),
                onPressed: () { /* ... */ },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('LISTEN'),
                onPressed: () { /* ... */ },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );

  }

  @override
  void initState() {


    _getData();
  }
  @override
  void dispose() {

    super.dispose();
  }


  Future<bool> _loadMore(String after) async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    setState(() {
      // pageNumber+=pageNumber;
      _getMoreData(after);
      print("done");
    });
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    userData.clear();
    _getData();
  }
}
