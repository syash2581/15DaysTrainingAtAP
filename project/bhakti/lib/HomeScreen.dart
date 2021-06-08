import 'package:bhakti/BottomNavBar.dart';
import 'package:bhakti/Global.dart';
import 'package:bhakti/GodList.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_media_notification/flutter_media_notification.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState state;
  HomeScreen() {
    state = _HomeScreenState();
  }
  @override
  _HomeScreenState createState() => state;
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  BuildContext context;

  static bool isPlay = false;
  IconData _icon = Icons.play_arrow;

  Random random = new Random();
  int textureId;

  BoxDecoration boxDecoration = new BoxDecoration(
      color: Colors.white,
      backgroundBlendMode: BlendMode.darken,
      image: DecorationImage(image: AssetImage('assets/texture/texture/texture1.toString().jpg'), fit: BoxFit.cover, alignment: Alignment.center),
      gradient: LinearGradient(
          colors: [Colors.blue, Colors.white],
          // stops: [1.0, 5.0],
          tileMode: TileMode.mirror,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter));

  BottomNavBar bar2;

  List<String> list = [
    "SHIVA",
    "HANUMAN",
    "SHRINATHJI",
    "AMBEMA",
    "GANPATI",
    "RAMA",
    "SAIBABA",
    "LOKGEET",
  ];
  // List<String> list = new List.generate(50, (index) => "this is item" + (index + 1).toString());
  void changeTheme() {
    random = new Random();

    textureId = random.nextInt(11) + 1;
    this.setState(() {
      boxDecoration = new BoxDecoration(
          color: Colors.white,
          backgroundBlendMode: BlendMode.darken,
          image: DecorationImage(
            image: AssetImage('assets/texture/texture' + textureId.toString() + '.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          gradient: LinearGradient(
              colors: [Colors.white70, Colors.white],
              // stops: [1.0, 5.0],
              tileMode: TileMode.mirror,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter));
    });
  }

  @override
  void initState() {
    super.initState();

    bar2 = Global.bar ??
        new BottomNavBar(
            name: this.list[1].toLowerCase() + '/',
            myFunc: () {
              setState(() {
                if (isPlay) {
                } else {
                  isPlay = true;
                  _icon = Icons.pause;
                }
              });
            });
    Global.bar = bar2;

    MediaNotification.setListener('play', () {
      bar2.play(Global.pIndex);
      setState(() {
        if (isPlay) {
          isPlay = false;
          _icon = Icons.play_arrow;
        } else {
          isPlay = true;
          _icon = Icons.pause;
        }
      });
    });
    MediaNotification.setListener('pause', () {
      bar2.pause();
      setState(() {
        if (isPlay) {
          isPlay = false;
          _icon = Icons.play_arrow;
        } else {
          isPlay = true;
          _icon = Icons.pause;
        }
      });
    });

    MediaNotification.setListener('next', () {
      bar2.playNext();
    });

    MediaNotification.setListener('prev', () {
      bar2.playPrev();
    });

    // MediaNotification.setListener('select', () {});

    changeTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      //these events are in order after pressing home or recent button.
      case AppLifecycleState.inactive:
        print('In inactive');
        break;
      case AppLifecycleState.paused:
        print('In pause');
        break;
      case AppLifecycleState.resumed:
        //print('In resume');

        changeTheme();
        break;
      case AppLifecycleState.detached:
        print('In detached');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text("BHAKTI APP", style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true, elevation: 3.00, shadowColor: Colors.grey),
        body: Builder(
          builder: (context) => Center(
            child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: Duration(seconds: 1),
                decoration: boxDecoration,
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: GodList(list, bar2, () {
                  setState(() {
                    if (isPlay) {
                    } else {
                      isPlay = true;
                      _icon = Icons.pause;
                    }
                  });
                })),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (bar2 == null) {
              bar2 = new BottomNavBar(name: this.list[1] + '/');
              Global.bar = bar2;
              bar2.play(Global.pIndex);
              this.setState(() {
                isPlay = true;
                _icon = Icons.pause;
              });
            } else {
              if (isPlay) {
                this.setState(() {
                  isPlay = false;
                  _icon = Icons.play_arrow;
                });
                bar2.pause();
              } else {
                this.setState(() {
                  isPlay = true;
                  _icon = Icons.pause;
                });
                bar2.play(Global.pIndex);
              }
            }
          },
          child: Icon(
            _icon,
            size: 50.0,
          ),
          elevation: 5.0,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBar: Global.bar,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
