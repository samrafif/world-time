import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time_API.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// # [01:22.201] Rebooting soon as I am a-a-able
// # [01:26.109] Every other day, I'm wonderin'
// # [01:29.834] "What's a human being gotta be like?
// # [01:33.659] What's a way to just be competent?"
// # [01:36.774] These sweet instincts ruin my life
// # [01:39.585] Every other day, I'm wonderin'
// # [01:43.681] "Was it a mistake to try and define
// # [01:47.559] What I'm certain's mad incompetence?"
// # [01:51.097] These sweet instincts ruin my life
// # [01:54.676] Da-da-da-da-da-da, da-da-da
// # [01:58.222] Da-da-da-da-da-da, da-da-da, da
// # [02:01.822] Da-da-da-da-da-da, da-da-da
// # [02:05.255] These sweet instincts ruin my life
// # [02:08.919] Da-da-da-da-da-da, da-da-da
// # [02:12.476] Da-da-da-da-da-da, da-da-da, da
// # [02:15.967] Da-da-da-da-da-da, da-da-da
// # [02:19.526] These sweet instincts ruin my life

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
