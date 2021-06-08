import 'dart:convert';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bhakti/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_media_notification/flutter_media_notification.dart';

class BottomNavBar extends StatefulWidget {
  // final List<String> playlist;
  String name;
  var myFunc;
  int flag =1;
static int pIndex=-1;
  _BottomNavBarState state;
  BottomNavBar({this.name = "hanuman/",this.myFunc}) {
    state = _BottomNavBarState();

  }
  @override
  _BottomNavBarState createState() => state;

  void play(int index) {
    // if(pIndex==-1)
    //   {
    //     pIndex = index;
    //     state.play(index);
    //   }
    // else
    //   {
    //       state.play(pIndex);
    //   }
    Global.pIndex = index;
    state.play(index);

  }

  void setName(String name, String fileName) {
    state.setName(name, fileName);
  }

  void pause() {
    state.pause();
  }

  void playNext(){
    state.playNext();
  }
  void playPrev(){
    state.playPrev();
  }
}

class _BottomNavBarState extends State<BottomNavBar> {
  AudioPlayer audioPlayer;
  AudioCache audioCache;

  Duration musicLength = new Duration();
  Duration pos = new Duration();

  String prefix = "assets/bhajans/";
  String name = "hanuman/";
  String fileName = "Hanuman_Chalisa_Superfast.mp3";
  String fullPath;
  String notificationName ;


  static String prevName;
  static String currentName;

  static int currentPos =0;

  List<String> list2 = new List();
  @override
  void initState() {
    super.initState();
    prevName = currentName = name;
  }

  void loadCache() async {
    // await fetchData(context);
    await audioCache.loadAll(list2);
    //fullPath =   fileName+".mp3";
    //print(fullPath);
  }

  void musicInitialization() {
    // audioPlayer.durationHandler = (d) {
    //   if(this.mounted)
    //     {
    //       setState(() {
    //         musicLength =d;
    //       });
    //     }
    //
    // };
    //
    // audioPlayer.positionHandler = (pos) {
    //   if(this.mounted)
    //     {
    //       setState(() {
    //         this.pos = pos;
    //       });
    //     }
    //
    // };
  }

  @override
  Widget build(BuildContext context) {
    //musicInitialization();
    //loadCache();


    //this.name = widget.name ?? "hanuman/";
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.blue[300],
      child: Container(
        height: 80.0,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text("${pos.inMinutes}:${pos.inSeconds.remainder(60)}",
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                )),
          ),
          Expanded(
            child: Slider.adaptive(
                activeColor: Colors.pinkAccent,
                inactiveColor: Colors.black,
                value: pos.inSeconds.toDouble()??0, // pos==null?0:pos.inSeconds.toDouble(),
                onChanged: (value) {
                  this.setState(() {
                    Duration duration = new Duration(seconds: value.toInt());
                    audioPlayer.seek(duration);
                  });
                },
                max: musicLength.inSeconds.toDouble() //musicLength==null?0:musicLength.inSeconds.toDouble(),
                ),
          ),
          Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Text("${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(onTap:(){playPrev();},child: Icon(Icons.skip_previous_sharp, size: 45.0, color: Colors.white)),
              GestureDetector(onTap:(){playNext();},child: Icon(Icons.skip_next_sharp, size: 45.0, color: Colors.white)),
            ],
          ),
        ]),
      ),
    );
  }

  Future<void> play(int position) async {
    currentPos=position;
    int skipNum = currentPos;
    list2.clear();

    if(currentName.compareTo(prevName)==0)
    {
      if(currentName.compareTo("name")!=0)
      {
        prevName = currentName;
        currentName = name;
        // currentPos=0;
        list2.clear();
        // await fetchData(context);
      }
    }
    else {
        // currentPos=0;
          list2.clear();
          // await fetchData(context);
      }
    await fetchData(context);
    print(list2);

    audioPlayer = audioPlayer ?? AudioPlayer(mode: PlayerMode.MEDIA_PLAYER, playerId: "25812581");
    audioCache = audioCache ?? new AudioCache(prefix: prefix, fixedPlayer: audioPlayer, duckAudio: true);
    // AudioPlayer.logEnabled = true;



    fileName = list2[currentPos];
    fullPath =  fileName;
    notificationName = fullPath.substring(fullPath.lastIndexOf("/")+1,fullPath.lastIndexOf("."));



    audioCache.clearCache();

if(widget.flag==1)
  {


    audioPlayer.onDurationChanged.listen((event) {
      if (this.mounted) {
        this.setState(() {
          musicLength = event;
        });
      }
    });

    audioPlayer.onAudioPositionChanged.listen((pos) {
      if (this.mounted) {
        this.setState(() {
          this.pos = pos;
        });
      }
    });

    audioPlayer.onPlayerCompletion.listen((event) {
     playNext();
    });
  widget.flag =0;
  }
    loadCache();

    if (audioCache == null)
      print("NULL");
    else {
      MediaNotification.showNotification(title: replaceWhitespacesUsingRegex(notificationName,' '), author: 'Bhakti');

      audioCache.play(fullPath, volume: 1.0);
      return;
    }
  }

  Future<void> pause() async {
    // await assetsAudioPlayer.pause();
    MediaNotification.showNotification(title:replaceWhitespacesUsingRegex(notificationName,' '), author: 'Bhakti', isPlaying : false);
    audioPlayer.pause();
    return;
  }

  void setName(String name, String fileName) {

    // replaceWhitespacesUsingRegex(fileName, '%20');
    this.name = name+'/';
    this.fileName = fileName+'.mp3';
  }


  Future<void> fetchData(context) async {
  list2.clear();

    print("Function call main");


    final manifestJson = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    //print(manifestJson);
    int pos;
    int dotPos;
    String result;


    //print(json.decode(manifestJson).keys);
    final images = json.decode(manifestJson).keys.where((String key) => key.startsWith('assets/bhajans/${this.name}'));

    images.forEach((key) {
      //print("$key");

        if (key.toString().startsWith('assets/bhajans/${this.name}')) {
          pos = key.lastIndexOf("/");
          dotPos = key.lastIndexOf(".");
          result = (pos != -1) ? key.substring(pos + 1, dotPos) : key;
          //print(result);
          list2.add(name + result + ".mp3");
        }

    });
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


  void playNext(){
    widget.myFunc();

    //prevName = currentName;
    print(currentPos.toString()+" current pos");
    if(currentPos<list2.length-1)
    {
      currentPos++;
      currentPos = currentPos % list2.length;
      print(currentPos);
      widget.play(currentPos);
    }
    else
    {
      currentPos=0;
      widget.play(currentPos);
      print("third");

    }
  }

  void playPrev(){
    widget.myFunc();

    //prevName = currentName;
    print(currentPos);
    if(currentPos>0)
    {
      currentPos--;
      currentPos = currentPos % list2.length;
      widget.play(currentPos);
    }
    else
    {
      currentPos=list2.length-1;
      widget.play(currentPos);
    }

  }
}
