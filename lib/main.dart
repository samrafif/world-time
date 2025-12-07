import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/settings.dart';

void main() {
  runApp(MaterialApp(
    title: 'World Time',
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
      '/settings': (context) => Settings()
    },
  ));
}
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