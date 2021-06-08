import 'package:bhakti/Global.dart';
import 'package:flutter/material.dart';


class BhajanList extends StatelessWidget {
  List<String> list = new List();
   
  String rootPath = "assets/images/";
  String path;
  String name;

  double deviceHeight;
  double deviceWidth;

  double lrmargin;
  double tpmargin;

  var myFunc;

  BhajanList({this.name,this.list,this.myFunc}){
   path = rootPath+this.name+".jpg";
  }

  @override
  Widget build(BuildContext context) {
  print(list);
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    lrmargin = deviceWidth * 0.05;
    return Scrollbar(
      thickness: 4.5,
      isAlwaysShown: false,
      radius: Radius.circular(10.0),
      child: ListView.builder(
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            shadowColor: Colors.grey,
            margin: EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0),
            borderOnForeground: true,
            color: Colors.orangeAccent,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 18.0),
              child: ListTile(
                // title: Container(
                //   width: 100,
                //   height: 50,
                //   child: Marquee(
                //     text: replaceWhitespacesUsingRegex(list[index],' '),
                //     scrollAxis: Axis.horizontal,
                //     startPadding: 10.0,
                //     startAfter: Duration(seconds: 1),
                //     blankSpace: 17,
                //     pauseAfterRound: Duration(seconds: 2),
                //   ),
                // ),
                title:Text(replaceWhitespacesUsingRegex(list[index],' ')),
                dense: false,
                leading: Container(
                  height: lrmargin*3.0,
                  width: lrmargin*3.0,
                  decoration: BoxDecoration(
                      //backgroundBlendMode: BlendMode.darken,
                      image: DecorationImage(
                        image: AssetImage(path),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(lrmargin*4.5))),
                ),
                trailing: GestureDetector(
                  onTap: (){
                    Global.bar.setName(name, list[index]);
                    myFunc();
                    Global.bar.play(index);
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.play_arrow),
                    backgroundColor: Colors.white,
                  ),
                ) ,

                contentPadding: EdgeInsets.all(2.0),
                selectedTileColor: Colors.blue,
                onTap: () => {},
              ),
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }

  String replaceWhitespacesUsingRegex(String s, String replace) {
    if (s == null) {
      return null;
    }

    // This pattern means "at least one space, or more"
    // \\s : space
    // +   : one or more
    final pattern = RegExp('\\_+');
    return s.replaceAll(pattern, replace);
  }
}
