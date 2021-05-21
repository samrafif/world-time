import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time_API.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


/*
LOADING SCREEN
=========================================================
This is the loading screen that will be shown for a
few seconds while the code loads the time from the API
*/

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldtime() async {
    WorldTime instance = WorldTime(location: 'Jakarta', flag: 'indonesia_flag.png', urlLoc: 'Asia/Jakarta' );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
