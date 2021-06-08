import 'package:bhakti/BottomNavBar.dart';
import 'package:bhakti/bhajanlist.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class MusicList extends StatefulWidget {
  final String name;
  MusicList({this.name});

  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {

Map data ={};
  String name;

  List<String> list = new List();
List<String> list2 = new List();

double deviceHeight;
double deviceWidth;


BottomNavBar bar ;

var myFunc;

@override
  void initState() {
    this.name = widget.name;
    super.initState();
    bar = BottomNavBar();
    fetchAllData(context);
  }

  Future<void> fetchData(context) async {
    print("Function call main");

    final manifestJson = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    print(manifestJson);
    int pos;
    int dotPos;
    String result;


    print(json.decode(manifestJson).keys);
    final images = json.decode(manifestJson).keys.where((String key) => key.startsWith('assets/bhajans/${this.name}/'));

    images.forEach((key) {
      print("$key");

      if (key.toString().startsWith('assets/bhajans/${this.name}/')) {
        pos = key.lastIndexOf("/");
        dotPos = key.lastIndexOf(".");
        result = (pos != -1) ? key.substring(pos+1,dotPos) : key;
        print(result);
        list2.add(result);
      }
    });

    this.setState(() {
      this.list = list2;
    });
  }

  Future<void> fetchAllData(context) async {
    print("Function call");
    await fetchData(context);
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    name = data['name'].toString().toLowerCase();
    bar = data['bar'];
    myFunc = data['myFunc'];
    print(name);

    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          title: Text("BHAKTI APP", style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true, elevation: 3.00, shadowColor: Colors.grey),
      body: Builder(
        builder: (context) => Center(
          child: Container(
            width: deviceWidth *0.99,
              margin: EdgeInsets.only(right: 0.0),
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
              child: BhajanList(
                name: name,
                list: list,
                myFunc : myFunc
              )),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {},
      //   child: Icon(
      //     Icons.play_arrow,
      //     size: 50.0,
      //   ),
      //   elevation: 10.0,
      //   foregroundColor: Colors.white,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
