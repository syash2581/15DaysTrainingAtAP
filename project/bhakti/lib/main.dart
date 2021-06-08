import 'package:bhakti/MyHomePage.dart';
import 'package:bhakti/musicList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  // Future<PermissionStatus> permissionStatus =
  // NotificationPermissions.getNotificationPermissionStatus();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bhakti',
        theme: ThemeData(
          accentColor: Colors.pink,
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          highlightColor: Colors.pink

        ),
        home: MyHomePage(),
      routes: {
    ('/musicList')   : (context) => MusicList(),
    },);
  }
}






