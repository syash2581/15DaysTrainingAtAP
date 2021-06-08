import 'package:bhakti/BottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class GodList extends StatelessWidget {
  List<String> list;
  BottomNavBar bar;
  double deviceHeight;
  double deviceWidth;

  double lrmargin;
  double tpmargin;

  List<Widget> array = new List();

  String path = "assets/images/";


  ScrollController sc = ScrollController(
      debugLabel: "Nice",
      initialScrollOffset: 0.0,
      //this is for to save the location by which you can restore the location from 'PageStorage' to enhance efficiency
      keepScrollOffset: true
  );

  var myFunc;
  GodList(list,bar,myFunc) {
    this.list = list;
    this.bar = bar;
    this.myFunc= myFunc;
  }
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    lrmargin = deviceWidth * 0.05;

    list.forEach((element) {
      array.add(GodCard(path: path + element.toLowerCase().trim() + ".jpg", name: element.toUpperCase(),bar:bar,myFunc: myFunc,));
    });

    return Scrollbar(
      thickness: 4.5,
      isAlwaysShown: false,
      controller:sc,
      radius: Radius.circular(10.0),
      child: GridView.count(
        controller: sc,
        padding: EdgeInsets.only(left: lrmargin, right: lrmargin),
        crossAxisSpacing: lrmargin,
        mainAxisSpacing: lrmargin,
        primary: false,
        crossAxisCount: 3,
        children: array,
        addAutomaticKeepAlives: true,
        childAspectRatio: 1.0,
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}

class GodCard extends StatelessWidget {
  String path, name;
  double deviceHeight;
  double deviceWidth;
  BottomNavBar bar;

  double lrmargin;
  double tpmargin;

  var myFunc;

  GodCard({this.path, this.name,this.bar,this.myFunc});


  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    lrmargin = deviceWidth * 0.05;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context,
          "/musicList",
          arguments: {"name":name,"bar":bar,"myFunc":myFunc},
        );
      },
      child: Container(
          decoration: BoxDecoration(
              // border: Border.all(color: Colors.blueAccent,width: 2.0,style: BorderStyle.solid),
              backgroundBlendMode: BlendMode.darken,
              image: DecorationImage(
                image: AssetImage(path),
                fit: BoxFit.cover,
              ),
              color: Colors.orange,
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.white,Colors.blue],
                  // stops: [1.0, 5.0],
                  tileMode: TileMode.mirror,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              // borderRadius: BorderRadius.circular(100.0)),
              borderRadius: BorderRadius.all(Radius.circular(lrmargin * 4.5))),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                  backgroundColor: Colors.white,
                  decoration: TextDecoration.none),
            ),
          )),
    );
  }
}
