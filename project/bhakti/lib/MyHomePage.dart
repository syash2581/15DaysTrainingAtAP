import 'package:bhakti/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      //appBar: AppBar(title: Text("Bhakti App"),centerTitle: true,elevation: 3.00,shadowColor: Colors.grey),
      body: SplashScreen(
        backgroundColor: Colors.black,
        photoSize: 150.0,
        image: Image.asset('assets/loading.gif'),
        loaderColor: Colors.white,
        loadingText: Text('Loading...'),
        seconds: 7,
        navigateAfterSeconds: HomeScreen(),
        useLoader: true,
      ),
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    // ));
    super.initState();
  }
}